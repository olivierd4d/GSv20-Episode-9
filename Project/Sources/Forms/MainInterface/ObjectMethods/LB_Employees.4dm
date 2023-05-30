Case of 
	: (FORM Event:C1606.code=On Double Clicked:K2:5)
		If (Form:C1466.currentEmployee#Null:C1517)
			$ref:=Open form window:C675("displayEmployeeDetails"; Plain form window:K39:10)
			DIALOG:C40("displayEmployeeDetails"; New object:C1471("employee"; Form:C1466.currentEmployee))
			CLOSE WINDOW:C154($ref)
		End if 
End case 
