Case of 
	: (FORM Event:C1606.code=On Clicked:K2:4)
		$name:=Request:C163("Entrer le nom de la nouvelle société"; "Société")
		$name:=tool_trimSpaces($name)
		If (OK=1) & ($name#"")
			$company:=ds:C1482.Company.new()
			$company.name:=$name
			$info:=$company.save()
			
			If (Not:C34($info.success))
				ALERT:C41("Un problème est survenu")
			Else 
				Form:C1466.companies:=Form:C1466.companies.copy()
				Form:C1466.companies.add($company)
				$position:=$company.indexOf(Form:C1466.companies)
				LISTBOX SELECT ROW:C912(*; "LB_Companies"; $position+1; lk replace selection:K53:1)
				OBJECT SET SCROLL POSITION:C906(*; "LB_Companies"; $position+1; *)
			End if 
		End if 
End case 

