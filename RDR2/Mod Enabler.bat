@echo off
rem Thanks for downloading my launcher, feel free to take a look at/borrow anything you find in here

rem Wow, its been a while since 1.3.6, hasn't it? - At the time of writing, about a year!

rem Red Dead Redemption 2 Mod Enabler 1.4.4
set "version=1.4.4"

rem See if the current directory has the GTA5 files
:dircheck
@echo off
cd /d "%~dp0"
if exist RDR2.exe (
	if exist update.rpf (
		if exist appdata0_update.rpf (
			goto mainmenu)
		)
	) else (
		title Please put this file in Grand Theft Auto V's root directory
		echo Please put this file in Grand Theft Auto V's root directory
		echo:
		echo:
		pause
		goto end
		)

:mainmenu
rem Main menu
:start

@echo off
cls
set "curpath=%cd%"
title achmadfhbw's Mod Enabler %version%
echo Welcome to achmadfhbw's Mod Enabler %version%
echo Modified from FaZe IlLuMiNaTi's Mod Enabler by achmadfhbw for Red Dead Redemption 2
echo:
if not exist _DisabledMods echo Mods are currently enabled
if exist disabled echo Mods are currently _DisabledMods
echo:
echo Would you like to enable or disable your mods?
echo:
echo Enable mods: 1
echo Disable mods: 2
echo Skip to the end: 3
echo:
choice /n /c 123 /m Pick:
if errorlevel 3 goto launchoption
if errorlevel 2 goto uninstall
if errorlevel 1 goto install


rem Enabling mods
:install
@echo off
cls
mkdir _DisabledMods > nul 2> nul
cd _DisabledMods

rem All files
move *.* .. > nul 2> nul

rem Folders
move RampageFiles .. > nul 2> nul
move scripts .. > nul 2> nul
move plugins .. > nul 2> nul
move ExecuteCode .. > nul 2> nul
move Logs .. > nul 2> nul
move SweetFX .. > nul 2> nul
move enbseries .. > nul 2> nul

rem Cleaning
cd ..
attrib -h "mods"
rd _DisabledMods > nul 2> nul
goto launchoption


rem Disabling mods
:uninstall
@echo off
cls
if not exist _DisabledMods mkdir _DisabledMods > nul 2> nul

rem Basic files
move *.asi _DisabledMods > nul 2> nul
move *.log _DisabledMods > nul 2> nul
move *.ini _DisabledMods > nul 2> nul
move *.sav _DisabledMods > nul 2> nul
move *.file _DisabledMods > nul 2> nul
move *.xml _DisabledMods > nul 2> nul
move Readme.txt _DisabledMods > nul 2> nul

rem ScriptHookRDR2
move dinput8.dll _DisabledMods > nul 2> nul
move ScriptHookRDR2.dll _DisabledMods > nul 2> nul

rem ScriptHookRDRDotNet
move ScriptHookRDRDotNet.dll _DisabledMods > nul 2> nul
move ScriptHookRDRDotNet.ini _DisabledMods > nul 2> nul
move ScriptHookRDRNetAPI.dll _DisabledMods > nul 2> nul

rem OtherScriptsDLL
move NativeInterop.dll _DisabledMods > nul 2> nul
move version.dll _DisabledMods > nul 2> nul

rem EasyHook
move EasyHook.dll _DisabledMods > nul 2> nul
move EasyHook64.dll _DisabledMods > nul 2> nul
move EasyHookPatch.asi _DisabledMods > nul 2> nul
move EasyLoad64.dll _DisabledMods > nul 2> nul
move SimpleHook.dll _DisabledMods > nul 2> nul

rem RAGEPluginHook RDR2
move cursor_32_2.png _DisabledMods > nul 2> nul
move dnlib.dll _DisabledMods > nul 2> nul
move DefaultSkin.png _DisabledMods > nul 2> nul
move FW1FontWrapper.dll _DisabledMods > nul 2> nul
move Gwen.dll _DisabledMods > nul 2> nul
move Gwen.UnitTest.dll _DisabledMods > nul 2> nul
move Ionic.Zip.dll _DisabledMods > nul 2> nul
move LMS.PortableExecutable.dll _DisabledMods > nul 2> nul
move Microsoft.Expression.Drawing.dll _DisabledMods > nul 2> nul
move Mono.Cecil.dll _DisabledMods > nul 2> nul
move Mono.Cecil.Mdb.dll _DisabledMods > nul 2> nul
move Mono.Cecil.Pdb.dll _DisabledMods > nul 2> nul
move Mono.Cecil.Rocks.dll _DisabledMods > nul 2> nul
move RagePluginHook.exe _DisabledMods > nul 2> nul
move RPHShared.dll _DisabledMods > nul 2> nul
move rphupdate _DisabledMods > nul 2> nul
move SlimDX.dll _DisabledMods > nul 2> nul
move XInput1_4.dll _DisabledMods > nul 2> nul
move GameBackups.rph _DisabledMods > nul 2> nul
move startup.rphs _DisabledMods > nul 2> nul

rem SweetFX
move dxgi.dll _DisabledMods > nul 2> nul
move ReShade.fx _DisabledMods > nul 2> nul
move Sweet.fx _DisabledMods > nul 2> nul

rem ENB
rem Thanks to TwixyUnleashed for pointing out my mistake here :)
move d3d11.dll _DisabledMods > nul 2> nul
move d3dcompiler_46e.dll _DisabledMods > nul 2> nul
move enblightsprite.fx _DisabledMods > nul 2> nul
move enblocal.ini _DisabledMods > nul 2> nul
move enbseries.ini _DisabledMods > nul 2> nul
move license_en.txt _DisabledMods > nul 2> nul
move readme_en.txt _DisabledMods > nul 2> nul
move hbaosettings.xml _DisabledMods > nul 2> nul



rem Experimental .exe moving
rem We're using robocopy to move all .exe files, apart from RDR2.exe, PlayRDR2.exe and Launcher.exe
robocopy *.exe . _DisabledMods /xf RDR2.exe PlayRDR2.exe Launcher.exe /mov > nul 2> nul


rem Folders
rem Can't move OpenIV's mods folder because it would be quite large in most situations
rem Making files hidden instead
attrib +h "mods"
move RampageFiles _DisabledMods > nul 2> nul
move scripts _DisabledMods > nul 2> nul
move plugins _DisabledMods > nul 2> nul 
move ExecuteCode _DisabledMods > nul 2> nul
move Logs _DisabledMods > nul 2> nul
move SweetFX _DisabledMods > nul 2> nul
move enbseries _DisabledMods > nul 2> nul

goto launchoption

rem Choose what to do next
:launchoption
cls
title Launch?
echo Thanks for using FaZe IlLuMiNaTi's Mod Enabler
echo:
if not exist _DisabledMods echo Mods are now enabled
if exist _DisabledMods echo Mods are now disabled
echo:
echo Would you like to launch Red Dead Redemption 2 now?
echo:
echo Launch Red Dead Redemption 2 with High Priority: 1
echo Exit without launching: 2
echo Return to the start: 3
echo Launch Red Dead Redemption 2: 4
if exist "%USERPROFILE%\Desktop\RDR2 Mod Enabler.lnk" (
	echo:
	choice /n /c 1234 /m Pick:
	if errorlevel 4 goto launch
	if errorlevel 3 goto start
	if errorlevel 2 goto end
	if errorlevel 1 goto launchhigh
	) else (
		echo Make a shortcut to this script on the desktop: 5
		echo:
		choice /n /c 12345 /m Pick:
		if errorlevel 5 goto scut
		if errorlevel 4 goto launch
		if errorlevel 3 goto start
		if errorlevel 2 goto end
		if errorlevel 1 goto launchhigh
		)


rem Create a shortcut to the desktop using a temporary vb script
:scut
@echo off
set SCRIPT="%TEMP%\%RANDOM%-%RANDOM%-%RANDOM%-%RANDOM%.vbs"
echo Set oWS = WScript.CreateObject("WScript.Shell") >> %SCRIPT%
echo sLinkFile = "%USERPROFILE%\Desktop\RDR2 Mod Enabler.lnk" >> %SCRIPT%
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> %SCRIPT%
echo oLink.TargetPath = "%curpath%\Mod Enabler.bat" >> %SCRIPT%
echo oLink.IconLocation = "%curpath%\RDR2.exe" >> %SCRIPT%
echo oLink.WorkingDirectory = "%curpath%" >> %SCRIPT%
echo oLink.Save >> %SCRIPT%
cscript /nologo %SCRIPT%
del %SCRIPT%
cls
rem Launch the newly create shortcut
echo Shortcut created, relaunching in 2 seconds!
timeout /t 2 /nobreak > nul
rundll32 shell32.dll,ShellExec_RunDLL "%USERPROFILE%\Desktop\RDR2 Mod Enabler.lnk"
goto end


rem Check what version of the game the user has and launch it
:launch
if exist RagePluginHook.exe (
	if exist Gwen.dll (
		start RagePluginHook.exe
		goto end )
	) 
if exist steam_api64.dll (
	if exist steam_appid.txt (
		explorer steam://rungameid/1174180
		goto end )
	) 
if not exist steam_api64.dll (
	if not exist steam_appid.txt (
		if not exist RDR2.exe (
			start PlayRDR2.exe
			goto end )
		)
	)
if not exist steam_api64.dll (
	if not exist steam_appid.txt (
		if exist Launcher.exe (
			start Launcher.exe
			goto end)
		)
	)


rem Check what version of the game the user has and go to that section
:launchhigh
if exist RagePluginHook.exe (
	if exist Gwen.dll (
		goto launchragehookhigh )
	) 
if exist steam_api64.dll (
	if exist steam_appid.txt (
		goto launchsteamhigh )
	) 
if not exist steam_api64.dll (
	if not exist steam_appid.txt (
		if not exist Launcher.exe (
			goto launchpiratehigh)
		)
	)
if not exist steam_api64.dll (
	if not exist steam_appid.txt (
		if exist PlayRDR2.exe (
			goto launchsocialhigh)
		)
	)


rem Launch the game through Steam with High Priority mode
:launchsteamhigh
explorer steam://rungameid/1174180
cls
title Leave this window open, it will close automatically
echo Leave this window open, it will close automatically
goto processdetect

rem Launch the game through the R* warehouse launcher with High Priority mode
:launchsocialhigh
start PlayRDR2.exe
cls
title Leave this window open, it will close automatically
echo Leave this window open, it will close automatically
goto processdetect

rem I dont support piracy, but I understand why people do it
rem Launch the game through the pirate launcher with High Priority mode
:launchpiratehigh
start Launcher.exe
cls
title Leave this window open, it will close automatically
echo Leave this window open, it will close automatically
goto processdetect

rem RageHook
:launchragehookhigh
start RagePluginHook.exe
cls
title Leave this window open, it will close automatically
echo Leave this window open, it will close automatically
goto processdetect


rem Detect the process "rdr2.exe" before starting the 60 second counter, this could potentially help people with slow PCs
:processdetect
tasklist /nh /fi "imagename eq rdr2.exe" | find /i "rdr2.exe" >nul && (
echo RDR2.exe detected, waiting 60 seconds
timeout /t 60 /nobreak > nul
wmic process where name="RDR2.exe" CALL setpriority "high priority" > nul 2> nul
wmic process where name="Launcher.exe" CALL setpriority "idle" > nul 2> nul
wmic process where name="PlayRDR2.exe" CALL setpriority "idle" > nul 2> nul
wmic process where name="subprocess.exe" CALL setpriority "idle" > nul 2> nul
goto end
) || (
goto processdetect
)



rem Welp, what do you expect, its the end...
:end
