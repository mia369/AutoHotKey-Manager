Process,priority, , high  ;脚本进程优先级为高
#NoTrayIcon
#Persistent ;让脚本持久运行
#SingleInstance,Force ;决定当脚本已经运行时是否允许它再次运行。
#NoEnv
SendMode Input
DetectHiddenWindows, on
SetWinDelay, 0


#1::
terminal := WinExist("ahk_exe WindowsTerminal.exe")
if (terminal) 
{
	active := WinActive("ahk_id " terminal)
	if (active)
	{
		Send !+{F11}
	}
	else
	{
		Send !+{F11}
	}
}
Return

#2::
terminal := WinExist("ahk_exe WindowsTerminal.exe")
if (terminal) 
{
	active := WinActive("ahk_id " terminal)
	if (active)
	{
		Send !+{F12}
	}
	else
	{
		Send !+{F12}
	}
}
Return


#3::
	Run, C:\Users\zsqmi\AppData\Local\Microsoft\WindowsApps\wt.exe -w _quake -d C:\Users\zsqmi\Desktop