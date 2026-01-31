@echo off

:: --- ADMIN CHECK ---
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo [INFO] Requiring Administrator privileges...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)
echo [SUCCESS] Running with Administrator privileges.

setlocal enabledelayedexpansion

:: --- CONFIGURATION ---
set "JAR_NAME=projectzomboid.jar"
set "BACKUP_NAME=projectzomboid.jar.bak"
set "SEVENZIP_PATH=C:\Program Files\7-Zip\7z.exe"
set "DEFAULT_GAME_PATH=C:\Program Files (x86)\Steam\steamapps\common\ProjectZomboid"

:: ==========================================
::   FILES TO BE PATCHED (Add/Remove here)
:: ==========================================
:: Just add a new line for each file you want to patch.
:: Use forward slashes / for compatibility.
set "FILES_TO_PATCH="
set "FILES_TO_PATCH=%FILES_TO_PATCH% zombie/radio/ZomboidRadio.class"
set "FILES_TO_PATCH=%FILES_TO_PATCH% zombie/iso/WorldStreamer.class"
set "FILES_TO_PATCH=%FILES_TO_PATCH% zombie/core/textures/MultiTextureFBO2.class"
:: ==========================================

:: Cleanup leading space
set "FILES_TO_PATCH=!FILES_TO_PATCH:~1!"

:: Ensure we are in the script's directory for relative class files
pushd "%~dp0"

echo [INFO] Project Zomboid Patcher starting...
echo ----------------------------------------------------

:: --- STEP 0: DETECTION ---
:: 1. Try Default Steam Path
if exist "!DEFAULT_GAME_PATH!\!JAR_NAME!" set "PZ_PATH=!DEFAULT_GAME_PATH!"
if defined PZ_PATH echo [INFO] Game detected at default path: "!DEFAULT_GAME_PATH!"

:: 2. Fallback: Registry
if not defined PZ_PATH call :DETECT_REGISTRY

:: 3. Select Target JAR
set "JAR_FILE="
if exist "!JAR_NAME!" set "JAR_FILE=!JAR_NAME!"
if exist "!JAR_NAME!" set "BACKUP_FILE=!BACKUP_NAME!"
if exist "!JAR_NAME!" echo [FOUND] !JAR_NAME! in current directory.

if defined JAR_FILE goto :START_BACKUP
if not defined PZ_PATH goto :START_BACKUP
set "JAR_FILE=!PZ_PATH!\!JAR_NAME!"
set "BACKUP_FILE=!PZ_PATH!\!BACKUP_NAME!"

:START_BACKUP

if defined JAR_FILE goto :STEP_1
echo [ERROR] !JAR_NAME! not found. 
pause
exit /b

:STEP_1

:: --- STEP 1: BACKUP ---
if exist "!BACKUP_FILE!" echo [INFO] Backup exists. Skipping.
if exist "!BACKUP_FILE!" goto :STEP_2

echo [BACKUP] Creating "!BACKUP_FILE!"...
copy "!JAR_FILE!" "!BACKUP_FILE!" >nul
if !ERRORLEVEL! EQU 0 echo [OK] Created.
if !ERRORLEVEL! NEQ 0 echo [ERROR] Failed to create backup.

:STEP_2

:: --- STEP 2: TOOL DETECTION ---
set "METHOD="
if exist "!SEVENZIP_PATH!" set "METHOD=7ZIP"
if not defined METHOD set "METHOD=POWERSHELL"

echo [INFO] Method: !METHOD!
echo [INFO] Target: "!JAR_FILE!"
echo ----------------------------------------------------

:: --- STEP 3: PATCHING ---
if "!METHOD!"=="7ZIP" call :RUN_7ZIP
if "!METHOD!"=="POWERSHELL" call :RUN_POWERSHELL

:: --- VERIFICATION ---
if %ERRORLEVEL% EQU 0 echo/
if %ERRORLEVEL% EQU 0 echo [SUCCESS] Patch applied!
if %ERRORLEVEL% NEQ 0 echo/
if %ERRORLEVEL% NEQ 0 echo [FAILED] Errors occurred.

echo ----------------------------------------------------
popd
pause
exit /b

:DETECT_REGISTRY
for /f "tokens=2*" %%A in ('reg query "HKEY_CURRENT_USER\Software\Valve\Steam" /v "SteamPath" 2^>nul') do (
    set "S_PATH=%%B"
)
if not defined S_PATH goto :EOF
set "S_PATH=!S_PATH:/=\!"
set "D_PATH=!S_PATH!\steamapps\common\ProjectZomboid"
if exist "!D_PATH!\!JAR_NAME!" set "PZ_PATH=!D_PATH!"
if exist "!D_PATH!\!JAR_NAME!" echo [INFO] Game detected via Registry.
goto :EOF

:RUN_7ZIP
echo [PROCESS] Updating JAR via 7-Zip...
for %%f in (!FILES_TO_PATCH!) do (
    set "F=%%f"
    set "F=!F:/=\!"
    "!SEVENZIP_PATH!" a "!JAR_FILE!" "!F!"
)
goto :EOF

:RUN_POWERSHELL
echo [PROCESS] Updating JAR via PowerShell (.NET Fallback)...

:: Build PowerShell script line-by-line for readability
set "PS_SCRIPT="
set "PS_SCRIPT=!PS_SCRIPT! Add-Type -AssemblyName 'System.IO.Compression.FileSystem';"
set "PS_SCRIPT=!PS_SCRIPT! $zip = [System.IO.Compression.ZipFile]::Open('!JAR_FILE!', 'Update');"
set "PS_SCRIPT=!PS_SCRIPT! $files = $env:FILES_TO_PATCH -split ' ';"
set "PS_SCRIPT=!PS_SCRIPT! foreach ($f in $files) {"
set "PS_SCRIPT=!PS_SCRIPT!   if (Test-Path $f) {"
set "PS_SCRIPT=!PS_SCRIPT!     $e = $zip.GetEntry($f); if ($e) { $e.Delete() };"
set "PS_SCRIPT=!PS_SCRIPT!     [System.IO.Compression.ZipFileExtensions]::CreateEntryFromFile($zip, $f, $f);"
set "PS_SCRIPT=!PS_SCRIPT!     Write-Host \"[OK] Patched: $f\";"
set "PS_SCRIPT=!PS_SCRIPT!   }"
set "PS_SCRIPT=!PS_SCRIPT! };"
set "PS_SCRIPT=!PS_SCRIPT! $zip.Dispose();"

:: Execute the built script
powershell -NoProfile -ExecutionPolicy Bypass -Command "!PS_SCRIPT!"
goto :EOF
