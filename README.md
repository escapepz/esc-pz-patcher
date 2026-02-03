# ESC PZ Patcher

_Note: ~~This Workshop version is provided for quick download and easy access to the latest patcher scripts.~~_

**Now requires to be enabled in-game to use certain engine-level methods.**

## Features & Fixes

**ESC PZ Patcher** is a technical utility designed to patch Project Zomboid's core Java classes (**projectzomboid.jar**). It addresses several engine-level limitations and introduces specific fixes:

- **Chunk Loading:** Patches the chunk downloader on login to remove timeouts, helping players with slow or unstable connections avoid the "Failed to Download Map" error.
- **Zoom Levels:** Adds additional zoom levels. Ensure they are enabled in the settings. _Caution: excessive zooming out can significantly reduce FPS._
- **Radio Interference:** Completely removes radio interference caused by range limits or adverse weather conditions.

### B42 Only

- **PlayerCraftHistory:** Server-side patch to prevent bloated player saves by VOIDING crafting history saves.
- **RenderLessZombie** - reworked.
- **ChunkGridConfig a.k.a BetterFPS** - Vanilla Enabled.

---

## Compatibility

**Support:** Windows / Mac / Linux

**Tested on Windows 10**

- **Windows 10:** 100% Compatible with all versions (from the initial Build 1507 to the latest 22H2).
- **Windows 11:** 100% Compatible.
- **Windows 7 / 8.1:** Works only if the user has .NET Framework 4.5 or higher and PowerShell 3.0 or higher installed.
- **Dual Version Store:** Includes dedicated patches for both the latest **Build 42.13.2** and the stable **Build 41 (Common)**. _(B41 version is currently untested)_

---

## Security & Trust

**Beware:** this runs on your computer as a script/program. Please note that any Java mod or patch from a malicious author can damage your computer.

- **Disclaimer:** This tool is provided "as is". Modifying core game files (**.jar**) carries inherent risks. The author is not responsible for any data loss, save corruption, or system issues. Always ensure you have backups.
- **Transparency:** The source code is available for audit.
- **Stay Safe:** Trust no one—verify the **.cmd** or **.sh** files using **VirusTotal** or anti-virus programs before running. This is standard safe practice.

---

## How to use

Since this mod modifies the game's executable JAR file, it requires a manual step:

1. **Step 1:** Locate the mod directory in your Steam Workshop folder:
   `.../steamapps/workshop/content/108600/<WorkshopID>/mods/esc_pz_patcher/`
2. **Step 2:** Choose the folder corresponding to your game version (**common** for B41 or **42.13.2** for B42).
3. **Step 3:** Rename the script file for your OS by removing the **.bak** extension (e.g., rename **v42.13.2.cmd.bak** to **v42.13.2.cmd** on Windows, or **.sh.bak** to **.sh** on Mac/Linux).
4. **Step 4:** Ask your AI assistant how to run the script. Ask if this file SAFE TO RUN.
5. **Step 5:** The patcher will automatically detect your game path, create a backup **projectzomboid.jar.bak**, and apply the patches.

_Note: You must re-run the patcher if Steam updates the game or verifies files._
