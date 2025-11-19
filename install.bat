@echo off
setlocal enabledelayedexpansion

echo ================================
echo     VocabPy Windows Installer
echo ================================
echo.

:: -------------------------------------------------------
set BASE_URL=https://raw.githubusercontent.com/46Dimensions/VocabPy/main
set REQ_URL=%BASE_URL%/requirements.txt
set SCRIPT_URL=%BASE_URL%/main.py
set CREATE_URL=%BASE_URL%/create_vocab_file.py
:: -------------------------------------------------------

:: Check for Python 3.10+
python --version >nul 2>&1 || (
    echo ERROR: Python not found. Please install Python 3.10+.
    exit /b 1
)

for /f "tokens=2 delims= " %%v in ('python --version') do set PYVER=%%v
for /f "tokens=1-3 delims=." %%a in ("%PYVER%") do (
    set MAJOR=%%a
    set MINOR=%%b
)

if %MAJOR% LSS 3 (
    echo ERROR: Python version too old.
    exit /b 1
)
if %MAJOR%==3 if %MINOR% LSS 10 (
    echo ERROR: Python version must be 3.10 or higher.
    exit /b 1
)

echo Creating VocabPy directory...
mkdir VocabPy 2>nul

:: Choose download tool
echo Checking for curl...
curl --version >nul 2>&1

if %ERRORLEVEL%==0 (
    echo curl found — downloading files...
    curl -fsSL %REQ_URL% -o VocabPy\requirements.txt || (echo ERROR: Failed to download requirements.txt & exit /b 1)
    curl -fsSL %SCRIPT_URL% -o VocabPy\main.py || (echo ERROR: Failed to download main.py & exit /b 1)
    curl -fsSL %CREATE_URL% -o VocabPy\create_vocab_file.py || (echo ERROR: Failed to download create_vocab_file.py & exit /b 1)
) else (
    echo curl not found — using PowerShell downloader...
    powershell -Command "(New-Object Net.WebClient).DownloadFile('%REQ_URL%', 'VocabPy/requirements.txt')" || (echo ERROR: Failed to download requirements.txt & exit /b 1)
    powershell -Command "(New-Object Net.WebClient).DownloadFile('%SCRIPT_URL%', 'VocabPy/main.py')" || (echo ERROR: Failed to download main.py & exit /b 1)
    powershell -Command "(New-Object Net.WebClient).DownloadFile('%CREATE_URL%', 'VocabPy/create_vocab_file.py')" || (echo ERROR: Failed to download create_vocab_file.py & exit /b 1)
)

:: Verify downloads
if not exist VocabPy\requirements.txt (
    echo ERROR: requirements.txt missing.
    exit /b 1
)
if not exist VocabPy\main.py (
    echo ERROR: main.py missing.
    exit /b 1
)
if not exist VocabPy\create_vocab_file.py (
    echo ERROR: create_vocab_file.py missing.
    exit /b 1
)

echo.
echo Creating virtual environment...
python -m venv VocabPy\venv || (
    echo ERROR: Failed to create virtual environment.
    exit /b 1
)

:: Pick correct Python path
if exist VocabPy\venv\Scripts\python.exe (
    set PY=VocabPy\venv\Scripts\python.exe
) else (
    echo ERROR: Could not find Python in venv.
    exit /b 1
)

echo Upgrading pip...
"%PY%" -m pip install --upgrade pip || (
    echo ERROR: Failed to upgrade pip.
    exit /b 1
)

echo Installing dependencies...
"%PY%" -m pip install -r VocabPy\requirements.txt || (
    echo ERROR: Failed to install dependencies.
    exit /b 1
)

echo.
echo ================================
echo    Installation complete!
echo    Launching VocabPy...
echo ================================
echo.

:: Auto-activate venv and run
call VocabPy\venv\Scripts\activate
python VocabPy\main.py || (
    echo ERROR: Failed to launch VocabPy.
    exit /b 1
)

echo.
echo Done!
echo To run VocabPy again next time:
echo   call VocabPy\venv\Scripts\activate
echo   python VocabPy\main.py

endlocal