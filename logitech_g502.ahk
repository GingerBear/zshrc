#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Desktop Switching
F16::
SendInput ^#{Right}
return

F17::
SendInput ^#{Left}
return

F19 & F16::
return

F19 & F17::
return

; Back and Forward
F13::
SendInput {XButton2}
return

F14::
SendInput {XButton1}
return

; Volume
F19 & WheelUp::
SendInput {Volume_Up}
return

F19 & WheelDown::
SendInput {Volume_Down}
return

F19 & MButton::
SendInput {Volume_Mute}
return

F18::
SendInput {Media_Play_Pause}
return

; Task View
F15::
SendInput #{Tab}
return
