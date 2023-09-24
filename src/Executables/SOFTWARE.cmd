@echo off

@REM Steam
wget "https://cdn.akamai.steamstatic.com/client/installer/SteamSetup.exe"
start /wait SteamSetup.exe /S

@REM Visual Studio Code
wget "https://code.visualstudio.com/sha/download?build=stable&os=win32-x64-user" -O "VisualStudioCode.exe"
start /wait VisualStudioCode.exe /LOADINF="vsc.inf" /VERYSILENT

@REM Jetbrains
choco install jetbrainstoolbox -y --force
choco install phpstorm -y --force

@REM Discord Canary + Vencord
INSTALL-DISCORD-CANARY-WITH-VENCORD.cmd