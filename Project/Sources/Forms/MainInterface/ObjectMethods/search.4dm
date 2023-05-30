Case of 
	: (FORM Event:C1606.code=On Data Change:K2:15)
		If (Form:C1466.search#"")
			Case of 
				: (Form:C1466.search="\"@\"")
					$search:=Substring:C12(Form:C1466.search; 2; Length:C16(Form:C1466.search)-2)
				: (Position:C15("@"; Form:C1466.search)>0)
					$search:=Form:C1466.search
				Else 
					$search:=Form:C1466.search+"@"
			End case 
			Form:C1466.companies:=ds:C1482.Company.query("name = :1 or domain = :1 order by name"; $search)
		Else 
			Form:C1466.companies:=ds:C1482.Company.all().orderBy("name")
		End if 
End case 

draw_modeButton