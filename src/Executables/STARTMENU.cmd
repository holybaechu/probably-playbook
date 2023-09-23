@echo off
SETLOCAL ENABLEDELAYEDEXPANSION

if exist "!SystemDrive!\Windows\StartMenuLayout.xml" echo del /q /f "!SystemDrive!\Windows\StartMenuLayout.xml" & del /q /f "!SystemDrive!\Windows\StartMenuLayout.xml"

mkdir "%SYSTEMDRIVE%\Users\Default\AppData\Local\Microsoft\Windows\Shell" 2>nul
copy /y "LayoutModification.xml" "%SYSTEMDRIVE%\Users\Default\AppData\Local\Microsoft\Windows\Shell\LayoutModification.xml"
copy /y "LayoutModification.json" "%SYSTEMDRIVE%\Users\Default\AppData\Local\Microsoft\Windows\Shell\LayoutModification.json"
copy /y "DefaultLayouts.xml" "%SYSTEMDRIVE%\Users\Default\AppData\Local\Microsoft\Windows\Shell\DefaultLayouts.xml"

mkdir "%SYSTEMDRIVE%\Users\Default\AppData\Local\Packages\%%d\LocalState" 2>nul
copy /y "settings.json" "%SYSTEMDRIVE%\Users\Default\AppData\Local\Packages\%%d\LocalState\settings.json"

for /f "usebackq tokens=2 delims=\" %%a in (`reg query "HKEY_USERS" ^| findstr /r /x /c:"HKEY_USERS\\S-.*" /c:"HKEY_USERS\\AME_UserHive_[^_]*"`) do (
	reg query "HKEY_USERS\%%a" | findstr /c:"Volatile Environment" /c:"AME_UserHive_" > nul 2>&1
	if not !errorlevel! == 1 (
		for /f "usebackq tokens=3* delims= " %%b in (`reg query "HKU\%%a\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "Local AppData" 2^>nul ^| findstr /r /x /c:".*Local AppData[ ]*REG_SZ[ ].*"`) do (
			echo copy /y "LayoutModification.xml" "%%c\Microsoft\Windows\Shell\LayoutModification.xml"
			copy /y "LayoutModification.xml" "%%c\Microsoft\Windows\Shell\LayoutModification.xml"
			echo copy /y "LayoutModification.json" "%%c\Microsoft\Windows\Shell\LayoutModification.json"
			copy /y "LayoutModification.json" "%%c\Microsoft\Windows\Shell\LayoutModification.json"
			echo copy /y "DefaultLayouts.xml" "%%c\Microsoft\Windows\Shell\DefaultLayouts.xml"
			copy /y "DefaultLayouts.xml" "%%c\Microsoft\Windows\Shell\DefaultLayouts.xml"

			for /f "usebackq delims=" %%d in (`dir /b "%%c\Packages" /a:d ^| findstr /c:"Microsoft.Windows.StartMenuExperienceHost"`) do (
				for /f "usebackq delims=" %%e in (`dir /b "%%c\Packages\%%d\LocalState" /a:-d ^| findstr /R /c:"start.\.bin" /c:"start\.bin"`) do (
echo del /q /f "%%c\Packages\%%d\LocalState\%%e" del /q /f "%%c\Packages\%%d\LocalState\%%e" ) )
				copy /y "settings.json" "%%c\Packages\%%d\LocalState\settings.json"
			)
		)
		for /f "usebackq delims=" %%c in (`reg query "HKU\%%a\SOFTWARE\Microsoft\Windows\CurrentVersion\CloudStore\Store\Cache\DefaultAccount" ^| findstr /c:"start.tilegrid"`) do (
			echo reg delete "%%c" /f
			reg delete "%%c" /f
		)
	)
)