import { OpenExternalFunc } from "@back/types";
import { ShowMessageBoxFunc } from "@shared/back/types";
import { IAdditionalApplicationInfo, IGameInfo } from "@shared/game/interfaces";
import { ExecMapping } from "@shared/interfaces";
import { Command, createCommand } from "@shared/mappings/CommandMapping";
import { IAppCommandsMappingData } from "@shared/mappings/interfaces";
import {
    fixSlashes,
    getFilename,
    padStart,
    stringifyArray,
} from "@shared/Util";
import { ChildProcess, exec, execSync } from "child_process";
import { EventEmitter } from "events";
import * as fs from "fs";
import * as path from "path";

export type LaunchAddAppOpts = LaunchBaseOpts & {
    addApp: IAdditionalApplicationInfo;
    native: boolean;
};

export type LaunchGameOpts = LaunchBaseOpts & {
    game: IGameInfo;
    addApps?: IAdditionalApplicationInfo[];
    native: boolean;
};

type LaunchBaseOpts = {
    fpPath: string;
    execMappings: ExecMapping[];
    mappings: IAppCommandsMappingData;
    openDialog: ShowMessageBoxFunc;
    openExternal: OpenExternalFunc;
};

// @TODO we probably doesn't need seperate launch functions for add apps, setup, etc.
// Only one function to launch file with mapper for different file types
export namespace GameLauncher {
    const logSource = "Game Launcher";

    export function launchCommand(
        appPath: string,
        appArgs: string,
        mappings: IAppCommandsMappingData,
    ): Promise<void> {
        const command = createCommand(appPath, appArgs, mappings);
        const proc = exec(command.command, { cwd: command.cwd });
        logProcessOutput(proc);
        log(logSource, `Launch command (PID: ${proc.pid}) [ path: "${appPath}", arg: "${appArgs}", command: ${command} ]`);
        return new Promise((resolve, reject) => {
            if (proc.killed) {
                resolve();
            } else {
                proc.once("exit", () => {
                    resolve();
                });
                proc.once("error", (error) => {
                    reject(error);
                });
            }
        });
    }

    export async function launchAdditionalApplication(
        opts: LaunchAddAppOpts
    ): Promise<void> {
        // @FIXTHIS It is not possible to open dialog windows from the back process (all electron APIs are undefined).
        switch (opts.addApp.applicationPath) {
            case ":message:": {
                opts.openDialog({
                    type: "info",
                    title: "About This Game",
                    message: opts.addApp.launchCommand,
                    buttons: ["Ok"],
                });
                break;
            }
            case ":extras:": {
                const folderPath = fixSlashes(
                    path.join(
                        opts.fpPath,
                        path.posix.join("Extras", opts.addApp.launchCommand)
                    )
                );
                return opts
                .openExternal(folderPath, { activate: true })
                .catch((error) => {
                    if (error) {
                        opts.openDialog({
                            type: "error",
                            title: "Failed to Open Extras",
                            message:
                                    `${error.toString()}\n` +
                                    `Path: ${folderPath}`,
                            buttons: ["Ok"],
                        });
                    }
                });
            }
            default: {
                const appPath: string = fixSlashes(
                    path.join(
                        opts.fpPath,
                        getApplicationPath(
                            opts.addApp.applicationPath,
                            opts.execMappings,
                            opts.native
                        )
                    )
                );
                const appArgs: string = opts.addApp.launchCommand;
                return launchCommand(appPath, appArgs, opts.mappings);
            }
        }
    }

    /**
     * Launch a game
     * @param game Game to launch
     */
    export async function launchGame(opts: LaunchGameOpts): Promise<void> {
        // Abort if placeholder (placeholders are not "actual" games)
        if (opts.game.placeholder) {
            return;
        }
        // Run all provided additional applications with "AutoRunBefore" enabled
        if (opts.addApps) {
            const addAppOpts: Omit<LaunchAddAppOpts, "addApp"> = {
                fpPath: opts.fpPath,
                native: opts.native,
                execMappings: opts.execMappings,
                mappings: opts.mappings,
                openDialog: opts.openDialog,
                openExternal: opts.openExternal,
            };
            for (const addApp of opts.addApps) {
                if (addApp.autoRunBefore) {
                    const promise = launchAdditionalApplication({
                        ...addAppOpts,
                        addApp,
                    });
                    if (addApp.waitForExit) {
                        await promise;
                    }
                }
            }
        }
        // Launch game
        const gamePath: string = fixSlashes(
            path.join(
                opts.fpPath,
                getApplicationPath(
                    opts.game.applicationPath,
                    opts.execMappings,
                    opts.native
                )
            )
        );
        const gameArgs: string = opts.game.launchCommand;

        let command: Command;
        try {
            command = createCommand(gamePath, gameArgs, opts.mappings);
        } catch (e) {
            log(logSource, `Launch Game "${opts.game.title}" failed. Error: ${e}`);
            return;
        }

        const proc = exec(command.command, { cwd: command.cwd });
        logProcessOutput(proc);
        log(logSource, `Launch Game "${opts.game.title}" (PID: ${proc.pid}) [\n` +
            `    applicationPath: "${opts.game.applicationPath}",\n` +
            `    launchCommand:   "${opts.game.launchCommand}",\n` +
            `    command:         "${command}" ]`);
    }

    /**
     * Launch a game setup/install
     * For eXoDOS Lite: Extract the game from ZIP if game folder doesn't exist
     * For full eXoDOS: Run the install script
     */
    export async function launchGameSetup(opts: LaunchGameOpts): Promise<void> {
        // Get the game's directory path from applicationPath
        // e.g., "eXo\eXoDOS\!dos\DOOM\DOOM.bat" -> "eXo/eXoDOS/!dos/DOOM"
        const appPath = fixSlashes(opts.game.applicationPath);
        const gameDir = path.dirname(appPath);
        const fullGameDir = path.join(opts.fpPath, gameDir);

        // Check if game folder exists
        if (!fs.existsSync(fullGameDir)) {
            log(logSource, `Game folder not found: ${fullGameDir}`);

            // Try to find and extract ZIP file (eXoDOS Lite)
            const extracted = await tryExtractGameZip(opts.fpPath, opts.game, opts.openDialog);
            if (!extracted) {
                opts.openDialog({
                    type: "info",
                    title: "Game Not Installed",
                    message: `Could not find or extract the game "${opts.game.title}".\n\nFor eXoDOS Lite, make sure you have the game's ZIP file in the eXo/eXoDOS folder.`,
                    buttons: ["Ok"],
                });
                return;
            }
        }

        // Launch game setup/install script if it exists
        const installScript = process.platform === "win32" ? "install.bat" : "install.bsh";
        const setupPath = opts.game.applicationPath.replace(
            getFilename(opts.game.applicationPath),
            installScript
        );
        const gamePath: string = fixSlashes(
            path.join(
                opts.fpPath,
                getApplicationPath(setupPath, opts.execMappings, opts.native)
            )
        );

        // Check if install script exists
        if (!fs.existsSync(gamePath)) {
            log(logSource, `Install script not found: ${gamePath}`);
            opts.openDialog({
                type: "info",
                title: "Game Extracted",
                message: `The game "${opts.game.title}" has been extracted and is ready to play!`,
                buttons: ["Ok"],
            });
            return;
        }

        const gameArgs: string = opts.game.launchCommand;
        const command = createCommand(
            gamePath,
            gameArgs,
            opts.mappings
        );

        const proc = exec(command.command, { cwd: command.cwd });
        logProcessOutput(proc);
        log(logSource, `Launch Game Setup "${opts.game.title}" (PID: ${proc.pid}) [\n` +
            `    applicationPath: "${opts.game.applicationPath}",\n` +
            `    launchCommand:   "${opts.game.launchCommand}",\n` +
            `    command:         "${command}" ]`);
    }

    /**
     * Try to find and extract a game's ZIP file (for eXoDOS Lite)
     * @returns true if extraction succeeded, false otherwise
     */
    async function tryExtractGameZip(
        fpPath: string,
        game: IGameInfo,
        openDialog: ShowMessageBoxFunc
    ): Promise<boolean> {
        // Look for ZIP files in eXo/eXoDOS folder
        const exodosFolder = path.join(fpPath, "eXo", "eXoDOS");

        if (!fs.existsSync(exodosFolder)) {
            log(logSource, `eXoDOS folder not found: ${exodosFolder}`);
            return false;
        }

        // Try to find ZIP file matching the game title
        const gameTitle = game.title;
        const possibleZipNames = [
            `${gameTitle}.zip`,
            `${gameTitle.replace(/[/:*?"<>|]/g, "")}.zip`, // Remove invalid chars
        ];

        let zipPath: string | undefined;

        // Search for the ZIP file
        try {
            const files = fs.readdirSync(exodosFolder);
            for (const file of files) {
                if (file.toLowerCase().endsWith(".zip")) {
                    // Check if filename matches game title (case-insensitive)
                    const baseName = file.slice(0, -4); // Remove .zip
                    if (possibleZipNames.some(n => n.toLowerCase() === file.toLowerCase()) ||
                        baseName.toLowerCase().includes(gameTitle.toLowerCase()) ||
                        gameTitle.toLowerCase().includes(baseName.toLowerCase())) {
                        zipPath = path.join(exodosFolder, file);
                        break;
                    }
                }
            }
        } catch (e) {
            log(logSource, `Error searching for ZIP: ${e}`);
            return false;
        }

        if (!zipPath) {
            log(logSource, `No ZIP file found for game: ${gameTitle}`);
            return false;
        }

        log(logSource, `Found ZIP file: ${zipPath}`);

        // Get 7za path
        const sevenZaPath = get7zaPath(fpPath);
        if (!sevenZaPath || !fs.existsSync(sevenZaPath)) {
            log(logSource, `7za not found at: ${sevenZaPath}`);
            return false;
        }

        // Extract the ZIP file
        try {
            log(logSource, `Extracting ${zipPath} to ${exodosFolder}`);
            execSync(`"${sevenZaPath}" x -y -o"${exodosFolder}" "${zipPath}"`, {
                stdio: "pipe",
                timeout: 300000, // 5 minute timeout
            });
            log(logSource, `Extraction completed for ${gameTitle}`);
            return true;
        } catch (e) {
            log(logSource, `Extraction failed: ${e}`);
            return false;
        }
    }

    /**
     * Get the path to 7za executable
     */
    function get7zaPath(fpPath: string): string | undefined {
        // Try to find 7za in extern folder (relative to exogui, not fpPath)
        const possiblePaths: string[] = [];

        switch (process.platform) {
            case "darwin":
                possiblePaths.push(
                    path.join(process.cwd(), "extern", "7zip-bin", "mac", "7za"),
                    "/usr/local/bin/7za",
                    "/opt/homebrew/bin/7za"
                );
                break;
            case "linux":
                possiblePaths.push(
                    path.join(process.cwd(), "extern", "7zip-bin", "linux", process.arch, "7za"),
                    "/usr/bin/7za",
                    "/usr/local/bin/7za"
                );
                break;
            case "win32":
                possiblePaths.push(
                    path.join(process.cwd(), "extern", "7zip-bin", "win", process.arch, "7za.exe")
                );
                break;
        }

        for (const p of possiblePaths) {
            if (fs.existsSync(p)) {
                return p;
            }
        }

        return undefined;
    }

    /**
     * The paths provided in the Game/AdditionalApplication XMLs are only accurate
     * on Windows. So we replace them with other hard-coded paths here.
     */
    function getApplicationPath(
        filePath: string,
        execMappings: ExecMapping[],
        native: boolean
    ): string {
        const platform = process.platform;

        // Bat files won't work on Wine, force a .bsh file on non-Windows platforms instead.
        // The .bsh files have built-in macOS detection that sources .msh files on darwin.
        if (platform !== "win32" && filePath.endsWith(".bat")) {
            return filePath.substring(0, filePath.length - 4) + ".bsh";
        }

        // Skip mapping if on Windows or Native application was not requested
        if (platform !== "win32" && native) {
            for (let i = 0; i < execMappings.length; i++) {
                const mapping = execMappings[i];
                if (mapping.win32 === filePath) {
                    switch (platform) {
                        case "linux":
                            return mapping.linux || mapping.win32;
                        case "darwin":
                            return mapping.darwin || mapping.win32;
                        default:
                            return filePath;
                    }
                }
            }
        }

        // No Native exec found, return Windows/XML application path
        return filePath;
    }

    function logProcessOutput(proc: ChildProcess): void {
        // Log for debugging purposes
        // (might be a bad idea to fill the console with junk?)
        const logStuff = (event: string, args: any[]): void => {
            log(logSource, `${event} (PID: ${padStart(
                proc.pid ?? -1,
                5
            )}) ${stringifyArray(args, stringifyArrayOpts)}`);
        };
        doStuffs(
            proc,
            [/* 'close', */ "disconnect", "error", "exit", "message"],
            logStuff
        );
        if (proc.stdout) {
            proc.stdout.on("data", (data) => {
                logStuff("stdout", [data.toString("utf8")]);
            });
        }
        if (proc.stderr) {
            proc.stderr.on("data", (data) => {
                logStuff("stderr", [data.toString("utf8")]);
            });
        }
    }
}

const stringifyArrayOpts = {
    trimStrings: true,
};

function doStuffs(
    emitter: EventEmitter,
    events: string[],
    callback: (event: string, args: any[]) => void
): void {
    for (let i = 0; i < events.length; i++) {
        const e: string = events[i];
        emitter.on(e, (...args: any[]) => {
            callback(e, args);
        });
    }
}
