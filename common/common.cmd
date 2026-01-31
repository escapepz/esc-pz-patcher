@echo off
setlocal enabledelayedexpansion

:: --- CONFIGURATION ---
set "JAR_FILE=projectzomboid.jar"
set "BACKUP_FILE=projectzomboid.jar.bak"
set "SEVENZIP_PATH=C:\Program Files\7-Zip\7z.exe"
:: Note: Default Steam path for Project Zomboid's Java tools
set "GAME_JAR_TOOL=C:\Program Files (x86)\Steam\steamapps\common\ProjectZomboid\jre64\bin\jar.exe"

echo [INFO] Project Zomboid Patcher starting...
echo ----------------------------------------------------

:: --- STEP 1: AUTO-BACKUP ---
:: Verify if the target JAR file exists in the current directory
if not exist "%JAR_FILE%" (
    echo [ERROR] Target file %JAR_FILE% not found!
    pause
    exit /b
)

:: Create a .bak file if it doesn't exist yet to prevent overwriting original files
if not exist "%BACKUP_FILE%" (
    echo [BACKUP] Creating original backup: %BACKUP_FILE%
    copy "%JAR_FILE%" "%BACKUP_FILE%" >nul
    if %ERRORLEVEL% EQU 0 (echo [OK] Backup created successfully.)
) else (
    echo [INFO] Backup already exists. Skipping backup step.
)

:: --- STEP 2: TOOL DETECTION ---
:: Prioritize the official Java 'jar' tool, fallback to 7-Zip
if exist "%GAME_JAR_TOOL%" (
    echo [CHECK] Java JAR tool detected.
    set "METHOD=JAR"
) else if exist "%SEVENZIP_PATH%" (
    echo [CHECK] 7-Zip detected.
    set "METHOD=7ZIP"
) else (
    echo [ERROR] No patching tool found (7-Zip or jar.exe required).
    pause
    exit /b
)

echo [INFO] Using Method: %METHOD%
echo ----------------------------------------------------

:: --- STEP 3: PATCHING PROCESS ---
:: Method 1: Java JAR Command (Official update method)
if "%METHOD%"=="JAR" (
    echo [PROCESS] Updating JAR via Java...
    "%GAME_JAR_TOOL%" uf "%JAR_FILE%" zombie/radio/ZomboidRadio.class
    "%GAME_JAR_TOOL%" uf "%JAR_FILE%" zombie/iso/WorldStreamer.class
    "%GAME_JAR_TOOL%" uf "%JAR_FILE%" zombie/core/textures/MultiTextureFBO2.class
)

:: Method 2: 7-Zip Command (Reliable compression alternative)
if "%METHOD%"=="7ZIP" (
    echo [PROCESS] Updating JAR via 7-Zip...
    "%SEVENZIP_PATH%" a "%JAR_FILE%" "zombie\radio\ZomboidRadio.class"
    "%SEVENZIP_PATH%" a "%JAR_FILE%" "zombie\iso\WorldStreamer.class"
    "%SEVENZIP_PATH%" a "%JAR_FILE%" "zombie\core\textures\MultiTextureFBO2.class"
)

:: --- FINAL VERIFICATION ---
:: ErrorLevel 0 indicates the compression/update command finished without errors
if %ERRORLEVEL% EQU 0 (
    echo.
    echo [SUCCESS] Patch applied! You can now launch Project Zomboid.
) else (
    echo.
    echo [FAILED] Something went wrong. Ensure .class files are in correct subfolders.
)

echo ----------------------------------------------------
pause
