@echo off

@REM Steam
wget https://cdn.akamai.steamstatic.com/client/installer/SteamSetup.exe -o"SteamSetup.exe"
start /wait SteamSetup.exe /S

@REM Visual Studio Code
wget https://code.visualstudio.com/sha/download?build=stable&os=win32-x64-user -o"vsc.exe"
start /wait vsc.exe /LOADINF="vsc.inf" /VERYSILENT

@REM Jetbrains
choco install jetbrainstoolbox
choco install phpstorm

@REM Discord Canary + Vencord
wget https://discordapp.com/api/download/canary?platform=win -o"DiscordCanary.exe"
start /wait DiscordCanary.exe --silent
wget https://github.com/Vencord/Installer/releases/latest/download/VencordInstallerCli.exe -o"vencord.exe"
start /wait vencord.exe -branch canary -install