# IME-Check-for-AutoHotkey
AutoHotkey(V2) script which detects IME status of current window (for Korean)
현재 창의 IME 상태를 인식하는 AutoHotKey 스크립트.
***

#### Refer to / 참고
1. <https://github.com/johngrib/simple_vim_guide/blob/master/md/with_korean.md>
2. <https://soooprmx.com/autohotkey-%ED%95%9C%EC%98%81-%EC%83%81%ED%83%9C-%EA%B0%90%EC%A7%80%ED%95%98%EA%B8%B0/>

#### How to Use
1. Download and install [AutoHotkey](https://www.autohotkey.com/)
2. Run script directly using AutoHotkey. Or you can compile the script and make your own executables using the compiler which comes with the AutoHotkey program itself.
3. If you want, you can register that executable in the startup folder.
#### 사용법
1. [AutoHotkey](https://www.autohotkey.com/)를 다운로드하고 설치한다.
2. AutoHotKey를 이용해서 스크립트를 직접 실행시키거나 AutoHotKey와 같이 설치되는 컴파일러를 이용해 executable을 만든다.
3. (선택) 시작 프로그램에 executable을 등록한다.

#### Possible applications?
1. Editors which use English alphabets as commands (like Vim)

#### example script explanation
1. Load windows imm api as dll.
2. Using ImmGetDefaultIMEWnd, get the handle of IME window of current active window.
3. Send WM_IME_CONTROL(0x0283) message to the handle to get currrent imc conversion mode(IMC_GETCONVERSIONMODE, 0x0001) and receive the return value.
4. imc conversion mode 0 means "alphanumeric".
5. If the imc conversion mode is not 0, map \<ESC\> keystroke to <한/영> -> \<ESC\>.
6. Unload windows imm api when the script is terminated.
#### 예제 설명
1. windwos imm api를 로드한다.
2. ImmGetDefaultIMEWnd api를 이용하여 현재 윈도우의 IME 윈도우 핸들을 가져온다.
3. 가져온 IME 윈도우 핸들을 이용하여 WM_IME_CONTROL 메세지를 IMC_GETCONVERSIONMODE 인자를 줘서 보내고, 리턴값을 받는다.
4. imc conversion mode 0는 "alphanumeric"을 의미한다.
5. imc conversion mode가 0이 아니면 \<ESC\> 입력을 \<한/영\> -> \<ESC\>로 매핑한다.
6. 스크립트가 끝날 때 windows imm api를 언로드한다.

