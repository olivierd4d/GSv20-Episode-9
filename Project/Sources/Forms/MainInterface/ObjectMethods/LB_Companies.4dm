Case of 
	: (FORM Event:C1606.code=On Clicked:K2:4)
		If (Form:C1466.currentCompany=Null:C1517)
			Form:C1466.mode:="--none"
		Else 
			Form:C1466.mode:="--view"
		End if 
		draw_modeButton
End case 