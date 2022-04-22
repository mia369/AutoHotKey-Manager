Process,priority, , high
#NoTrayIcon
#Persistent
#SingleInstance,Force
#NoEnv
;==================================================
;** 调整窗口透明度 win+{+} 增加 win+{-} 减少
;==================================================
#=:: ;窗口透明化增加或者减弱
    WinGet, ow, id, A
    WinTransplus(ow)
    return

#-:: ;窗口透明化增加或者减弱
    WinGet, ow, id, A
    WinTransMinus(ow)
    return
WinTransplus(w){
 
    WinGet, transparent, Transparent, ahk_id %w%
    if transparent < 255
        transparent := transparent+10
    else
        transparent =
    if transparent
        WinSet, Transparent, %transparent%, ahk_id %w%
    else
        WinSet, Transparent, off, ahk_id %w%
    return
}
WinTransMinus(w){
 
    WinGet, transparent, Transparent, ahk_id %w%
    if transparent
        transparent := transparent-10
    else
        transparent := 240
    WinSet, Transparent, %transparent%, ahk_id %w%
    return
}