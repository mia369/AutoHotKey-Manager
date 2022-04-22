Process,priority, , high  ;脚本进程优先级为高
#NoTrayIcon
#Persistent ;让脚本持久运行
#SingleInstance,Force ;决定当脚本已经运行时是否允许它再次运行。

;==================================================
;** 修改切换虚拟桌面快捷键
;==================================================
#Up::
Send #^{d}
WinActivate ahk_class Shell_TrayWnd
Return
#Down::
Send #^{F4}
WinActivate ahk_class Shell_TrayWnd
Return
#Left::
Send #^{Left}
WinActivate ahk_class Shell_TrayWnd
Return
#Right::
Send #^{Right}
WinActivate ahk_class Shell_TrayWnd
Return