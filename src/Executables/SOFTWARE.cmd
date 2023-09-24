@echo off

@REM Steam
wget https://cdn.akamai.steamstatic.com/client/installer/SteamSetup.exe
start /wait SteamSetup.exe /S

@REM Visual Studio Code
wget -o=vsc.exe https://code.visualstudio.com/sha/download?build=stable&os=win32-x64-user
start /wait vsc.exe /LOADINF="vsc.inf" /VERYSILENT

@REM Jetbrains
choco install jetbrainstoolbox
choco install phpstorm

@REM Discord Canary + Vencord
wget -o="DiscordCanary.exe" https://discordapp.com/api/download/canary?platform=win
start /wait DiscordCanary.exe --silent
wget -o="vencord.exe" https://github.com/Vencord/Installer/releases/latest/download/VencordInstallerCli.exe
start /wait vencord.exe -branch canary -install