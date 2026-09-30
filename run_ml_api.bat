@echo off
REM Builds a clean venv OUTSIDE OneDrive (avoids corrupted numpy DLLs) and starts the ML API.
set VENV=C:\venvs\diabetes
if not exist "%VENV%\Scripts\python.exe" (
  echo Creating venv at %VENV% ...
  "C:\Users\admin\AppData\Local\Programs\Python\Python311\python.exe" -m venv "%VENV%" || py -3.11 -m venv "%VENV%" || python -m venv "%VENV%" || goto :fail
  "%VENV%\Scripts\python.exe" -m pip install --upgrade pip || goto :fail
  "%VENV%\Scripts\python.exe" -m pip install -r "%~dp0ml_api\requirements.txt" || goto :fail
)
cd /d "%~dp0ml_api"
"%VENV%\Scripts\python.exe" app.py
goto :eof
:fail
echo.
echo ML API setup failed.
pause
