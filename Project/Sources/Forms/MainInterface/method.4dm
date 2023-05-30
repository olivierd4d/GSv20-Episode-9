Case of 
	: (FORM Event:C1606.code=On Load:K2:1)
		Form:C1466.companies:=ds:C1482.Company.all().orderBy("name")
		Form:C1466.mode:="--none"
		draw_modeButton()
		
	: (FORM Event:C1606.code=On Unload:K2:2)
		
End case 

OBJECT SET ENABLED:C1123(*; "btnDeleteCompany"; Form:C1466.currentCompany#Null:C1517)
If (Form:C1466.currentCompany#Null:C1517)
	OBJECT SET HELP TIP:C1181(*; "btnDeleteCompany"; "Supprimer la société \""+Form:C1466.currentCompany.name+"\"")
Else 
	OBJECT SET HELP TIP:C1181(*; "btnDeleteCompany"; "Supprimer la société sélectionnée")
End if 

$labelsToSurvey:=Split string:C1554("Lname;Ldomain;Lcomment;LlegalStructure"; ";")
If (Form:C1466.currentCompany#Null:C1517)
	$touched:=Form:C1466.currentCompany.touchedAttributes()
Else 
	$touched:=New collection:C1472()
End if 
For each ($label; $labelsToSurvey)
	$color:="grey"
	If (Form:C1466.mode="--edit") && ($touched.indexOf(Substring:C12($label; 2))#-1)
		$color:="blue"
	End if 
	OBJECT SET RGB COLORS:C628(*; $label; $color; Background color none:K23:10)
End for each 
