Process,priority, , high
#NoTrayIcon
#Persistent
#SingleInstance,Force
#NoEnv

;==================================================
;** AHK定时执行Notes同步OneDrive
;==================================================
SetTimer CloseMailWarnings, 300000

CloseMailWarnings()
{
	cmdSilenceReturn("E:\MyCloud\Backup\tools\Windows\NotesSync.bat")
}

cmdSilenceReturn(command){
	CMDReturn:=""
	cmdFN:="NotesSyncTask"
	try{
		RunWait,% ComSpec " /C " command " >> ""%Temp%\" cmdFN ".log""",, Hide
		FileRead, CMDReturn, %A_Temp%\%cmdFN%.log
	}catch{}
	return CMDReturn
}