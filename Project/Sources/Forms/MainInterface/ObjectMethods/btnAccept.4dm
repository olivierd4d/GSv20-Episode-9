Case of 
	: (FORM Event:C1606.code=On Clicked:K2:4)
		
		If (Form:C1466.currentCompany.touched())
			Form:C1466.currentCompany.save()
		End if 
End case 


