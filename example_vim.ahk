imm32 := DllCall("LoadLibrary", "Str", "imm32.dll", "Ptr")

#HotIf WinActive("ahk_exe Code.exe") || WinActive("ahk_exe Obsidian.exe") || WinActive("ahk_exe devenv.exe") || WinActive("ahk_exe OpenConsole.exe") || WinActive("ahk_exe WindowsTerminal.exe")
; Code.exe = Visual Studio Code
; Obsidian.exe = Obsidian (vim editor key setting)
; devenv.exe = Visual Studio 2022
; cmd.exe = command prompt
; WindowsTerminal.exe = Windows Powershell
$Esc::
{
    if(IMECheckHangul()){
        Send "{VK15}"    ; 한글 -> esc 입력시 한영전환 버튼 추가 입력
	}
    Send "{Escape}"
    return
}

$^[::
{
	if(IMECheckHangul()){
		Send "{VK15}"
	}
	Send "^["
	return
}

$\::
{
	if(IMECheckHangul()){
		Send "{VK15}"
	}
	Send "\"
	return
}

$+'::
{
	if(IMECheckHangul()){
		Send "{VK15}"
	}
	Send "+'"
	return
}

; arrowkeys -> Alt + j k l ;
!h::
{
	Send "{Left}"
	Return
}
!j::
{
	Send "{Down}"
	Return
}
!k::
{
	Send "{Up}"
	Return
}
!l::
{
	Send "{Right}"
	Return
}
#HotIf

; left ctrl <-> capslock
CapsLock::LControl
LControl::CapsLock

; PRTSC <-> DEL
PrintScreen::Delete
Delete::PrintScreen

; mouse back -> pgdown
; mouse forward -> pgup
; when bluestack is on
#HotIf WinActive("ahk_exe HD-Player.exe") || WinActive("ahk_exe MuMuPlayer.exe")
XButton1::PgDn
XButton2::PgUp

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
