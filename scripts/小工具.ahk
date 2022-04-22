Process,priority, , high
#NoTrayIcon
#Persistent
#SingleInstance,Force
#NoEnv
;==================================================
;** ctrl+win+c 复制文件全路径
;==================================================
#^C::
send ^c
sleep,200
clipboard=%clipboard% 
Return


;==================================================
;** 摁住win+鼠标左键轻松拖拽窗口
;==================================================
#LButton::
CoordMode, Mouse  ; 切换到屏幕/绝对坐标。
MouseGetPos, EWD_MouseStartX, EWD_MouseStartY, EWD_MouseWin
WinGetPos, EWD_OriginalPosX, EWD_OriginalPosY,,, ahk_id %EWD_MouseWin%
WinGet, EWD_WinState, MinMax, ahk_id %EWD_MouseWin% 
if EWD_WinState = 0  ; 仅在窗口不处于最大化状态时
    SetTimer, EWD_WatchMouse, 10 ; 在用户拖动时跟踪鼠标.
Return

EWD_WatchMouse:
GetKeyState, EWD_LButtonState, LButton, P
if EWD_LButtonState = U  ; 按钮已经释放, 所以拖动结束.
{
    SetTimer, EWD_WatchMouse, off
    Return
}
GetKeyState, EWD_EscapeState, Escape, P
if EWD_EscapeState = D  ; 按下了 Escape, 所以取消拖动.
{
    SetTimer, EWD_WatchMouse, off
    WinMove, ahk_id %EWD_MouseWin%,, %EWD_OriginalPosX%, %EWD_OriginalPosY%
    Return
}
; 否则, 改变窗口的位置以匹配
; 用户拖动鼠标引起的鼠标坐标变化:
CoordMode, Mouse
MouseGetPos, EWD_MouseX, EWD_MouseY
WinGetPos, EWD_WinX, EWD_WinY,,, ahk_id %EWD_MouseWin%
SetWinDelay, -1   ; 让下面的移动更快速/平滑.
WinMove, ahk_id %EWD_MouseWin%,, EWD_WinX + EWD_MouseX - EWD_MouseStartX, EWD_WinY + EWD_MouseY - EWD_MouseStartY
EWD_MouseStartX := EWD_MouseX  ; 为下一次调用此子程序进行更新.
EWD_MouseStartY := EWD_MouseY
Return



