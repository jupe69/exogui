# macOS Port for exogui

This document describes the macOS port of exogui, the changes made, and remaining work.

## Status: Work in Progress

The macOS port is functional with the full eXoDOS version. eXoDOS Lite is partially supported but its torrent-based download system doesn't work on macOS.

## Completed Features

### 1. VLC Player Integration
- Added macOS support for background music playback
- Uses system VLC or Homebrew-installed VLC
- File: `src/back/vlc/VLCPlayer.ts`

### 2. Platform-Specific Command Mappings
- Added `darwin` mappings for all file types in `mappings.json`
- Media files: IINA or system player
- Documents: Preview, TextEdit, Numbers
- Shell scripts: Terminal.app
- Executables: Wine (if installed)

### 3. Terminal.app Integration for Shell Scripts
- Shell scripts (.sh, .bsh, .msh, .command) now open in Terminal.app
- Uses osascript to open a new Terminal window
- File: `src/shared/mappings/CommandMapping.ts`

### 4. macOS Script Support (.msh files)
- eXoDOS uses .bsh scripts that source .msh files on macOS
- Added automatic copying of shared `install.msh` from `eXo/util/` to game directories
- File: `src/back/game/GameLauncher.ts`

### 5. Path Detection Fixes
- Added `EXODOS_PATH` environment variable support
- Fixed path detection for packaged apps vs dev mode
- Files: `src/back/index.ts`, `src/main/Main.ts`, `src/main/Util.ts`

### 6. Install Button Fix
- Install button now correctly calls `onGameLaunchSetup` for non-installed games
- File: `src/renderer/components/RightBrowseSidebar.tsx`

### 7. 7-Zip Binary Path
- Added macOS path for 7za binary (`extern/7zip-bin/mac/7za`)
- File: `src/renderer/util/SevenZip.ts`

### 8. Helper Scripts
- `start_exogui.command` - Launch script that sets EXODOS_PATH
- `macos_install_game.command` - Manual game installation helper
- `macos_merge_exodos.command` - Merge multiple eXoDOS sources

## Known Limitations

### eXoDOS Lite Download System
The Lite version's torrent-based game download doesn't work on macOS. The install scripts detect macOS and try to download, but the underlying download mechanism is Windows-only.

**Workaround:** Use the full eXoDOS version where games are pre-downloaded.

### Wine Dependency
Running DOS games requires Wine. Install via Homebrew:
```bash
brew install --cask wine-stable
```

### Bash Version
Some eXoDOS scripts require Bash 5+. macOS ships with Bash 3. Install newer Bash:
```bash
brew install bash
```

## Running on macOS

### Development Mode
```bash
cd /path/to/exogui
EXODOS_PATH="/path/to/eXoDOS" npm run start
```

### Using the Launch Script
1. Copy `start_exogui.command` to your eXoDOS folder
2. Edit it to set the correct path to exogui
3. Double-click to launch

## Directory Structure Expected

```
eXoDOS/                          # EXODOS_PATH points here
├── eXo/
│   ├── eXoDOS/                  # Game folders
│   │   └── !dos/
│   │       └── GAMENAME/
│   │           ├── GAME.bat     # (converted to .bsh on macOS)
│   │           ├── install.bsh
│   │           └── install.msh  # (copied from util/ automatically)
│   └── util/
│       ├── install.bsh
│       ├── install.msh          # Shared macOS install script
│       ├── launch.bsh
│       └── launch.msh
├── Data/
│   ├── Platforms/
│   │   └── MS-DOS.xml
│   └── Platforms.xml
├── Images/
├── Videos/
└── Manuals/
```

## Testing Checklist

- [ ] App launches without errors
- [ ] Games list loads from MS-DOS.xml
- [ ] Game images display correctly
- [ ] Install button opens Terminal for non-installed games
- [ ] Play button launches games (requires Wine)
- [ ] Setup button opens game configuration
- [ ] Background music plays (requires VLC)
- [ ] File associations work (manuals, videos, etc.)

## Next Steps

1. **Test with full eXoDOS** - Verify all features work with pre-downloaded games
2. **Wine integration testing** - Test actual game launching via Wine
3. **Package as .app** - Create distributable macOS application bundle
4. **Code signing** - Sign app for Gatekeeper compatibility

## Files Modified for macOS Support

- `src/back/index.ts` - EXODOS_PATH handling
- `src/back/vlc/VLCPlayer.ts` - macOS VLC paths
- `src/back/game/GameLauncher.ts` - .msh file copying, launchGameSetup
- `src/main/Main.ts` - macOS base path detection
- `src/main/Util.ts` - getMainFolderPath for macOS
- `src/shared/mappings/CommandMapping.ts` - Terminal.app for scripts
- `src/renderer/util/SevenZip.ts` - macOS 7za path
- `src/renderer/components/RightBrowseSidebar.tsx` - Install button logic
- `mappings.json` - darwin command mappings
- `start_exogui.command` - Launch helper script
- `macos_install_game.command` - Manual install helper
- `macos_merge_exodos.command` - Merge helper
