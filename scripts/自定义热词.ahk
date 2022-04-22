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
	:oc?:@g::xiaozhennan1995@gmail.com
}
{
	:oc?:@126::xiao_zhennan@126.com
}
{
	:oc?:@ww1::WeiWan
}
{
	:oc?:@ww2::WeiWan5675
}
{
	:oc?:@ww3::未完
}
{
	:*:!date::
	FormatTime, CurrentDate,, yyyy-MM-dd HH:mm:ss
	SendInput %CurrentDate%
	Return
}