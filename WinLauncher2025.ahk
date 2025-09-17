#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, Force
; #NoTrayIcon
#Persistent

;;; https://www.autohotkey.com/boards/viewtopic.php?t=6110
;;;
;;; https://www.autohotkey.com/boards/viewtopic.php?t=70629
;;;
;;; https://www.autohotkey.com/boards/viewtopic.php?p=9186#p9186


GLOBAL config_file := A_ScriptDir . "\winlauncher.cfg"
GLOBAL AppTitleRoot := "Windows Program AutoLauncher"

GLOBAL SetToRunWithWindowsToggleFlag := "0"


GLOBAL engine_title := "Auto-WinLauncher"
GLOBAL engine_title_suffix := "(OnLogon Program Launcher)"


Menu, Tray, Tip, %AppTitleRoot%


Menu, Tray, NoStandard
Menu, Tray, Add, Settings, TrayBTN_SETTINGS  ; Creates a new menu item.
Menu, Tray, Add, Open Container, TrayBTN_CONTAINER  ; Creates a new menu item.
Menu, Tray, Add  ; Creates a separator line.
Menu, Tray, Add, Check Auto-Startup Status, TrayBTN_CheckIfSetRunWithWindows  ; Creates a new menu item.
Menu, Tray, Add, Toggle Auto-Startup With Windows, TrayBTN_SetToRunWithWindowsMAIN  ; Creates a new menu item.
Menu, Tray, Add  ; Creates a separator line.
Menu, Tray, Add, Exit, TrayBTN_EXIT   ; Creates a new menu item.
Sleep, 500


IniRead, UACElev, %A_ScriptDir%\%config_file%, SWITCHES, RunWithAdmin, 1
GLOBAL UACElevate := UACElev
Sleep, 500
GLOBAL UACElevate := "1"

If(UACElevate="1")
{
;                         {[
;;           ELEVATE TO ADMIN UAC PROMPT BELOW
; If the script is not elevated, relaunch as administrator and kill current instance:
 
full_command_line := DllCall("GetCommandLine", "str")
 
if not (A_IsAdmin or RegExMatch(full_command_line, " /restart(?!\S)"))
{
    try ; leads to having the script re-launching itself as administrator
    {
        if A_IsCompiled
            Run *RunAs "%A_ScriptFullPath%" /restart
        else
            Run *RunAs "%A_AhkPath%" /restart "%A_ScriptFullPath%"
    }
    ExitApp
}
;
;                          ]}
}



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;  
;;;;  
IniRead, StartDelay, %A_ScriptDir%\%config_file%, DELAYS, StartupDelay, 6000
GLOBAL StartupDelay := StartDelay
;;;;  
;;;;  
IniRead, AppSwitch001, %A_ScriptDir%\%config_file%, SWITCHES, App001, 0
GLOBAL AppSwitchx01 := AppSwitch001
;;;;  
IniRead, AppSwitch002, %A_ScriptDir%\%config_file%, SWITCHES, App002, 0
GLOBAL AppSwitchx02 := AppSwitch002
;;;;  
IniRead, AppSwitch003, %A_ScriptDir%\%config_file%, SWITCHES, App003, 0
GLOBAL AppSwitchx03 := AppSwitch003
;;;;  
IniRead, AppSwitch004, %A_ScriptDir%\%config_file%, SWITCHES, App004, 0
GLOBAL AppSwitchx04 := AppSwitch004
;;;;  
IniRead, AppSwitch005, %A_ScriptDir%\%config_file%, SWITCHES, App005, 0
GLOBAL AppSwitchx05 := AppSwitch005
;;;;  
IniRead, AppSwitch006, %A_ScriptDir%\%config_file%, SWITCHES, App006, 0
GLOBAL AppSwitchx06 := AppSwitch006
;;;;  
IniRead, AppSwitch007, %A_ScriptDir%\%config_file%, SWITCHES, App007, 0
GLOBAL AppSwitchx07 := AppSwitch007
;;;;  
IniRead, AppSwitch008, %A_ScriptDir%\%config_file%, SWITCHES, App008, 0
GLOBAL AppSwitchx08 := AppSwitch008
;;;;  
IniRead, AppSwitch009, %A_ScriptDir%\%config_file%, SWITCHES, App009, 0
GLOBAL AppSwitchx09 := AppSwitch009
;;;;  
IniRead, AppSwitch010, %A_ScriptDir%\%config_file%, SWITCHES, App010, 0
GLOBAL AppSwitchx10 := AppSwitch010
;;;;  
;;;;  
IniRead, AppSwitchDBG, %A_ScriptDir%\%config_file%, SWITCHES, DisplayErrors, 0
GLOBAL AppSwitchDebug := AppSwitchDBG
;;;;  
;;;;  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;  
;;;;  1
IniRead, AppDir001, %A_ScriptDir%\%config_file%, LAUNCHER, LauncherDirectory001, UNDEFINED_001
GLOBAL AppDIRx01 := AppDir001
IniRead, AppExe001, %A_ScriptDir%\%config_file%, LAUNCHER, LauncherExecutable001, UNDEFINED_001
GLOBAL AppEXEx01 := AppExe001
;;;;  
;;;;  2
IniRead, AppDir002, %A_ScriptDir%\%config_file%, LAUNCHER, LauncherDirectory002, UNDEFINED_002
GLOBAL AppDIRx02 := AppDir002
IniRead, AppExe002, %A_ScriptDir%\%config_file%, LAUNCHER, LauncherExecutable002, UNDEFINED_002
GLOBAL AppEXEx02 := AppExe002
;;;;  
;;;;  3
IniRead, AppDir003, %A_ScriptDir%\%config_file%, LAUNCHER, LauncherDirectory003, UNDEFINED_003
GLOBAL AppDIRx03 := AppDir003
IniRead, AppExe003, %A_ScriptDir%\%config_file%, LAUNCHER, LauncherExecutable003, UNDEFINED_003
GLOBAL AppEXEx03 := AppExe003
;;;;  
;;;;  4
IniRead, AppDir004, %A_ScriptDir%\%config_file%, LAUNCHER, LauncherDirectory004, UNDEFINED_004
GLOBAL AppDIRx04 := AppDir004
IniRead, AppExe004, %A_ScriptDir%\%config_file%, LAUNCHER, LauncherExecutable004, UNDEFINED_004
GLOBAL AppEXEx04 := AppExe004
;;;;  
;;;;  5
IniRead, AppDir005, %A_ScriptDir%\%config_file%, LAUNCHER, LauncherDirectory005, UNDEFINED_005
GLOBAL AppDIRx05 := AppDir005
IniRead, AppExe005, %A_ScriptDir%\%config_file%, LAUNCHER, LauncherExecutable005, UNDEFINED_005
GLOBAL AppEXEx05 := AppExe005
;;;;  
;;;;  6
IniRead, AppDir006, %A_ScriptDir%\%config_file%, LAUNCHER, LauncherDirectory006, UNDEFINED_006
GLOBAL AppDIRx06 := AppDir006
IniRead, AppExe006, %A_ScriptDir%\%config_file%, LAUNCHER, LauncherExecutable006, UNDEFINED_006
GLOBAL AppEXEx06 := AppExe006
;;;;  
;;;;  7
IniRead, AppDir007, %A_ScriptDir%\%config_file%, LAUNCHER, LauncherDirectory007, UNDEFINED_007
GLOBAL AppDIRx07 := AppDir007
IniRead, AppExe007, %A_ScriptDir%\%config_file%, LAUNCHER, LauncherExecutable007, UNDEFINED_007
GLOBAL AppEXEx07 := AppExe007
;;;;  
;;;;  8
IniRead, AppDir008, %A_ScriptDir%\%config_file%, LAUNCHER, LauncherDirectory008, UNDEFINED_008
GLOBAL AppDIRx08 := AppDir008
IniRead, AppExe008, %A_ScriptDir%\%config_file%, LAUNCHER, LauncherExecutable008, UNDEFINED_008
GLOBAL AppEXEx08 := AppExe008
;;;;  
;;;;  9
IniRead, AppDir009, %A_ScriptDir%\%config_file%, LAUNCHER, LauncherDirectory009, UNDEFINED_009
GLOBAL AppDIRx09 := AppDir009
IniRead, AppExe009, %A_ScriptDir%\%config_file%, LAUNCHER, LauncherExecutable009, UNDEFINED_009
GLOBAL AppEXEx09 := AppExe009
;;;;  
;;;;  10
IniRead, AppDir010, %A_ScriptDir%\%config_file%, LAUNCHER, LauncherDirectory010, UNDEFINED_010
GLOBAL AppDIRx10 := AppDir010
IniRead, AppExe010, %A_ScriptDir%\%config_file%, LAUNCHER, LauncherExecutable010, UNDEFINED_010
GLOBAL AppEXEx10 := AppExe010
;;;;  
;;;;  11
IniRead, AppDir011, %A_ScriptDir%\%config_file%, LAUNCHER, LauncherDirectory011, UNDEFINED_011
GLOBAL AppDIRx11 := AppDir011
IniRead, AppExe011, %A_ScriptDir%\%config_file%, LAUNCHER, LauncherExecutable011, UNDEFINED_011
GLOBAL AppEXEx11 := AppExe011
;;;;  
;;;;  12
IniRead, AppDir012, %A_ScriptDir%\%config_file%, LAUNCHER, LauncherDirectory012, UNDEFINED_012
GLOBAL AppDIRx12 := AppDir012
IniRead, AppExe012, %A_ScriptDir%\%config_file%, LAUNCHER, LauncherExecutable012, UNDEFINED_012
GLOBAL AppEXEx12 := AppExe012
;;;;  
;;;;  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



Sleep, %StartupDelay%


IniRead, App1Delay, %A_ScriptDir%\%config_file%, DELAYS, App001, -550
IniRead, App2Delay, %A_ScriptDir%\%config_file%, DELAYS, App002, -570
IniRead, App3Delay, %A_ScriptDir%\%config_file%, DELAYS, App003, -590
IniRead, App4Delay, %A_ScriptDir%\%config_file%, DELAYS, App004, -610
IniRead, App5Delay, %A_ScriptDir%\%config_file%, DELAYS, App005, -630
IniRead, App6Delay, %A_ScriptDir%\%config_file%, DELAYS, App006, -650
IniRead, App7Delay, %A_ScriptDir%\%config_file%, DELAYS, App007, -670
IniRead, App8Delay, %A_ScriptDir%\%config_file%, DELAYS, App008, -690
IniRead, App9Delay, %A_ScriptDir%\%config_file%, DELAYS, App009, -710
IniRead, App10Delay, %A_ScriptDir%\%config_file%, DELAYS, App010, -730
IniRead, App11Delay, %A_ScriptDir%\%config_file%, DELAYS, App011, -750
IniRead, App12Delay, %A_ScriptDir%\%config_file%, DELAYS, App012, -770


If(AppSwitchx01="1")
{
    SetTimer, APPEvent001, %App1Delay%
}
If(AppSwitchx02="1")
{
    SetTimer, APPEvent002, %App2Delay%
}
If(AppSwitchx03="1")
{
    SetTimer, APPEvent003, %App3Delay%
}
If(AppSwitchx04="1")
{
    SetTimer, APPEvent004, %App4Delay%
}
If(AppSwitchx05="1")
{
    SetTimer, APPEvent005, %App5Delay%
}
If(AppSwitchx06="1")
{
    SetTimer, APPEvent006, %App6Delay%
}
If(AppSwitchx07="1")
{
    SetTimer, APPEvent007, %App7Delay%
}
If(AppSwitchx08="1")
{
    SetTimer, APPEvent008, %App8Delay%
}
If(AppSwitchx09="1")
{
    SetTimer, APPEvent009, %App9Delay%
}
If(AppSwitchx10="1")
{
    SetTimer, APPEvent010, %App10Delay%
}
If(AppSwitchx11="1")
{
    SetTimer, APPEvent011, %App11Delay%
}
If(AppSwitchx12="1")
{
    SetTimer, APPEvent012, %App12Delay%
}

Sleep, 1500

IniRead, PDANetAutoCon, %A_ScriptDir%\%config_file%, SWITCHES, PDANetAuto, 0
GLOBAL PDANetAutoConnect := PDANetAutoCon

If(PDANetAutoConnect="1")
{
IniRead, PDANetAutoDelay, %A_ScriptDir%\%config_file%, DELAYS, PDANetAutoDelay, 7000
IniRead, PDANetDIR, %A_ScriptDir%\%config_file%, PDANet, Dir, C:\Program Files (x86)\PdaNet for Android
IniRead, PDANetEXE, %A_ScriptDir%\%config_file%, PDANet, Exe, PdaNetPC.exe
Process, Wait, PdaNetPC.exe
Sleep, %PDANetAutoDelay%
Run, %PDANetDIR%\%PDANetEXE%   ;;; this auto connects on second rerun
; BlockInput, On
; Sleep, 2000
; TrayIcon_Button("PdaNetPC.exe")
; Sleep, 9000
; Send {Down}
; Sleep, 250
; Send {Enter}
; BlockInput, Off
}




Sleep, 10000
ExitApp
Return
Return
Return


APPEvent001:
If(AppDIRx01 ="UNDEFINED_001")
{
    If(AppSwitchDebug="1")
    {
    MsgBox, , WinLaunch 2024, App {001} Launch Enabled But Undefined (1)
    }
}
Else If(AppEXEx01="UNDEFINED_001")
{
    If(AppSwitchDebug="1")
    {
    MsgBox, , WinLaunch 2024, App {001} Launch Enabled But Undefined (2)
    }
}
Else
    {
        Run, %AppDIRx01%\%AppEXEx01%
    }
Return



APPEvent002:
If(AppDIRx02 ="UNDEFINED_002")
{
    If(AppSwitchDebug="1")
    {
    MsgBox, , WinLaunch 2024, App {002} Launch Enabled But Undefined (1)
    }
}
Else If(AppEXEx02="UNDEFINED_002")
{
    If(AppSwitchDebug="1")
    {
    MsgBox, , WinLaunch 2024, App {002} Launch Enabled But Undefined (2)
    }
}
Else
    {
        Run, %AppDIRx02%\%AppEXEx02%
    }
Return



APPEvent003:
If(AppDIRx03 ="UNDEFINED_003")
{
    If(AppSwitchDebug="1")
    {
    MsgBox, , WinLaunch 2024, App {003} Launch Enabled But Undefined (1)
    }
}
Else If(AppEXEx03="UNDEFINED_003")
{
    If(AppSwitchDebug="1")
    {
    MsgBox, , WinLaunch 2024, App {003} Launch Enabled But Undefined (2)
    }
}
Else
    {
        Run, %AppDIRx03%\%AppEXEx03%
    }
Return



APPEvent004:
If(AppDIRx04="UNDEFINED_004")
{
    If(AppSwitchDebug="1")
    {
    MsgBox, , WinLaunch 2024, App {004} Launch Enabled But Undefined (1)
    }
}
Else If(AppEXEx04="UNDEFINED_004")
{
    If(AppSwitchDebug="1")
    {
    MsgBox, , WinLaunch 2024, App {004} Launch Enabled But Undefined (2)
    }
}
Else
    {
        Run, %AppDIRx04%\%AppEXEx04%
    }
Return



APPEvent005:
If(AppDIRx05="UNDEFINED_005")
{
    If(AppSwitchDebug="1")
    {
    MsgBox, , WinLaunch 2024, App {005} Launch Enabled But Undefined (1)
    }
}
Else If(AppEXEx05="UNDEFINED_005")
{
    If(AppSwitchDebug="1")
    {
    MsgBox, , WinLaunch 2024, App {005} Launch Enabled But Undefined (2)
    }
}
Else
    {
        Run, %AppDIRx05%\%AppEXEx05%
    }
Return



APPEvent006:
If(AppDIRx06="UNDEFINED_006")
{
    If(AppSwitchDebug="1")
    {
    MsgBox, , WinLaunch 2024, App {006} Launch Enabled But Undefined (1)
    }
}
Else If(AppEXEx06="UNDEFINED_006")
{
    If(AppSwitchDebug="1")
    {
    MsgBox, , WinLaunch 2024, App {006} Launch Enabled But Undefined (2)
    }
}
Else
    {
        Run, %AppDIRx06%\%AppEXEx06%
    }
Return



APPEvent007:
If(AppDIRx07="UNDEFINED_007")
{
    If(AppSwitchDebug="1")
    {
    MsgBox, , WinLaunch 2024, App {007} Launch Enabled But Undefined (1)
    }
}
Else If(AppEXEx07="UNDEFINED_007")
{
    If(AppSwitchDebug="1")
    {
    MsgBox, , WinLaunch 2024, App {007} Launch Enabled But Undefined (2)
    }
}
Else
    {
        Run, %AppDIRx07%\%AppEXEx07%
    }
Return



APPEvent008:
If(AppDIRx08="UNDEFINED_008")
{
    If(AppSwitchDebug="1")
    {
    MsgBox, , WinLaunch 2024, App {008} Launch Enabled But Undefined (1)
    }
}
Else If(AppEXEx08="UNDEFINED_008")
{
    If(AppSwitchDebug="1")
    {
    MsgBox, , WinLaunch 2024, App {008} Launch Enabled But Undefined (2)
    }
}
Else
    {
        Run, %AppDIRx08%\%AppEXEx08%
    }
Return



APPEvent009:
If(AppDIRx09="UNDEFINED_009")
{
    If(AppSwitchDebug="1")
    {
    MsgBox, , WinLaunch 2024, App {009} Launch Enabled But Undefined (1)
    }
}
Else If(AppEXEx09="UNDEFINED_009")
{
    If(AppSwitchDebug="1")
    {
    MsgBox, , WinLaunch 2024, App {009} Launch Enabled But Undefined (2)
    }
}
Else
    {
        Run, %AppDIRx09%\%AppEXEx09%
    }
Return



APPEvent010:
If(AppDIRx10="UNDEFINED_010")
{
    If(AppSwitchDebug="1")
    {
    MsgBox, , WinLaunch 2024, App {010} Launch Enabled But Undefined (1)
    }
}
Else If(AppEXEx10="UNDEFINED_010")
{
    If(AppSwitchDebug="1")
    {
    MsgBox, , WinLaunch 2024, App {010} Launch Enabled But Undefined (2)
    }
}
Else
    {
        Run, %AppDIRx10%\%AppEXEx10%
    }
Return



APPEvent011:
If(AppDIRx11="UNDEFINED_011")
{
    If(AppSwitchDebug="1")
    {
    MsgBox, , WinLaunch 2024, App {011} Launch Enabled But Undefined (1)
    }
}
Else If(AppEXEx11="UNDEFINED_011")
{
    If(AppSwitchDebug="1")
    {
    MsgBox, , WinLaunch 2024, App {011} Launch Enabled But Undefined (2)
    }
}
Else
    {
        Run, %AppDIRx11%\%AppEXEx11%
    }
Return



APPEvent012:
If(AppDIRx12="UNDEFINED_012")
{
    If(AppSwitchDebug="1")
    {
    MsgBox, , WinLaunch 2024, App {012} Launch Enabled But Undefined (1)
    }
}
Else If(AppEXEx12="UNDEFINED_012")
{
    If(AppSwitchDebug="1")
    {
    MsgBox, , WinLaunch 2024, App {012} Launch Enabled But Undefined (2)
    }
}
Else
    {
        Run, %AppDIRx12%\%AppEXEx12%
    }
Return























TrayBTN_EXIT:
ExitApp
Return


TrayBTN_SETTINGS:
Run, "notepad.exe" %config_file%
Return


TrayBTN_CONTAINER:
Run, "explorer.exe" %A_ScriptDir%
Return

















TrayBTN_CheckIfSetRunWithWindows:
GLOBAL taskName := "Core_WindowsLauncherOnStartup" ; Replace with the actual task name
GLOBAL taskCheckerCreate := "VerifyDota2QueueAegisTaskExists.txt"
GLOBAL taskChecker := "VerifyWindowsLauncherTaskExists.ps1"

GLOBAL PowerShellVerifyCommand := "powershell.exe -Command Get-ScheduledTask" . A_Space . taskName

Path_To_File = "%A_Temp%\%taskChecker%"

If FileExist(A_Temp . "\" . taskChecker)
{
	; MsgBox,, Title, VerifyTask2.ps1 EXISTS ALREADY!
}
Else
{
	; MsgBox,, Title, VerifyTask2.ps1 DOES NOT EXISTS ALREADY!
	FileAppend, %PowerShellVerifyCommand%, %A_Temp%\%taskCheckerCreate%
	If(ErrorLevel="1")
	{
		;;; CATCH ERRORS AND ALSO WAIT FOR EXECUTION TO FINISH TO ENSURE WE ONLY TRY TO RENAME AFTER ITS DONE
		; MsgBox,, Title, BUILD VerifyTask2.txt had an error trying to write the file needed to check if the task exists
	}
	Else
	{
		;;; CATCH ERRORS AND ALSO WAIT FOR EXECUTION TO FINISH TO ENSURE WE ONLY TRY TO RENAME AFTER ITS DONE
		; MsgBox,, Title, BUILD VerifyTask2.txt finished successfully!
		;;; RENAME THE FILE FROM A .TXT TO A .PS1 SINCE FILEAPPEND ISN'T ALLOWED TO MAKE A .PS1 FILE WITHOUT ADMIN
		FileMove, %A_Temp%\%taskCheckerCreate%, %A_Temp%\%taskChecker%, 1
	}
}
CheckTaskStateOutput := JEE_RunGetStdOut("PowerShell.exe -ExecutionPolicy Bypass -File " Path_To_File)

; MsgBox, , Title, %Path_To_File%

If(CheckTaskStateOutput="" && "null")
{
    MsgBox,, [%engine_title%]  Auto-Start With Windows, %engine_title% Is Currently NOT Set To Auto-Start With Windows.
	Return
}
else
{
	MsgBox,, [%engine_title%]  Auto-Start With Windows, %engine_title% Is Currently Set To Auto-Start With Windows.
	Return
}
Return




TrayBTN_SetToRunWithWindowsMAIN:
GLOBAL CurrentScriptFile := A_ScriptName
IniRead, bUACElevate, %config_file%, DEBUG, RunAsAdministrator, 0
GLOBAL UACElevate := bUACElevate

; GLOBAL RunQueueAegisContainer := A_ScriptDir . "\" . A_ScriptName
GLOBAL RunQueueAegisContainer := "'" . A_ScriptDir . "\" . A_ScriptName . "'"



GLOBAL taskName := "Core_WindowsLauncherOnStartup" ; Replace with the actual task name
GLOBAL taskCheckerCreate := "VerifyDota2QueueAegisTaskExists.txt"
GLOBAL taskChecker := "VerifyWindowsLauncherTaskExists.ps1"

GLOBAL PowerShellVerifyCommand := "powershell.exe -Command Get-ScheduledTask" . A_Space . taskName

Path_To_File = "%A_Temp%\%taskChecker%"

If FileExist(A_Temp . "\" . taskChecker)
{
	; MsgBox,, Title, VerifyTask2.ps1 EXISTS ALREADY!
}
Else
{
	; MsgBox,, Title, VerifyTask2.ps1 DOES NOT EXISTS ALREADY!
	FileAppend, %PowerShellVerifyCommand%, %A_Temp%\%taskCheckerCreate%
	If(ErrorLevel="1")
	{
		;;; CATCH ERRORS AND ALSO WAIT FOR EXECUTION TO FINISH TO ENSURE WE ONLY TRY TO RENAME AFTER ITS DONE
		; MsgBox,, Title, BUILD VerifyTask2.txt had an error trying to write the file needed to check if the task exists
	}
	Else
	{
		;;; CATCH ERRORS AND ALSO WAIT FOR EXECUTION TO FINISH TO ENSURE WE ONLY TRY TO RENAME AFTER ITS DONE
		; MsgBox,, Title, BUILD VerifyTask2.txt finished successfully!
		;;; RENAME THE FILE FROM A .TXT TO A .PS1 SINCE FILEAPPEND ISN'T ALLOWED TO MAKE A .PS1 FILE WITHOUT ADMIN
		FileMove, %A_Temp%\%taskCheckerCreate%, %A_Temp%\%taskChecker%, 1
	}
}
SetToRunWithWindowsToggleFlag := JEE_RunGetStdOut("PowerShell.exe -ExecutionPolicy Bypass -File " Path_To_File)

; MsgBox, , Title, %Path_To_File%

        If(SetToRunWithWindowsToggleFlag="" && "null")
        {
            ; MsgBox, %engine_title% Is Currently Set To Auto-Start With Windows.
            GLOBAL SetToRunWithWindowsToggleFlag := "0"
          ; Return
        }
        else
        {
          ; MsgBox, %engine_title% Is Currently NOT Set To Auto-Start With Windows.
          GLOBAL SetToRunWithWindowsToggleFlag := "1"
          ; Return
        }





If(SetToRunWithWindowsToggleFlag="0")
{
  GLOBAL SetToRunWithWindowsToggleFlag := "1"
  SetTimer, TrayBTN_SetToRunWithWindowsOFF, OFF
  SetTimer, TrayBTN_SetToRunWithWindowsON, -150
  Return
}
If(SetToRunWithWindowsToggleFlag="1")
{
  GLOBAL SetToRunWithWindowsToggleFlag := "0"
  SetTimer, TrayBTN_SetToRunWithWindowsON, OFF
  SetTimer, TrayBTN_SetToRunWithWindowsOFF, -150
  Return
}
Return


TrayBTN_SetToRunWithWindowsON:
GLOBAL UACElevate := "1"

If(UACElevate="0")
{
  Run, schtasks.exe /create /TN "Core_WindowsLauncherOnStartup" /TR "%RunQueueAegisContainer%" /sc ONLOGON /RU "%A_ComputerName%\%A_UserName%" /RL LIMITED /F
  MsgBox,, [%engine_title%]  Auto-Start With Windows, Successfully Enabled Auto-Starting %engine_title% With Windows (LIMITED).
  Return
}
If(UACElevate="1")
{
  Run, schtasks.exe /create /TN "Core_WindowsLauncherOnStartup" /TR "%RunQueueAegisContainer%" /sc ONLOGON /RU "%A_ComputerName%\%A_UserName%" /RL HIGHEST /F
  MsgBox,, [%engine_title%]  Auto-Start With Windows, Successfully Enabled Auto-Starting %engine_title% With Windows (HIGHEST).
  Return
}
Return

TrayBTN_SetToRunWithWindowsOFF:
  Run, schtasks.exe /delete /TN "Core_WindowsLauncherOnStartup" /F
  MsgBox,, [%engine_title%]  Auto-Start With Windows, Successfully Disabled Auto-Starting {%engine_title%} With Windows.
Return






































;;;; FUNCTION TO CHECK IF THE TASK SCHEDULER TASK EXISTS, CAPTURING POWERSHELL SCRIPT EXECUTION. USED IS ONE OF THE TRAY MENU BUTTONS FOR THE CHECKER
JEE_RunGetStdOut(vTarget, vSize:="")
{
	DetectHiddenWindows, On
	vComSpec := A_ComSpec ? A_ComSpec : ComSpec
	Run, % vComSpec,, Hide, vPID
	WinWait, % "ahk_pid " vPID
	DllCall("kernel32\AttachConsole", "UInt",vPID)
	oShell := ComObjCreate("WScript.Shell")
	oExec := oShell.Exec(vTarget)
	vStdOut := ""
	if !(vSize = "")
		VarSetCapacity(vStdOut, vSize)
	while !oExec.StdOut.AtEndOfStream
		vStdOut := oExec.StdOut.ReadAll()
	DllCall("kernel32\FreeConsole")
	Process, Close, % vPID
	return vStdOut
}
Return


; APPEvent001:
; If(AppDIRx01 ="UNDEFINED_001")
; {
;     If(AppSwitchDebug="1")
;     {
;     ; MsgBox, , WinLaunch 2024, undefined called
;     }
; }
; Else If(AppEXEx01="UNDEFINED_001")
; {
;     If(AppSwitchDebug="1")
;     {
;     ; MsgBox, , WinLaunch 2024, undefined called
;     }
; }
; Else
;     {
;         Run, %AppDIRx01%\%AppEXEx01%
;     }
; Return



; APPEvent002:
; If(AppDIRx02 ="UNDEFINED_002")
; {
;     If(AppSwitchDebug="1")
;     {
;     ; MsgBox, , WinLaunch 2024, undefined called
;     }
; }
; Else If(AppEXEx02="UNDEFINED_002")
; {
;     If(AppSwitchDebug="1")
;     {
;     ; MsgBox, , WinLaunch 2024, undefined called
;     }
; }
; Else
;     {
;         Run, %AppDIRx02%\%AppEXEx02%
;     }
; Return



; APPEvent003:
; If(AppDIRx03 ="UNDEFINED_003")
; {
;     If(AppSwitchDebug="1")
;     {
;     ; MsgBox, , WinLaunch 2024, undefined called
;     }
; }
; Else If(AppEXEx03="UNDEFINED_003")
; {
;     If(AppSwitchDebug="1")
;     {
;     ; MsgBox, , WinLaunch 2024, undefined called
;     }
; }
; Else
;     {
;         Run, %AppDIRx03%\%AppEXEx03%
;     }
; Return



; APPEvent004:
; If(AppDIRx04="UNDEFINED_004")
; {
;     If(AppSwitchDebug="1")
;     {
;     ; MsgBox, , WinLaunch 2024, undefined called
;     }
; }
; Else If(AppEXEx04="UNDEFINED_004")
; {
;     If(AppSwitchDebug="1")
;     {
;     ; MsgBox, , WinLaunch 2024, undefined called
;     }
; }
; Else
;     {
;         Run, %AppDIRx04%\%AppEXEx04%
;     }
; Return



; APPEvent005:
; If(AppDIRx05="UNDEFINED_005")
; {
;     If(AppSwitchDebug="1")
;     {
;     ; MsgBox, , WinLaunch 2024, undefined called
;     }
; }
; Else If(AppEXEx05="UNDEFINED_005")
; {
;     If(AppSwitchDebug="1")
;     {
;     ; MsgBox, , WinLaunch 2024, undefined called
;     }
; }
; Else
;     {
;         Run, %AppDIRx05%\%AppEXEx05%
;     }
; Return



; APPEvent006:
; If(AppDIRx06="UNDEFINED_006")
; {
;     If(AppSwitchDebug="1")
;     {
;     ; MsgBox, , WinLaunch 2024, undefined called
;     }
; }
; Else If(AppEXEx06="UNDEFINED_006")
; {
;     If(AppSwitchDebug="1")
;     {
;     ; MsgBox, , WinLaunch 2024, undefined called
;     }
; }
; Else
;     {
;         Run, %AppDIRx06%\%AppEXEx06%
;     }
; Return



; APPEvent007:
; If(AppDIRx07="UNDEFINED_007")
; {
;     If(AppSwitchDebug="1")
;     {
;     ; MsgBox, , WinLaunch 2024, undefined called
;     }
; }
; Else If(AppEXEx07="UNDEFINED_007")
; {
;     If(AppSwitchDebug="1")
;     {
;     ; MsgBox, , WinLaunch 2024, undefined called
;     }
; }
; Else
;     {
;         Run, %AppDIRx07%\%AppEXEx07%
;     }
; Return



; APPEvent008:
; If(AppDIRx08="UNDEFINED_008")
; {
;     If(AppSwitchDebug="1")
;     {
;     ; MsgBox, , WinLaunch 2024, undefined called
;     }
; }
; Else If(AppEXEx08="UNDEFINED_008")
; {
;     If(AppSwitchDebug="1")
;     {
;     ; MsgBox, , WinLaunch 2024, undefined called
;     }
; }
; Else
;     {
;         Run, %AppDIRx08%\%AppEXEx08%
;     }
; Return



; APPEvent009:
; If(AppDIRx09="UNDEFINED_009")
; {
;     If(AppSwitchDebug="1")
;     {
;     ; MsgBox, , WinLaunch 2024, undefined called
;     }
; }
; Else If(AppEXEx09="UNDEFINED_009")
; {
;     If(AppSwitchDebug="1")
;     {
;     ; MsgBox, , WinLaunch 2024, undefined called
;     }
; }
; Else
;     {
;         Run, %AppDIRx09%\%AppEXEx09%
;     }
; Return



; APPEvent010:
; If(AppDIRx10="UNDEFINED_010")
; {
;     If(AppSwitchDebug="1")
;     {
;     ; MsgBox, , WinLaunch 2024, undefined called
;     }
; }
; Else If(AppEXEx10="UNDEFINED_010")
; {
;     If(AppSwitchDebug="1")
;     {
;     ; MsgBox, , WinLaunch 2024, undefined called
;     }
; }
; Else
;     {
;         Run, %AppDIRx10%\%AppEXEx10%
;     }
; Return



; APPEvent011:
; If(AppDIRx11="UNDEFINED_011")
; {
;     If(AppSwitchDebug="1")
;     {
;     ; MsgBox, , WinLaunch 2024, undefined called
;     }
; }
; Else If(AppEXEx11="UNDEFINED_011")
; {
;     If(AppSwitchDebug="1")
;     {
;     ; MsgBox, , WinLaunch 2024, undefined called
;     }
; }
; Else
;     {
;         Run, %AppDIRx11%\%AppEXEx11%
;     }
; Return



; APPEvent012:
; If(AppDIRx12="UNDEFINED_012")
; {
;     If(AppSwitchDebug="1")
;     {
;     ; MsgBox, , WinLaunch 2024, undefined called
;     }
; }
; Else If(AppEXEx12="UNDEFINED_012")
; {
;     If(AppSwitchDebug="1")
;     {
;     ; MsgBox, , WinLaunch 2024, undefined called
;     }
; }
; Else
;     {
;         Run, %AppDIRx12%\%AppEXEx12%
;     }
; Return



; #Include, functions.toolkit