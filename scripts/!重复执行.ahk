Process,priority, , high  ;脚本进程优先级为高
;#NoTrayIcon
#Persistent ;让脚本持久运行
#SingleInstance,Force ;决定当脚本已经运行时是否允许它再次运行。

;===========================================================
;** 循环执行设定的按键, ctrl+alt+Home开启 ctrl+alt+End关闭
;===========================================================

stopFlag := true  ;设置运行Flag

^!Home::
stopFlag := true
while (stopFlag)
{ 
    Sleep, 1000
	Send {F5}
    if (!stopFlag)
    {
        break
    }
}

^!End::
stopFlag := false
