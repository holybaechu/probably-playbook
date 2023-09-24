echo Installing Vencord...
@echo off
wget https://github.com/Vencord/Installer/releases/latest/download/VencordInstallerCli.exe -O TempInstaller.exe
start /wait TempInstaller.exe -install -branch canary
del TempInstaller.exe