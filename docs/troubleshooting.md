# Troubleshooting Guide

This document provides solutions to common issues you may encounter when developing or running exogui.

## Build and Development Issues

### "Not allowed to load local resource" Error

**Problem:** This error appears in the Electron application console.

**Example:**

```
Not allowed to load local resource: file:///<ProjectPath>/build/renderer/index.html
```

**Solution:**
This error typically occurs because the built files don't exist. Run the build process:

```bash
npm run build
```

This will generate all necessary files in the `./build/` directory.

---

### Build Issues

**Problem:** Build fails or dependencies are missing.

**Solutions:**

1. **Ensure dependencies are installed:**

    ```bash
    npm install
    ```

2. **If using submodules, clone correctly:**

    ```bash
    git clone --recurse-submodules https://github.com/margorski/exodos-launcher launcher
    ```

    If you already cloned without submodules:

    ```bash
    git submodule update --init --recursive
    ```

3. **Check Node.js version compatibility:**

    - See `package.json` for required Node.js version
    - Update Node.js if necessary

4. **Clear build cache:**
    ```bash
    rm -rf build/
    rm -rf node_modules/
    npm install
    npm run build
    ```

---

## Application Runtime Issues

### Application Won't Start

**Problem:** exogui fails to launch or crashes immediately.

**Solutions:**

1. **Check if build files exist:**

    ```bash
    ls build/
    ```

    If empty or missing, run `npm run build`

2. **Check for port conflicts:**

    - Default backend port range: 12001-12100
    - Default file server port range: 12101-12200
    - See [config.md](config.md) for changing port ranges

3. **Check logs:**
    - Look for error messages in the terminal
    - Check the developer console in the Electron app (Ctrl+Shift+I or Cmd+Option+I)

---

### Games Not Loading

**Problem:** No games appear in the launcher.

**Solutions:**

1. **Verify eXoDOS path in config.json:**

    - Check that `exodosPath` points to your eXoDOS installation
    - Example: `"/home/user/Games/eXoDOS/"`

2. **Check platform data:**

    - Verify `platformFolderPath` contains `Platforms.xml`
    - Verify platform XML files exist (e.g., `MS-DOS.xml`, `Win3x.xml`)

3. **Check file permissions:**

    - Ensure exogui has read access to the eXoDOS directory
    - On Linux/macOS: `chmod -R +r /path/to/eXoDOS`

4. **Restart exogui:**
    - Close and restart the application after config changes

For more details on configuration, see [config.md](config.md).

---

### Wrong Data Path Being Used

**Problem:** exogui looks for data files in the wrong directory (e.g., `/Games/Data/` instead of `/Games/eXoDOS/Data/`).

**Solutions:**

1. **Use the EXODOS_PATH environment variable:**

    This overrides the automatic path detection. Set it to your eXoDOS folder:

    ```bash
    # macOS/Linux
    export EXODOS_PATH="/path/to/eXoDOS"
    npm run start

    # Or in one line:
    EXODOS_PATH="/path/to/eXoDOS" npm run start
    ```

2. **Use the start_exogui.command script (macOS):**

    Copy `start_exogui.command` to your eXoDOS folder and double-click it. The script automatically sets EXODOS_PATH to its location.

3. **Set absolute path in config.json:**

    If exogui and eXoDOS are in separate folders, edit `config.json` in the exogui folder:

    ```json
    {
        "exodosPath": "/absolute/path/to/eXoDOS/"
    }
    ```

4. **Run from the eXoDOS folder:**

    Navigate to the eXoDOS folder and run exogui from there:

    ```bash
    cd /path/to/eXoDOS
    EXODOS_PATH="$(pwd)" npm --prefix /path/to/exogui run start
    ```

**Why this happens:** When running with `npm --prefix`, npm changes the working directory before launching Electron. The `EXODOS_PATH` environment variable ensures the correct path is used regardless of where npm runs from.

---

### Images/Screenshots Not Displaying

**Problem:** Game images and screenshots don't load.

**Solutions:**

1. **Check image folder path:**

    - Verify `imageFolderPath` in `config.json`
    - Default: `"Images"` (relative to `exodosPath`)

2. **Check file server:**

    - Ensure no port conflicts with `imagesPortMin`/`imagesPortMax`
    - Check browser console for HTTP errors (F12)

3. **Verify image files exist:**
    - Check that image files are in the correct directory
    - Verify file permissions allow reading

---

## macOS-Specific Issues

### Prerequisites for macOS

Before running exogui on macOS, ensure you have the following installed:

1. **VLC Media Player** (optional, for background music):
   - Download from [videolan.org](https://www.videolan.org/vlc/) or install via Homebrew:
     ```bash
     brew install vlc
     ```

2. **Wine** (required for running Windows executables like foobar2000):
   - Install via Homebrew:
     ```bash
     brew install wine-stable
     ```
   - Or use [CrossOver](https://www.codeweavers.com/crossover) for a more user-friendly experience

3. **DOSBox** (if using native DOSBox instead of bundled):
   - Download from [dosbox.com](https://www.dosbox.com/download.php?main=1)
   - Or install via Homebrew:
     ```bash
     brew install dosbox
     ```

### VLC Not Working

**Problem:** Music doesn't play when browsing games.

**Solutions:**

1. **Check VLC is installed** in one of these locations:
   - `/Applications/VLC.app/Contents/MacOS/VLC`
   - `/opt/homebrew/bin/vlc` (Homebrew on Apple Silicon)
   - `/usr/local/bin/vlc` (Homebrew on Intel)

2. **Verify VLC is accessible:**
   ```bash
   vlc --version
   ```

3. **Check console output** for VLC initialization messages when starting exogui

### File Associations Not Working

**Problem:** Documents, videos, or other files don't open.

**Solution:** The default macOS mappings use native apps like Preview, Safari, and TextEdit. If you have custom applications installed (like IINA for video), you can modify `mappings.json`. See [mappings.md](mappings.md) for details.

### App Not Opening (Gatekeeper)

**Problem:** macOS shows "exogui is damaged and can't be opened" or similar.

**Solutions:**

1. **Remove quarantine attribute:**
   ```bash
   xattr -cr /Applications/exogui.app
   ```

2. **Allow in System Settings:**
   - Go to System Settings → Privacy & Security
   - Click "Open Anyway" for exogui

### Building from Source on macOS

1. **Install Xcode Command Line Tools:**
   ```bash
   xcode-select --install
   ```

2. **Install Node.js:**
   ```bash
   brew install node
   ```

3. **Clone and build:**
   ```bash
   git clone --recurse-submodules https://github.com/exogui/exogui
   cd exogui
   npm install
   npm run build
   npm run start
   ```

### Packaging for macOS

**For Intel Macs:**
```bash
npm run release:darwin
```

**For Apple Silicon (M1/M2/M3):**
```bash
npm run release:m1
```

The packaged app will be in `./dist/` as a `.dmg` file.

---

## Port Conflicts

**Problem:** Application fails to start with "Port already in use" error.

**Solutions:**

1. **Check what's using the ports:**

    ```bash
    # Linux/macOS
    lsof -i :12001-12200

    # Windows
    netstat -ano | findstr "12001"
    ```

2. **Change port ranges in config.json:**

    ```json
    {
        "backPortMin": 15001,
        "backPortMax": 15100,
        "imagesPortMin": 15101,
        "imagesPortMax": 15200
    }
    ```

3. **Restart exogui** after changing configuration

See [config.md](config.md#network-configuration) for more details.

---

## Getting Help

If you continue to experience issues:

1. **Check existing documentation:**

    - [README.md](../README.md) - Project overview
    - [architecture.md](architecture.md) - Technical architecture
    - [config.md](config.md) - Configuration reference

2. **Search or ask on Discord:**

    - [exogui discord](https://discord.gg/srHzx9HS) - exogui-specific issues
    - [eXoDOS Discord](https://www.retro-exo.com/community.html) - General eXoDOS support

3. **Report bugs:**
    - Check [GitHub Issues](https://github.com/exogui/exogui-launcher/issues)
    - Create a new issue with:
        - Operating system and version
        - Node.js version
        - Steps to reproduce
        - Error messages or logs
