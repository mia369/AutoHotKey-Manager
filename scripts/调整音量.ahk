Process,priority, , high
#NoTrayIcon
#Persistent
#SingleInstance,Force
#NoEnv
;==================================================
;** 调整音量  win+> 放大 win+< 缩小 win+/ 静音
;==================================================
;Change volume
 #.:: Send {Volume_Up} ;Ctrl + NumPad Plus
 #,:: Send {Volume_Down} ;Shift + NumPad Minus
 #/::Send {Volume_Mute} ; Break key (mute)
 return
 
 
;==================================================
;** 鼠标调整音量  滚轮放大缩小
;==================================================
#If (MouseIsOveRControl("MSTaskListWClass1"))
	Wheelup::SoundSet,+10
	WheelDown::SoundSet,-10
MouseIsOveRControl(ControlClass){
	MouseGetPos,,,,thisControl
	IfEqual,thisControl,%Controlclass%
		return true
}
#If