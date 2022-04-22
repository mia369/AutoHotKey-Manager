Process,priority, , high
#NoTrayIcon
#Persistent
#SingleInstance,Force
#NoEnv
;==================================================
;** 快捷键 Win+ESC 使当前窗口置顶/取消置顶
;==================================================
#`::
WinSet, AlwaysOnTop, toggle,A
WinGetTitle, getTitle, A
Winget, getTop,ExStyle,A
if (getTop & 0x8){
    TrayTip 已置顶, 窗口标题: `n%getTitle%,10,1
	SoundPlay, %A_ScriptDir%\..\resources\Sound\on.wav
} else {
    TrayTip 取消置顶, 窗口标题:`n %getTitle%,10,1
	SoundPlay, %A_ScriptDir%\..\resources\Sound\off.wav
}

return
