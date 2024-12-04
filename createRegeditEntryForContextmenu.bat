@echo off
SET KEY=HKEY_CLASSES_ROOT\*\shell\DecodeBase64
SET CMD=powershell -ExecutionPolicy Bypass -File "C:\Pfad\zu\DecodeBase64.ps1" "%%1"

REM Erstelle den Schlüssel für den Kontextmenüeintrag
reg add "%KEY%" /f

REM Erstelle den Unterschlüssel "command" mit dem gewünschten Befehl
reg add "%KEY%\command" /ve /t REG_SZ /d "%CMD%" /f

echo Der Registrierungseintrag wurde erfolgreich hinzugefügt.
pause
