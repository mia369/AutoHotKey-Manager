Process,priority, , high
#NoTrayIcon
#Persistent
#SingleInstance,Force
#NoEnv

;==================================================
;** 连续复制功能 ctrl+shift+c 开启或关闭, 使用shift+c选择复制
;==================================================

flag_copy := 0	;这个模式变量不可少，一定得有
 
^+c::		;这个键主要是用来设定复制的模式的
flag_copy := not flag_copy
sleep,50
if flag_copy = 1
	msgbox,打开连续复制功能！
	clipboard =
if flag_copy = 0
	msgbox,关闭连续复制功能！
	clipboard =
return
 

+c::		
if flag_copy = 0
{
	Send,^c 			;;用Alt+C替换系统的复制键Ctrl+C
}
if flag_copy =1
{
	;~ msgbox,复制前剪切板的值为：%clipboard%
	var = %clipboard% ;新的叠加赋值
	send ^c
	sleep,50
	myvar = %var%%clipboard%
	sleep,20
	clipboard := myvar
	sleep,20
	;~ msgbox,复制后剪切板的值为：%clipboard%
}
return