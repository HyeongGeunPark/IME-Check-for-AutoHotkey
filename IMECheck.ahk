imm32 := DllCall("LoadLibrary", "Str", "imm32.dll", "Ptr")

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
