#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Desktop Switching
WheelLeft::
SendInput ^#{Right}
return

WheelRight::
SendInput ^#{Left}
return

F18 & WheelLeft::
return

F18 & WheelRight::
return

; Volume
F18 & WheelUp::
SendInput {Volume_Up}
return

F18 & WheelDown::
SendInput {Volume_Down}
return

F18 & MButton::
SendInput {Volume_Mute}
return

F14::
SendInput {Media_Play_Pause}
return

; Task View
F13::
SendInput #{Tab}
return
