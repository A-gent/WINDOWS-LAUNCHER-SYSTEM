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


GLOBAL CONFIGFile := "winlauncher.cfg"
GLOBAL AppTitleRoot := "WinLauncher 2024"
Menu, Tray, Tip, %AppTitleRoot%



IniRead, UACElev, %A_ScriptDir%\%CONFIGFile%, SWITCHES, RunWithAdmin, 1
GLOBAL UACElevate := UACElev
Sleep, 500
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
IniRead, StartDelay, %A_ScriptDir%\%CONFIGFile%, DELAYS, StartupDelay, 6000
GLOBAL StartupDelay := StartDelay
;;;;  
;;;;  
IniRead, AppSwitch001, %A_ScriptDir%\%CONFIGFile%, SWITCHES, App001, 0
GLOBAL AppSwitchx01 := AppSwitch001
;;;;  
IniRead, AppSwitch002, %A_ScriptDir%\%CONFIGFile%, SWITCHES, App002, 0
GLOBAL AppSwitchx02 := AppSwitch002
;;;;  
IniRead, AppSwitch003, %A_ScriptDir%\%CONFIGFile%, SWITCHES, App003, 0
GLOBAL AppSwitchx03 := AppSwitch003
;;;;  
IniRead, AppSwitch004, %A_ScriptDir%\%CONFIGFile%, SWITCHES, App004, 0
GLOBAL AppSwitchx04 := AppSwitch004
;;;;  
IniRead, AppSwitch005, %A_ScriptDir%\%CONFIGFile%, SWITCHES, App005, 0
GLOBAL AppSwitchx05 := AppSwitch005
;;;;  
IniRead, AppSwitch006, %A_ScriptDir%\%CONFIGFile%, SWITCHES, App006, 0
GLOBAL AppSwitchx06 := AppSwitch006
;;;;  
IniRead, AppSwitch007, %A_ScriptDir%\%CONFIGFile%, SWITCHES, App007, 0
GLOBAL AppSwitchx07 := AppSwitch007
;;;;  
IniRead, AppSwitch008, %A_ScriptDir%\%CONFIGFile%, SWITCHES, App008, 0
GLOBAL AppSwitchx08 := AppSwitch008
;;;;  
IniRead, AppSwitch009, %A_ScriptDir%\%CONFIGFile%, SWITCHES, App009, 0
GLOBAL AppSwitchx09 := AppSwitch009
;;;;  
IniRead, AppSwitch010, %A_ScriptDir%\%CONFIGFile%, SWITCHES, App010, 0
GLOBAL AppSwitchx10 := AppSwitch010
;;;;  
;;;;  
IniRead, AppSwitchDBG, %A_ScriptDir%\%CONFIGFile%, SWITCHES, DisplayErrors, 0
GLOBAL AppSwitchDebug := AppSwitchDBG
;;;;  
;;;;  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;  
;;;;  1
IniRead, AppDir001, %A_ScriptDir%\%CONFIGFile%, LAUNCHER, LauncherDirectory001, UNDEFINED_001
GLOBAL AppDIRx01 := AppDir001
IniRead, AppExe001, %A_ScriptDir%\%CONFIGFile%, LAUNCHER, LauncherExecutable001, UNDEFINED_001
GLOBAL AppEXEx01 := AppExe001
;;;;  
;;;;  2
IniRead, AppDir002, %A_ScriptDir%\%CONFIGFile%, LAUNCHER, LauncherDirectory002, UNDEFINED_002
GLOBAL AppDIRx02 := AppDir002
IniRead, AppExe002, %A_ScriptDir%\%CONFIGFile%, LAUNCHER, LauncherExecutable002, UNDEFINED_002
GLOBAL AppEXEx02 := AppExe002
;;;;  
;;;;  3
IniRead, AppDir003, %A_ScriptDir%\%CONFIGFile%, LAUNCHER, LauncherDirectory003, UNDEFINED_003
GLOBAL AppDIRx03 := AppDir003
IniRead, AppExe003, %A_ScriptDir%\%CONFIGFile%, LAUNCHER, LauncherExecutable003, UNDEFINED_003
GLOBAL AppEXEx03 := AppExe003
;;;;  
;;;;  4
IniRead, AppDir004, %A_ScriptDir%\%CONFIGFile%, LAUNCHER, LauncherDirectory004, UNDEFINED_004
GLOBAL AppDIRx04 := AppDir004
IniRead, AppExe004, %A_ScriptDir%\%CONFIGFile%, LAUNCHER, LauncherExecutable004, UNDEFINED_004
GLOBAL AppEXEx04 := AppExe004
;;;;  
;;;;  5
IniRead, AppDir005, %A_ScriptDir%\%CONFIGFile%, LAUNCHER, LauncherDirectory005, UNDEFINED_005
GLOBAL AppDIRx05 := AppDir005
IniRead, AppExe005, %A_ScriptDir%\%CONFIGFile%, LAUNCHER, LauncherExecutable005, UNDEFINED_005
GLOBAL AppEXEx05 := AppExe005
;;;;  
;;;;  6
IniRead, AppDir006, %A_ScriptDir%\%CONFIGFile%, LAUNCHER, LauncherDirectory006, UNDEFINED_006
GLOBAL AppDIRx06 := AppDir006
IniRead, AppExe006, %A_ScriptDir%\%CONFIGFile%, LAUNCHER, LauncherExecutable006, UNDEFINED_006
GLOBAL AppEXEx06 := AppExe006
;;;;  
;;;;  7
IniRead, AppDir007, %A_ScriptDir%\%CONFIGFile%, LAUNCHER, LauncherDirectory007, UNDEFINED_007
GLOBAL AppDIRx07 := AppDir007
IniRead, AppExe007, %A_ScriptDir%\%CONFIGFile%, LAUNCHER, LauncherExecutable007, UNDEFINED_007
GLOBAL AppEXEx07 := AppExe007
;;;;  
;;;;  8
IniRead, AppDir008, %A_ScriptDir%\%CONFIGFile%, LAUNCHER, LauncherDirectory008, UNDEFINED_008
GLOBAL AppDIRx08 := AppDir008
IniRead, AppExe008, %A_ScriptDir%\%CONFIGFile%, LAUNCHER, LauncherExecutable008, UNDEFINED_008
GLOBAL AppEXEx08 := AppExe008
;;;;  
;;;;  9
IniRead, AppDir009, %A_ScriptDir%\%CONFIGFile%, LAUNCHER, LauncherDirectory009, UNDEFINED_009
GLOBAL AppDIRx09 := AppDir009
IniRead, AppExe009, %A_ScriptDir%\%CONFIGFile%, LAUNCHER, LauncherExecutable009, UNDEFINED_009
GLOBAL AppEXEx09 := AppExe009
;;;;  
;;;;  10
IniRead, AppDir010, %A_ScriptDir%\%CONFIGFile%, LAUNCHER, LauncherDirectory010, UNDEFINED_010
GLOBAL AppDIRx10 := AppDir010
IniRead, AppExe010, %A_ScriptDir%\%CONFIGFile%, LAUNCHER, LauncherExecutable010, UNDEFINED_010
GLOBAL AppEXEx10 := AppExe010
;;;;  
;;;;  11
IniRead, AppDir011, %A_ScriptDir%\%CONFIGFile%, LAUNCHER, LauncherDirectory011, UNDEFINED_011
GLOBAL AppDIRx11 := AppDir011
IniRead, AppExe011, %A_ScriptDir%\%CONFIGFile%, LAUNCHER, LauncherExecutable011, UNDEFINED_011
GLOBAL AppEXEx11 := AppExe011
;;;;  
;;;;  12
IniRead, AppDir012, %A_ScriptDir%\%CONFIGFile%, LAUNCHER, LauncherDirectory012, UNDEFINED_012
GLOBAL AppDIRx12 := AppDir012
IniRead, AppExe012, %A_ScriptDir%\%CONFIGFile%, LAUNCHER, LauncherExecutable012, UNDEFINED_012
GLOBAL AppEXEx12 := AppExe012
;;;;  
;;;;  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



Sleep, %StartupDelay%


IniRead, App1Delay, %A_ScriptDir%\%CONFIGFile%, DELAYS, App001, -550
IniRead, App2Delay, %A_ScriptDir%\%CONFIGFile%, DELAYS, App002, -570
IniRead, App3Delay, %A_ScriptDir%\%CONFIGFile%, DELAYS, App003, -590
IniRead, App4Delay, %A_ScriptDir%\%CONFIGFile%, DELAYS, App004, -610
IniRead, App5Delay, %A_ScriptDir%\%CONFIGFile%, DELAYS, App005, -630
IniRead, App6Delay, %A_ScriptDir%\%CONFIGFile%, DELAYS, App006, -650
IniRead, App7Delay, %A_ScriptDir%\%CONFIGFile%, DELAYS, App007, -670
IniRead, App8Delay, %A_ScriptDir%\%CONFIGFile%, DELAYS, App008, -690
IniRead, App9Delay, %A_ScriptDir%\%CONFIGFile%, DELAYS, App009, -710
IniRead, App10Delay, %A_ScriptDir%\%CONFIGFile%, DELAYS, App010, -730
IniRead, App11Delay, %A_ScriptDir%\%CONFIGFile%, DELAYS, App011, -750
IniRead, App12Delay, %A_ScriptDir%\%CONFIGFile%, DELAYS, App012, -770


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

IniRead, PDANetAutoCon, %A_ScriptDir%\%CONFIGFile%, SWITCHES, PDANetAuto, 0
GLOBAL PDANetAutoConnect := PDANetAutoCon

If(PDANetAutoConnect="1")
{
IniRead, PDANetAutoDelay, %A_ScriptDir%\%CONFIGFile%, DELAYS, PDANetAutoDelay, 7000
IniRead, PDANetDIR, %A_ScriptDir%\%CONFIGFile%, PDANet, Dir, C:\Program Files (x86)\PdaNet for Android
IniRead, PDANetEXE, %A_ScriptDir%\%CONFIGFile%, PDANet, Exe, PdaNetPC.exe
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