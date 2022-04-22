# Ahk Script Manager Of HuTao

### 安装使用介绍

- 1 下载AutoHotkey软件
  
  版本需要大于1.1.33.08+, 下载地址:
  
  https://www.autohotkey.com/
- 2 运行 AHK Script Manager.ahk  
- 3 (推荐)放入开机自启动:  
  - ①右键 AHK Script Manager.ahk → 发送到桌面快捷方式  
  - ②复制桌面快捷方式  
  - ③粘贴到 C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp\   即可

### 功能介绍

- !ScriptTemplate 
  
  一个脚本模板, 默认不加载

- !放大镜
  
  放大镜功能, 默认不加载

- !实时显示键盘
  
  实时显示键盘按键情况,默认不加载

- !重复执行
  
  重复执行的一个代码模板,默认不加载

- 窗口快速置顶
  
  快速置顶窗口,快捷键: {win+~} 快捷键开启窗口置顶,再次使用关闭, 开启和关闭有提示音

- 调整窗口透明度
  
  调整当前窗口的透明度, 快捷键: win+加号或减号

- 调整亮度
  
  调整计算机屏幕亮度, 快捷键: win+[ 或者 win+]

- 调整音量
  
  调整计算机音量大小, 快捷键: win+> 或者 win+<
  
  也可也在任务栏直接滚动鼠标滚轮来调整

- 连续复制
  
  快捷键ctrl+shift+c开启, 开启后通过shift+c进行复制

- 小工具
  
  - 复制文件全路径 
    
    快捷键: ctrl+win+c
  
  - 摁住win键直接拖拽窗口
    
    快捷键: win+鼠标左键拖动

- 虚拟桌面快捷键
  
  对windows自带的虚拟桌面快捷键做了重新映射,映射之后的快捷键如下
  
  - 下一个桌面
    
    快捷键: win+➡
  
  - 上一个桌面
    
    快捷键: win+⬅
  
  - 开启桌面
    
    快捷键: win+⬆
  
  - 关闭桌面
    
    快捷键: win+⬇

- 自定义热字串
  
  可以添加一些常用的字符串, 然后设置缩写,例如
  
  输入: !date  会自动替换成当前时间
  
  输入: @g 会自动替换成我的gmail邮箱
  
  具体可以直接修改源文件的形式自己添加新的热串, 关于热字串的语法详见
  
  https://www.autohotkey.com/docs/Hotstrings.htm

### AHK管理软件使用

- 文件名前缀有 "!" , 则需要手动启动
- 文件名前缀无 "!" , 则随AHK管理软件的自动而启动

### AHK语言介绍

- 注释符号 ";"

- #NoTrayIcon  ;不显示托盘图标

- 基本按键
  
  ```
  ; ! →  [Alt]        ; ! 想象成 Alt   的 l  
  ; # →  [win]        ; # 想           windows开始图案  
  ; ^ →  [Ctrl]       ; ^ 想象成 Ctrl  的 倒C  
  ; + →  [Shift]      ; + 想象成 Shift 的 f拉长  
  ```

- 最基础的代码①:  按下Ctrl+1, 则会模拟输入123+回车
  
  ```
  ^1::
  {
  Send, {123}
  Send, {Enter}
  Return
  }
  ```

- 最基础的代码②: 连续输入nnow, 即可打印当前时间
  
  ```
  :?:nnow::
  
  ;？号表示在单词中也会替换，e.g. Vnnow → V2019.....
  FormatTime, CurrentDateTime,, yyy/MM/dd HH:mm
  Send %CurrentDateTime%
  return
  ```

- 最基础的代码③:  换掉鼠标45键 --> PgUp和PgDn (更近一步可以做到纯鼠标的复制和黏贴: 详见 **scripts/!pro-鼠标宏.ahk**)
  
  ```
  #NoTrayIcon  ;不显示托盘图标
  XButton1::
  {
      Send {PgDn}
      Return
  }
  
  XButton2::
  {
      Send {PgUp}
      Return
  }
  ```

- 进阶代码①:  复制文件(文件夹)绝对路径, 并把 `\` 替换为 `\\`
  
  ```
  #NoTrayIcon  ;不显示托盘图标
  Explorer_GetSelection(hwnd="")   ;函数
  {  
      WinGet, process, processName, % "ahk_id" hwnd := hwnd? hwnd:WinExist("A")  
      WinGetClass class, ahk_id %hwnd%  
      if (process != "explorer.exe")  
          return  
      if (class ~= "Progman|WorkerW") {  
              ControlGet, files, List, Selected Col1, SysListView321, ahk_class %class%  
              Loop, Parse, files, `n, `r  
                  ToReturn .= A_Desktop "\" A_LoopField "`n"  
          } else if (class ~= "(Cabinet|Explore)WClass") {  
              for window in ComObjCreate("Shell.Application").Windows 
              {
                  try{
                  if (window.hwnd==hwnd)  
                      sel := window.Document.SelectedItems  
                  }catch e {
                      continue
                  }
              }
              for item in sel  
                  ToReturn .= item.path "`n"  
          }  
      return Trim(ToReturn,"`n")  
  } 
  ```
  
  ;[Win] + Z ;一键拷贝文件路径 ;
  #Z::
  clipboard := % Explorer_GetSelection(hwnd) ;调用了 函数
  clipboard := RegExReplace(clipboard, "\\","\\")    ;匹配 [\] 替换为 [\\]号     
  Tooltip,%clipboard%    ;在鼠标右侧显示【拷贝的文件路径】
  Sleep,800
  Tooltip,
  return
