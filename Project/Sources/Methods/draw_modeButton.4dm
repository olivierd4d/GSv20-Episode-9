//%attributes = {}

$visible:=True:C214
Case of 
	: (Form:C1466.mode="--view")
		$bModeFormat:="Visualization;path:/RESOURCES/Images/Buttons/eye-24x24.png;;3;1;1;4;0;0;0;1;0;4"
		
	: (Form:C1466.mode="--edit")
		$bModeFormat:="Modification;path:/RESOURCES/Images/Buttons/edit-24x24.png;;3;1;1;4;0;0;0;1;0;4"
	Else 
		$bModeFormat:=""
		$visible:=False:C215
End case 
OBJECT SET FORMAT:C236(*; "btnVisualize"; $bModeFormat)
OBJECT SET VISIBLE:C603(*; "btnVisualize"; $visible)

OBJECT SET VISIBLE:C603(*; "btnCancel"; Form:C1466.mode="--edit")
OBJECT SET VISIBLE:C603(*; "btnAccept"; Form:C1466.mode="--edit")
OBJECT SET ENTERABLE:C238(*; "Fname"; Form:C1466.mode="--edit")
OBJECT SET ENTERABLE:C238(*; "Fdomain"; Form:C1466.mode="--edit")
OBJECT SET ENTERABLE:C238(*; "Fcomment"; Form:C1466.mode="--edit")