imm32 := DllCall("LoadLibrary", "Str", "imm32.dll", "Ptr")

#HotIf WinActive("ahk_exe Code.exe") || WinActive("ahk_exe Obsidian.exe")
$Esc::
{
    if(IMECheckHangul()){
        Send "{VK15}"    ; 한글 -> esc 입력시 한영전환 버튼 추가 입력
	}
    Send "{Escape}"
    return
}
#HotIf


IMECheckHangul()  ; 0: 영어, 1: 한글
{
  hWnd := WinGetID("A")   
  hIME := DllCall("imm32\ImmGetDefaultIMEWnd", "UInt", hWnd, "UInt")
  temp := A_DetectHiddenWindows
  DetectHiddenWindows(true)
  res := SendMessage(0x0283, 0x0001, 0x0000, , "ahk_id " hIME)
  DetectHiddenWindows(temp)
  return res
}

ExitFunc(ExitReason, ExitCode)
{
  DllCall("FreeLibrary", "Ptr", imm32)
}

OnExit ExitFunc
