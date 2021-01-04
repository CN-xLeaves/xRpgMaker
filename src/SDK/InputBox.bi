Dim Shared As ZString Ptr WinStr,WinTil,TxtStr
Dim Shared As ZString * 256 InputBox_RetStr

Function InputProc(ByVal hWin As HWND, ByVal uMsg As UINT, ByVal wParam As WPARAM, ByVal lParam As LPARAM) As Integer
	Dim As Long id, Event
	Select Case uMsg
		Case WM_INITDIALOG
			SetWindowText(hWin,WinTil)
			SetWindowText(GetDlgItem(hWin,30001), WinStr)
			SetWindowText(GetDlgItem(hWin,30004), TxtStr)
			SetFocus(GetDlgItem(hWin,30004))
			SetForegroundWindow(hWin)
		Case WM_COMMAND
			id=LoWord(wParam)
			Event=HiWord(wParam)
			If Event=BN_CLICKED Then
				Select Case id
					Case 30002
						GetWindowText(GetDlgItem(hWin, 30004), @InputBox_RetStr, 256)
						EndDialog(hWin, 1)
					Case 30003
						EndDialog(hWin, 0)
				End Select
			EndIf
		Case WM_CLOSE
			EndDialog(hWin, 0)
		Case Else
			Return FALSE
	End Select
	Return TRUE
End Function

Function InputBox(ParHWND As HWND, MsgStr As ZString Ptr, Title As ZString Ptr, Default As ZString Ptr) As Integer
	WinStr = MsgStr
	WinTil = Title
	TxtStr = Default
	InputBox_RetStr = ""
	Return DialogBoxParam(GetModuleHandle(NULL), Cast(ZString Ptr, 30000), ParHWND, @InputProc, 0)
End Function
