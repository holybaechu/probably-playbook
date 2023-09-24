@echo off

@REM wget (needed for installing vencord, etc... after applying playbook)
copy wget.exe "C:\Windows\System32"

@REM Steam
wget "https://cdn.akamai.steamstatic.com/client/installer/SteamSetup.exe"
start /wait SteamSetup.exe /S

@REM Visual Studio Code
wget "https://code.visualstudio.com/sha/download?build=stable&os=win32-x64-user" -O "VisualStudioCode.exe"
start /wait VisualStudioCode.exe /LOADINF="vsc.inf" /VERYSILENT

@REM Discord Canary
wget "https://discordapp.com/api/download/canary?platform=win" -O "DiscordCanary.exe"
start /wait DiscordCanary.exe --silent

@REM Node.js
choco install -y -f nodejs-lts
@REM Jetbrains Toolbox
choco install -y -f jetbrainstoolbox
@REM Jetbrains PhpStorm
choco install -y -f phpstorm
@REM Honeyview
choco install -y -f honeyview.install
@REM Bandizip
choco install -y -f bandizip
@REM WizTree
choco install -y -f wiztree