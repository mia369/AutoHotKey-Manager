Process,priority, , high
#NoTrayIcon
#Persistent
#SingleInstance,Force
#NoEnv

;==================================================
;** 自定义添加热词 ctrl+shift+alt+insert 暂停
;** 格式 :oc?:{自定义命令}::xxxxxxxxxxxxxxxxx
;==================================================
^!+Insert::
Suspend
Return

{
	:oc?:@163::zsqmia@163.com
}
{
	:oc?:qq::1074258621
}
{
	:oc?:192::192.168.128.130
}
{
	:*:!date::
	FormatTime, CurrentDate,, yyyy-MM-dd HH:mm:ss
	SendInput %CurrentDate%
	Return
}