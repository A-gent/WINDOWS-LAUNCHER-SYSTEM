#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

Sleep, 2000
MouseMove, 0, 0




Run, C:\Program Files (x86)\PdaNet for Android\PdaNetPC.exe
Sleep, 500
; TrayIcon_Button("PdaNetPC.exe")



ExitApp



#Include, functions.toolkit