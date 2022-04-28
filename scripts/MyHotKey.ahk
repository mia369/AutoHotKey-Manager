Process,priority, , high
#NoTrayIcon
#Persistent
#SingleInstance,Force
#NoEnv

;==================================================
;** 我的自定义快捷键
;==================================================

; Function to run a program or activate an already running instance 
RunOrActivateProgram(Program, WorkingDir="", WindowSize=""){ 
    SplitPath Program, ExeFile 
    Process, Exist, %ExeFile% 
    PID = %ErrorLevel% 
    if (PID = 0) { 
    Run, %Program%, %WorkingDir%, %WindowSize% 
    }else{ 
    WinActivate, ahk_pid %PID% 
    } 
}

;打开or切换谷歌浏览器  win+c
#C::
RunOrActivateProgram("C:\Program Files\Google\Chrome\Application\chrome.exe")
return 