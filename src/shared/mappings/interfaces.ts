/**
 * Platform-specific command strings.
 * If a string is provided, it's used for all platforms.
 * If an object is provided, the platform-specific command is used.
 */
export type PlatformCommand = string | {
    win32?: string;
    linux?: string;
    darwin?: string;
};

export type ICommandMapping = {
    extensions: string[];
    command: PlatformCommand;
    includeFilename: true;
    includeArgs: true;
};

export type IAppCommandsMappingData = {
    defaultMapping: ICommandMapping;
    commandsMapping: ICommandMapping[];
};

/**
 * Get the command string for the current platform from a PlatformCommand.
 */
export function getPlatformCommand(cmd: PlatformCommand): string | undefined {
    if (typeof cmd === "string") {
        return cmd;
    }
    switch (process.platform) {
        case "win32":
            return cmd.win32;
        case "linux":
            return cmd.linux;
        case "darwin":
            return cmd.darwin ?? cmd.linux; // Fall back to linux if darwin not specified
        default:
            return undefined;
    }
}

export const DefaultCommandMapping: ICommandMapping = {
    command: {
        win32: "start",
        linux: "xdg-open",
        darwin: "open"
    },
    extensions: [],
    includeArgs: true,
    includeFilename: true,
};
