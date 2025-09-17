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

GLOBAL config_title := "winlauncher.cfg"
GLOBAL config_file_combo := A_ScriptDir . "\" . config_title
; GLOBAL config_file_combo := "winlauncher.cfg"    ;;; DON'T USE THIS VERSION BECAUSE ALL CALLS ARE NOW STATED FROM NON-LITERAL ABOVE


GLOBAL AppTitleRoot := "Windows Program AutoLauncher"

GLOBAL SetToRunWithWindowsToggleFlag := "0"
GLOBAL AutoSetToRunWithWindowsToggleFlag := "0"


GLOBAL engine_title := "WinLogon Auto-Launcher"
GLOBAL engine_title_suffix := "(OnLogon Program Launcher)"

GLOBAL engine_version := "v.1.0307"
GLOBAL engine_build := "22H2"

;; 2024 VERSION
; GLOBAL engine_version := "v.1.0107"


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


IniRead, bAppSwitchDebugConfigFile, %engine_title%, SYSTEM, DisplayUnableToReadConfigError, 1
GLOBAL AppSwitchDebugConfigFile := bAppSwitchDebugConfigFile

IniRead, UACElev, %config_file_combo%, SYSTEM, RunWithAdmin, UNABLE_TO_READ_CONFIG
GLOBAL UACElevate := UACElev
Sleep, 500
; GLOBAL UACElevate := "1"     ;;;  FORCE ADMIN ELEVATE
If(UACElevate="UNABLE_TO_READ_CONFIG")
{
    If(AppSwitchDebugConfigFile="1")
    {
    MsgBox, 4, %engine_title% - ERROR, UNABLE TO READ CONFIG FILE AT STARTUP PHASE.`nThis means all settings will take hard-coded defaults and the system will not work correctly.`n`nThis can happen if the winlauncher.cfg file is not in the folder with the application OR you are trying to run the application from a protected part of the system (C:) drive.`n`nDo you want to try to re-run the script with administrator rights in order to see if that will fix it (YES) or simply exit (NO)?`n`nIf you say yes but this error still appears then make sure the config file is inside the folder.
        IfMsgBox, No
        {
            ExitApp
        }
        IfMsgBox, Yes
        {
            GLOBAL UACElevate := "1"
        }
    }
}


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



IniRead, bAutoStartupSetupOnFirstRun, %config_file_combo%, AUTOSTARTUP_ONLOGON, AutoStartupSetupOnFirstRun, 1
GLOBAL AutoStartupSetupOnFirstRun := bAutoStartupSetupOnFirstRun

IniRead, aAutoStartupSetupOnFirstRunDelay, %config_file_combo%, AUTOSTARTUP_ONLOGON, AutoStartupSetupOnFirstRunDelay, 1
GLOBAL bAutoStartupSetupOnFirstRunDelay := aAutoStartupSetupOnFirstRunDelay . "000"
GLOBAL AutoStartupSetupOnFirstRunDelay := "-" . bAutoStartupSetupOnFirstRunDelay   ;;;; ensure this timer is not repeated by auto-appending a minus to the start

IniRead, bAutoStartupSetupHasRun, %config_file_combo%, AUTOSTARTUP_ONLOGON, AutoStartupSetupHasRun, TRUE
GLOBAL AutoStartupSetupHasRun := bAutoStartupSetupHasRun



If(AutoStartupSetupOnFirstRun="1")
{
    If(AutoStartupSetupHasRun="FALSE")
    {
        SetTimer, AutoSetToRunWithWindowsMAIN, %AutoStartupSetupOnFirstRunDelay%
        IniWrite, TRUE, %config_file_combo%, AUTOSTARTUP_ONLOGON, AutoStartupSetupHasRun
        GLOBAL AutoStartupSetupHasRun := "TRUE"
    }
}






;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;  
;;;;  
IniRead, AppSwitch001, %config_file_combo%, LAUNCH_SWITCHES, App001, 0
GLOBAL AppSwitchx01 := AppSwitch001
;;;;  
IniRead, AppSwitch002, %config_file_combo%, LAUNCH_SWITCHES, App002, 0
GLOBAL AppSwitchx02 := AppSwitch002
;;;;  
IniRead, AppSwitch003, %config_file_combo%, LAUNCH_SWITCHES, App003, 0
GLOBAL AppSwitchx03 := AppSwitch003
;;;;  
IniRead, AppSwitch004, %config_file_combo%, LAUNCH_SWITCHES, App004, 0
GLOBAL AppSwitchx04 := AppSwitch004
;;;;  
IniRead, AppSwitch005, %config_file_combo%, LAUNCH_SWITCHES, App005, 0
GLOBAL AppSwitchx05 := AppSwitch005
;;;;  
IniRead, AppSwitch006, %config_file_combo%, LAUNCH_SWITCHES, App006, 0
GLOBAL AppSwitchx06 := AppSwitch006
;;;;  
IniRead, AppSwitch007, %config_file_combo%, LAUNCH_SWITCHES, App007, 0
GLOBAL AppSwitchx07 := AppSwitch007
;;;;  
IniRead, AppSwitch008, %config_file_combo%, LAUNCH_SWITCHES, App008, 0
GLOBAL AppSwitchx08 := AppSwitch008
;;;;  
IniRead, AppSwitch009, %config_file_combo%, LAUNCH_SWITCHES, App009, 0
GLOBAL AppSwitchx09 := AppSwitch009
;;;;  
IniRead, AppSwitch010, %config_file_combo%, LAUNCH_SWITCHES, App010, 0
GLOBAL AppSwitchx10 := AppSwitch010
;;;;  
IniRead, AppSwitch011, %config_file_combo%, LAUNCH_SWITCHES, App011, 0
GLOBAL AppSwitchx11 := AppSwitch011
;;;;  
IniRead, AppSwitch012, %config_file_combo%, LAUNCH_SWITCHES, App012, 0
GLOBAL AppSwitchx12 := AppSwitch012
;;;;  
IniRead, AppSwitch013, %config_file_combo%, LAUNCH_SWITCHES, App013, 0
GLOBAL AppSwitchx13 := AppSwitch013
;;;;  
IniRead, AppSwitch014, %config_file_combo%, LAUNCH_SWITCHES, App014, 0
GLOBAL AppSwitchx14 := AppSwitch014
;;;;  
IniRead, AppSwitch015, %config_file_combo%, LAUNCH_SWITCHES, App015, 0
GLOBAL AppSwitchx15 := AppSwitch015
;;;;  
;;;;  
;;;;  
;;;;  
;;;;  
IniRead, AppSwitchDBG, %config_file_combo%, SYSTEM, DisplayErrors, 0
GLOBAL AppSwitchDebug := AppSwitchDBG
;;;;  
;;;;  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;  
;;;;  1
IniRead, AppDir001, %config_file_combo%, LAUNCH_TARGETS, LauncherDirectory001, UNDEFINED_001
GLOBAL AppDIRx01 := AppDir001
IniRead, AppExe001, %config_file_combo%, LAUNCH_TARGETS, LauncherExecutable001, UNDEFINED_001
GLOBAL AppEXEx01 := AppExe001
;;;;  
;;;;  2
IniRead, AppDir002, %config_file_combo%, LAUNCH_TARGETS, LauncherDirectory002, UNDEFINED_002
GLOBAL AppDIRx02 := AppDir002
IniRead, AppExe002, %config_file_combo%, LAUNCH_TARGETS, LauncherExecutable002, UNDEFINED_002
GLOBAL AppEXEx02 := AppExe002
;;;;  
;;;;  3
IniRead, AppDir003, %config_file_combo%, LAUNCH_TARGETS, LauncherDirectory003, UNDEFINED_003
GLOBAL AppDIRx03 := AppDir003
IniRead, AppExe003, %config_file_combo%, LAUNCH_TARGETS, LauncherExecutable003, UNDEFINED_003
GLOBAL AppEXEx03 := AppExe003
;;;;  
;;;;  4
IniRead, AppDir004, %config_file_combo%, LAUNCH_TARGETS, LauncherDirectory004, UNDEFINED_004
GLOBAL AppDIRx04 := AppDir004
IniRead, AppExe004, %config_file_combo%, LAUNCH_TARGETS, LauncherExecutable004, UNDEFINED_004
GLOBAL AppEXEx04 := AppExe004
;;;;  
;;;;  5
IniRead, AppDir005, %config_file_combo%, LAUNCH_TARGETS, LauncherDirectory005, UNDEFINED_005
GLOBAL AppDIRx05 := AppDir005
IniRead, AppExe005, %config_file_combo%, LAUNCH_TARGETS, LauncherExecutable005, UNDEFINED_005
GLOBAL AppEXEx05 := AppExe005
;;;;  
;;;;  6
IniRead, AppDir006, %config_file_combo%, LAUNCH_TARGETS, LauncherDirectory006, UNDEFINED_006
GLOBAL AppDIRx06 := AppDir006
IniRead, AppExe006, %config_file_combo%, LAUNCH_TARGETS, LauncherExecutable006, UNDEFINED_006
GLOBAL AppEXEx06 := AppExe006
;;;;  
;;;;  7
IniRead, AppDir007, %config_file_combo%, LAUNCH_TARGETS, LauncherDirectory007, UNDEFINED_007
GLOBAL AppDIRx07 := AppDir007
IniRead, AppExe007, %config_file_combo%, LAUNCH_TARGETS, LauncherExecutable007, UNDEFINED_007
GLOBAL AppEXEx07 := AppExe007
;;;;  
;;;;  8
IniRead, AppDir008, %config_file_combo%, LAUNCH_TARGETS, LauncherDirectory008, UNDEFINED_008
GLOBAL AppDIRx08 := AppDir008
IniRead, AppExe008, %config_file_combo%, LAUNCH_TARGETS, LauncherExecutable008, UNDEFINED_008
GLOBAL AppEXEx08 := AppExe008
;;;;  
;;;;  9
IniRead, AppDir009, %config_file_combo%, LAUNCH_TARGETS, LauncherDirectory009, UNDEFINED_009
GLOBAL AppDIRx09 := AppDir009
IniRead, AppExe009, %config_file_combo%, LAUNCH_TARGETS, LauncherExecutable009, UNDEFINED_009
GLOBAL AppEXEx09 := AppExe009
;;;;  
;;;;  10
IniRead, AppDir010, %config_file_combo%, LAUNCH_TARGETS, LauncherDirectory010, UNDEFINED_010
GLOBAL AppDIRx10 := AppDir010
IniRead, AppExe010, %config_file_combo%, LAUNCH_TARGETS, LauncherExecutable010, UNDEFINED_010
GLOBAL AppEXEx10 := AppExe010
;;;;  
;;;;  11
IniRead, AppDir011, %config_file_combo%, LAUNCH_TARGETS, LauncherDirectory011, UNDEFINED_011
GLOBAL AppDIRx11 := AppDir011
IniRead, AppExe011, %config_file_combo%, LAUNCH_TARGETS, LauncherExecutable011, UNDEFINED_011
GLOBAL AppEXEx11 := AppExe011
;;;;  
;;;;  12
IniRead, AppDir012, %config_file_combo%, LAUNCH_TARGETS, LauncherDirectory012, UNDEFINED_012
GLOBAL AppDIRx12 := AppDir012
IniRead, AppExe012, %config_file_combo%, LAUNCH_TARGETS, LauncherExecutable012, UNDEFINED_012
GLOBAL AppEXEx12 := AppExe012
;;;;  
;;;;  13
IniRead, AppDir013, %config_file_combo%, LAUNCH_TARGETS, LauncherDirectory013, UNDEFINED_013
GLOBAL AppDIRx13 := AppDir013
IniRead, AppExe013, %config_file_combo%, LAUNCH_TARGETS, LauncherExecutable013, UNDEFINED_013
GLOBAL AppEXEx13 := AppExe013
;;;;  
;;;;  14
IniRead, AppDir014, %config_file_combo%, LAUNCH_TARGETS, LauncherDirectory014, UNDEFINED_014
GLOBAL AppDIRx14 := AppDir014
IniRead, AppExe014, %config_file_combo%, LAUNCH_TARGETS, LauncherExecutable012, UNDEFINED_014
GLOBAL AppEXEx14 := AppExe014
;;;;  
;;;;  15
IniRead, AppDir015, %config_file_combo%, LAUNCH_TARGETS, LauncherDirectory015, UNDEFINED_015
GLOBAL AppDIRx15 := AppDir015
IniRead, AppExe015, %config_file_combo%, LAUNCH_TARGETS, LauncherExecutable015, UNDEFINED_015
GLOBAL AppEXEx15 := AppExe015
;;;;  
;;;;  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;  
;;;;  
IniRead, StartDelay, %config_file_combo%, SYSTEM, StartupDelay, 6000
GLOBAL StartupDelay := StartDelay

Sleep, %StartupDelay%



IniRead, bApp1Delay, %config_file_combo%, LAUNCH_DELAYS, App001, -550
GLOBAL App1Delay := "-" . bApp1Delay
IniRead, bApp2Delay, %config_file_combo%, LAUNCH_DELAYS, App002, -570
GLOBAL App2Delay := "-" . bApp2Delay
IniRead, bApp3Delay, %config_file_combo%, LAUNCH_DELAYS, App003, -590
GLOBAL App3Delay := "-" . bApp3Delay
IniRead, bApp4Delay, %config_file_combo%, LAUNCH_DELAYS, App004, -610
GLOBAL App4Delay := "-" . bApp4Delay
IniRead, bApp5Delay, %config_file_combo%, LAUNCH_DELAYS, App005, -630
GLOBAL App5Delay := "-" . bApp5Delay
IniRead, bApp6Delay, %config_file_combo%, LAUNCH_DELAYS, App006, -650
GLOBAL App6Delay := "-" . bApp6Delay
IniRead, bApp7Delay, %config_file_combo%, LAUNCH_DELAYS, App007, -670
GLOBAL App7Delay := "-" . bApp7Delay
IniRead, bApp8Delay, %config_file_combo%, LAUNCH_DELAYS, App008, -690
GLOBAL App8Delay := "-" . bApp8Delay
IniRead, bApp9Delay, %config_file_combo%, LAUNCH_DELAYS, App009, -710
GLOBAL App9Delay := "-" . bApp9Delay
IniRead, bApp10Delay, %config_file_combo%, LAUNCH_DELAYS, App010, -730
GLOBAL App10Delay := "-" . bApp10Delay
IniRead, bApp11Delay, %config_file_combo%, LAUNCH_DELAYS, App011, -750
GLOBAL App11Delay := "-" . bApp11Delay
IniRead, bApp12Delay, %config_file_combo%, LAUNCH_DELAYS, App012, -760
GLOBAL App12Delay := "-" . bApp12Delay
IniRead, bApp13Delay, %config_file_combo%, LAUNCH_DELAYS, App013, -770
GLOBAL App13Delay := "-" . bApp13Delay
IniRead, bApp14Delay, %config_file_combo%, LAUNCH_DELAYS, App014, -780
GLOBAL App14Delay := "-" . bApp14Delay
IniRead, bApp15Delay, %config_file_combo%, LAUNCH_DELAYS, App015, -790
GLOBAL App15Delay := "-" . bApp15Delay


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
If(AppSwitchx13="1")
{
    SetTimer, APPEvent013, %App13Delay%
}
If(AppSwitchx14="1")
{
    SetTimer, APPEvent014, %App14Delay%
}
If(AppSwitchx15="1")
{
    SetTimer, APPEvent015, %App15Delay%
}

Sleep, 1500

IniRead, PDANetAutoCon, %config_file_combo%, SYSTEM, PDANetAuto, 0
GLOBAL PDANetAutoConnect := PDANetAutoCon

If(PDANetAutoConnect="1")
{
IniRead, PDANetAutoDelay, %config_file_combo%, SYSTEM, PDANetAutoDelay, 7000
IniRead, PDANetDIR, %config_file_combo%, PDANet, Dir, C:\Program Files (x86)\PdaNet for Android
IniRead, PDANetEXE, %config_file_combo%, PDANet, Exe, PdaNetPC.exe
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



IniRead, bSystemExitDelay, %config_file_combo%, SYSTEM, SystemExitDelay, 10000
GLOBAL SystemExitDelay := bSystemExitDelay

Sleep, %SystemExitDelay%
ExitApp
Return
Return
Return


APPEvent001:
If(AppDIRx01 ="UNDEFINED_001")
{
    If(AppSwitchDebug="1")
    {
    MsgBox, , %engine_title%, App {001} Launch Enabled But Undefined (1)
    }
}
Else If(AppEXEx01="UNDEFINED_001")
{
    If(AppSwitchDebug="1")
    {
    MsgBox, , %engine_title%, App {001} Launch Enabled But Undefined (2)
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
    MsgBox, , %engine_title%, App {002} Launch Enabled But Undefined (1)
    }
}
Else If(AppEXEx02="UNDEFINED_002")
{
    If(AppSwitchDebug="1")
    {
    MsgBox, , %engine_title%, App {002} Launch Enabled But Undefined (2)
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
    MsgBox, , %engine_title%, App {003} Launch Enabled But Undefined (1)
    }
}
Else If(AppEXEx03="UNDEFINED_003")
{
    If(AppSwitchDebug="1")
    {
    MsgBox, , %engine_title%, App {003} Launch Enabled But Undefined (2)
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
    MsgBox, , %engine_title%, App {004} Launch Enabled But Undefined (1)
    }
}
Else If(AppEXEx04="UNDEFINED_004")
{
    If(AppSwitchDebug="1")
    {
    MsgBox, , %engine_title%, App {004} Launch Enabled But Undefined (2)
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
    MsgBox, , %engine_title%, App {005} Launch Enabled But Undefined (1)
    }
}
Else If(AppEXEx05="UNDEFINED_005")
{
    If(AppSwitchDebug="1")
    {
    MsgBox, , %engine_title%, App {005} Launch Enabled But Undefined (2)
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
    MsgBox, , %engine_title%, App {006} Launch Enabled But Undefined (1)
    }
}
Else If(AppEXEx06="UNDEFINED_006")
{
    If(AppSwitchDebug="1")
    {
    MsgBox, , %engine_title%, App {006} Launch Enabled But Undefined (2)
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
    MsgBox, , %engine_title%, App {007} Launch Enabled But Undefined (1)
    }
}
Else If(AppEXEx07="UNDEFINED_007")
{
    If(AppSwitchDebug="1")
    {
    MsgBox, , %engine_title%, App {007} Launch Enabled But Undefined (2)
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
    MsgBox, , %engine_title%, App {008} Launch Enabled But Undefined (1)
    }
}
Else If(AppEXEx08="UNDEFINED_008")
{
    If(AppSwitchDebug="1")
    {
    MsgBox, , %engine_title%, App {008} Launch Enabled But Undefined (2)
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
    MsgBox, , %engine_title%, App {009} Launch Enabled But Undefined (1)
    }
}
Else If(AppEXEx09="UNDEFINED_009")
{
    If(AppSwitchDebug="1")
    {
    MsgBox, , %engine_title%, App {009} Launch Enabled But Undefined (2)
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
    MsgBox, , %engine_title%, App {010} Launch Enabled But Undefined (1)
    }
}
Else If(AppEXEx10="UNDEFINED_010")
{
    If(AppSwitchDebug="1")
    {
    MsgBox, , %engine_title%, App {010} Launch Enabled But Undefined (2)
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
    MsgBox, , %engine_title%, App {011} Launch Enabled But Undefined (1)
    }
}
Else If(AppEXEx11="UNDEFINED_011")
{
    If(AppSwitchDebug="1")
    {
    MsgBox, , %engine_title%, App {011} Launch Enabled But Undefined (2)
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
    MsgBox, , %engine_title%, App {012} Launch Enabled But Undefined (1)
    }
}
Else If(AppEXEx12="UNDEFINED_012")
{
    If(AppSwitchDebug="1")
    {
    MsgBox, , %engine_title%, App {012} Launch Enabled But Undefined (2)
    }
}
Else
    {
        Run, %AppDIRx12%\%AppEXEx12%
    }
Return



APPEvent013:
If(AppDIRx13="UNDEFINED_013")
{
    If(AppSwitchDebug="1")
    {
    MsgBox, , %engine_title%, App {013} Launch Enabled But Undefined (1)
    }
}
Else If(AppEXEx13="UNDEFINED_013")
{
    If(AppSwitchDebug="1")
    {
    MsgBox, , %engine_title%, App {013} Launch Enabled But Undefined (2)
    }
}
Else
    {
        Run, %AppDIRx13%\%AppEXEx13%
    }
Return



APPEvent014:
If(AppDIRx14="UNDEFINED_014")
{
    If(AppSwitchDebug="1")
    {
    MsgBox, , %engine_title%, App {014} Launch Enabled But Undefined (1)
    }
}
Else If(AppEXEx14="UNDEFINED_014")
{
    If(AppSwitchDebug="1")
    {
    MsgBox, , %engine_title%, App {014} Launch Enabled But Undefined (2)
    }
}
Else
    {
        Run, %AppDIRx14%\%AppEXEx14%
    }
Return



APPEvent015:
If(AppDIRx15="UNDEFINED_015")
{
    If(AppSwitchDebug="1")
    {
    MsgBox, , %engine_title%, App {015} Launch Enabled But Undefined (1)
    }
}
Else If(AppEXEx15="UNDEFINED_015")
{
    If(AppSwitchDebug="1")
    {
    MsgBox, , %engine_title%, App {015} Launch Enabled But Undefined (2)
    }
}
Else
    {
        Run, %AppDIRx15%\%AppEXEx15%
    }
Return




















TrayBTN_EXIT:
ExitApp
Return


TrayBTN_SETTINGS:
Run, "notepad.exe" "%config_file_combo%"
Return


TrayBTN_CONTAINER:
Run, "explorer.exe" "%A_ScriptDir%"
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
; IniRead, bUACElevate, %config_file_combo%, DEBUG, RunAsAdministrator, 0
; GLOBAL UACElevate := bUACElevate
IniRead, UACElev, %config_file_combo%, SYSTEM, RunWithAdmin, 1
GLOBAL UACElevate := UACElev

; GLOBAL RunEngineContainer := A_ScriptDir . "\" . A_ScriptName
GLOBAL RunEngineContainer := "'" . A_ScriptDir . "\" . A_ScriptName . "'"



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
; GLOBAL UACElevate := "1"    ;;;  FORCE ADMIN ELEVATE

If(UACElevate="0")
{
  Run, schtasks.exe /create /TN "Core_WindowsLauncherOnStartup" /TR "%RunEngineContainer%" /sc ONLOGON /RU "%A_ComputerName%\%A_UserName%" /RL LIMITED /F
  MsgBox,, [%engine_title%]  Auto-Start With Windows, Successfully Enabled Auto-Starting %engine_title% With Windows (LIMITED).
  Return
}
If(UACElevate="1")
{
  Run, schtasks.exe /create /TN "Core_WindowsLauncherOnStartup" /TR "%RunEngineContainer%" /sc ONLOGON /RU "%A_ComputerName%\%A_UserName%" /RL HIGHEST /F
  MsgBox,, [%engine_title%]  Auto-Start With Windows, Successfully Enabled Auto-Starting %engine_title% With Windows (HIGHEST).
  Return
}
Return

TrayBTN_SetToRunWithWindowsOFF:
  Run, schtasks.exe /delete /TN "Core_WindowsLauncherOnStartup" /F
  MsgBox,, [%engine_title%]  Auto-Start With Windows, Successfully Disabled Auto-Starting {%engine_title%} With Windows.
Return




































AutoSetToRunWithWindowsMAIN:
GLOBAL CurrentScriptFile := A_ScriptName
IniRead, UACElev, %config_file_combo%, SYSTEM, RunWithAdmin, 1
GLOBAL UACElevate := UACElev

; GLOBAL RunEngineContainer := A_ScriptDir . "\" . A_ScriptName
GLOBAL RunEngineContainer := "'" . A_ScriptDir . "\" . A_ScriptName . "'"



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
AutoSetToRunWithWindowsToggleFlag := JEE_RunGetStdOut("PowerShell.exe -ExecutionPolicy Bypass -File " Path_To_File)

; MsgBox, , Title, %Path_To_File%

        If(AutoSetToRunWithWindowsToggleFlag="" && "null")
        {
            ; MsgBox, %engine_title% Is Currently Set To Auto-Start With Windows.
            GLOBAL AutoSetToRunWithWindowsToggleFlag := "0"
          ; Return
        }
        else
        {
          ; MsgBox, %engine_title% Is Currently NOT Set To Auto-Start With Windows.
          GLOBAL AutoSetToRunWithWindowsToggleFlag := "1"
          ; Return
        }





If(AutoSetToRunWithWindowsToggleFlag="0")
{
  GLOBAL AutoSetToRunWithWindowsToggleFlag := "1"
  SetTimer, AutoSetToRunWithWindowsOFF, OFF
  SetTimer, AutoSetToRunWithWindowsON, -150
  Return
}
If(AutoSetToRunWithWindowsToggleFlag="1")
{
  GLOBAL AutoSetToRunWithWindowsToggleFlag := "0"
  SetTimer, AutoSetToRunWithWindowsON, OFF
  SetTimer, AutoSetToRunWithWindowsOFF, -150
  Return
}
Return


AutoSetToRunWithWindowsON:
; GLOBAL UACElevate := "1"    ;;;  FORCE ADMIN ELEVATE
Run, schtasks.exe /delete /TN "Core_WindowsLauncherOnStartup" /F
Sleep, 250
If(UACElevate="0")
{
  Run, schtasks.exe /create /TN "Core_WindowsLauncherOnStartup" /TR "%RunEngineContainer%" /sc ONLOGON /RU "%A_ComputerName%\%A_UserName%" /RL LIMITED /F
  MsgBox,, [%engine_title%]  Auto-Start With Windows On First Run, Successfully Enabled Auto-Starting %engine_title% With Windows (LIMITED).
  Return
}
If(UACElevate="1")
{
  Run, schtasks.exe /create /TN "Core_WindowsLauncherOnStartup" /TR "%RunEngineContainer%" /sc ONLOGON /RU "%A_ComputerName%\%A_UserName%" /RL HIGHEST /F
  MsgBox,, [%engine_title%]  Auto-Start With Windows On First Run, Successfully Enabled Auto-Starting %engine_title% With Windows (HIGHEST).
  Return
}
Return

AutoSetToRunWithWindowsOFF:
  Run, schtasks.exe /delete /TN "Core_WindowsLauncherOnStartup" /F
  Sleep 250
;   MsgBox,, [%engine_title%]  Auto-Start With Windows On First Run, Successfully Disabled Auto-Starting {%engine_title%} With Windows.
    If(UACElevate="0")
    {
    Run, schtasks.exe /create /TN "Core_WindowsLauncherOnStartup" /TR "%RunEngineContainer%" /sc ONLOGON /RU "%A_ComputerName%\%A_UserName%" /RL LIMITED /F
    MsgBox,, [%engine_title%]  Auto-Start With Windows On First Run, Successfully Enabled Auto-Starting %engine_title% With Windows (LIMITED).
    Return
    }
    If(UACElevate="1")
    {
    Run, schtasks.exe /create /TN "Core_WindowsLauncherOnStartup" /TR "%RunEngineContainer%" /sc ONLOGON /RU "%A_ComputerName%\%A_UserName%" /RL HIGHEST /F
    MsgBox,, [%engine_title%]  Auto-Start With Windows On First Run, Successfully Enabled Auto-Starting %engine_title% With Windows (HIGHEST).
    Return
    }
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



;;;; OLD FUNCTIONS INCLUDE FILE NOT CURRENTLY USED IN CURRENT EXECUTION PATTERNS
; #Include, functions.toolkit











































;;;;;;;;;;;;;;;   OLD EXAMPLE APPROACH



; APPEvent001:
; If(AppDIRx01 ="UNDEFINED_001")
; {
;     If(AppSwitchDebug="1")
;     {
;     ; MsgBox, , %engine_title%, undefined called
;     }
; }
; Else If(AppEXEx01="UNDEFINED_001")
; {
;     If(AppSwitchDebug="1")
;     {
;     ; MsgBox, , %engine_title%, undefined called
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
;     ; MsgBox, , %engine_title%, undefined called
;     }
; }
; Else If(AppEXEx02="UNDEFINED_002")
; {
;     If(AppSwitchDebug="1")
;     {
;     ; MsgBox, , %engine_title%, undefined called
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
;     ; MsgBox, , %engine_title%, undefined called
;     }
; }
; Else If(AppEXEx03="UNDEFINED_003")
; {
;     If(AppSwitchDebug="1")
;     {
;     ; MsgBox, , %engine_title%, undefined called
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
;     ; MsgBox, , %engine_title%, undefined called
;     }
; }
; Else If(AppEXEx04="UNDEFINED_004")
; {
;     If(AppSwitchDebug="1")
;     {
;     ; MsgBox, , %engine_title%, undefined called
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
;     ; MsgBox, , %engine_title%, undefined called
;     }
; }
; Else If(AppEXEx05="UNDEFINED_005")
; {
;     If(AppSwitchDebug="1")
;     {
;     ; MsgBox, , %engine_title%, undefined called
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
;     ; MsgBox, , %engine_title%, undefined called
;     }
; }
; Else If(AppEXEx06="UNDEFINED_006")
; {
;     If(AppSwitchDebug="1")
;     {
;     ; MsgBox, , %engine_title%, undefined called
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
;     ; MsgBox, , %engine_title%, undefined called
;     }
; }
; Else If(AppEXEx07="UNDEFINED_007")
; {
;     If(AppSwitchDebug="1")
;     {
;     ; MsgBox, , %engine_title%, undefined called
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
;     ; MsgBox, , %engine_title%, undefined called
;     }
; }
; Else If(AppEXEx08="UNDEFINED_008")
; {
;     If(AppSwitchDebug="1")
;     {
;     ; MsgBox, , %engine_title%, undefined called
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
;     ; MsgBox, , %engine_title%, undefined called
;     }
; }
; Else If(AppEXEx09="UNDEFINED_009")
; {
;     If(AppSwitchDebug="1")
;     {
;     ; MsgBox, , %engine_title%, undefined called
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
;     ; MsgBox, , %engine_title%, undefined called
;     }
; }
; Else If(AppEXEx10="UNDEFINED_010")
; {
;     If(AppSwitchDebug="1")
;     {
;     ; MsgBox, , %engine_title%, undefined called
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
;     ; MsgBox, , %engine_title%, undefined called
;     }
; }
; Else If(AppEXEx11="UNDEFINED_011")
; {
;     If(AppSwitchDebug="1")
;     {
;     ; MsgBox, , %engine_title%, undefined called
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
;     ; MsgBox, , %engine_title%, undefined called
;     }
; }
; Else If(AppEXEx12="UNDEFINED_012")
; {
;     If(AppSwitchDebug="1")
;     {
;     ; MsgBox, , %engine_title%, undefined called
;     }
; }
; Else
;     {
;         Run, %AppDIRx12%\%AppEXEx12%
;     }
; Return



; #Include, functions.toolkit