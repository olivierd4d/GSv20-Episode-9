Case of 
	: (FORM Event:C1606.code=On Clicked:K2:4)
		CONFIRM:C162("Voulez vous vraiment supprimer la société nommée \""+Form:C1466.currentCompany.name+"\""; "Supprimer"; "Conserver")
		If (OK=1)
			Form:C1466.companies:=Form:C1466.companies.minus(Form:C1466.currentCompany)
			$info:=Form:C1466.currentCompany.drop()
			If (Not:C34($info.success))
				ALERT:C41("Un problème est survenu")
			End if 
		End if 
End case 