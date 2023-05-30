//%attributes = {}
TRACE:C157
CONFIRM:C162("Vous allez importer de nouveaux employées dans la base. \rCette opération est irréversible. \rVoulez-vous continuer ? "; "Importer"; "Annuler")
If (OK=1)
	$fileName:=Select document:C905(""; ".txt"; "Import employees"; 0)
	If (OK=1)
		$file:=File:C1566(document; fk platform path:K87:2)
		$content:=$file.getText()
		If ($content#"")
			$lines:=Split string:C1554($content; Char:C90(Line feed:K15:40); ck ignore null or empty:K85:5+sk trim spaces:K86:2)
			$continue:=True:C214
			For each ($line; $lines) While ($continue)
				$columns:=Split string:C1554($line; Char:C90(Tab:K15:37); sk trim spaces:K86:2)
				$employee:=ds:C1482.Employee.new()
				$employee.firstName:=String:C10($columns[0])
				$employee.lastName:=String:C10($columns[1])
				$employee.civility:=String:C10($columns[2])
				$employee.birthDate:=Date:C102($columns[3])
				
				$companies:=ds:C1482.Company.query("name = :1"; String:C10($columns[4]))
				If ($companies.length>0)
					$employee.UUID_Company:=$companies.first().getKey()
				Else 
					$employee.UUID_Company:=Null:C1517
				End if 
				
				$info:=$employee.save()
				If (Not:C34($info.success))
					ALERT:C41("An error has occured")
					$continue:=False:C215
				End if 
				
			End for each 
			If ($continue)
				ALERT:C41("L'import s'est déroulé avec succès ! \r\r"+String:C10($lines.length)+" nouveaux employés ont été importés")
			End if 
		End if 
	End if 
End if 