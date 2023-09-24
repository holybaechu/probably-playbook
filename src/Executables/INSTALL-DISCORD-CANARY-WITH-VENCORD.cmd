@echo off

wget "https://discordapp.com/api/download/canary?platform=win" -O "DiscordCanary.exe"
start /wait DiscordCanary.exe
GOTO :search

:search
tasklist|find "DiscordCanary.exe"
IF %ERRORLEVEL% == 0 GOTO :found
TIMEOUT /T 1
GOTO :search

:found
TIMEOUT 20
wget "https://github.com/Vencord/Installer/releases/latest/download/VencordInstallerCli.exe" -O "VencordInstallerCli.exe"
start /wait VencordInstallerCli.exe -branch canary -install