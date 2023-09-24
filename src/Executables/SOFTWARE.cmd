@echo off

@REM Steam
wget "https://cdn.akamai.steamstatic.com/client/installer/SteamSetup.exe"
start /wait SteamSetup.exe /S

@REM Visual Studio Code
wget "https://code.visualstudio.com/sha/download?build=stable&os=win32-x64-user" -O "VisualStudioCode.exe"
start /wait VisualStudioCode.exe /LOADINF="vsc.inf" /VERYSILENT

@REM Jetbrains
choco install jetbrainstoolbox
choco install phpstorm

@REM Discord Canary + Vencord
wget "https://discordapp.com/api/download/canary?platform=win" -O "DiscordCanary.exe"
start /wait DiscordCanary.exe

wget "https://github.com/Vencord/Installer/releases/latest/download/VencordInstallerCli.exe" -O "VencordInstallerCli.exe"
start /wait VencordInstallerCli.exe -branch canary -install