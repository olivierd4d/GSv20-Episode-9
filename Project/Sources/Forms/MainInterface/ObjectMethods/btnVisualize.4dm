Case of 
	: (FORM Event:C1606.code=On Clicked:K2:4)
		
		var $bModeFormat : Text
		
		$refMenu:=Create menu:C408
		
		APPEND MENU ITEM:C411($refMenu; "Visualisation")
		SET MENU ITEM ICON:C984($refMenu; -1; "Path:/RESOURCES/Images/Buttons/eye-icon-24x24.png")
		SET MENU ITEM PARAMETER:C1004($refMenu; -1; "--view")
		
		
		APPEND MENU ITEM:C411($refMenu; "Modification")
		SET MENU ITEM ICON:C984($refMenu; -1; "Path:/RESOURCES/Images/Buttons/edit-icon-24x24.png")
		SET MENU ITEM PARAMETER:C1004($refMenu; -1; "--edit")
		If (Form:C1466.mode="--edit")
			SET MENU ITEM MARK:C208($refMenu; -1; Char:C90(18))
		End if 
		
		If (Form:C1466.mode="--none") | (Form:C1466.companies.length=0)
			DISABLE MENU ITEM:C150($refMenu; -1)
		End if 
		
		$choice:=Dynamic pop up menu:C1006($refMenu)
		RELEASE MENU:C978($refMenu)
		
		If ($choice#"")
			$chaine:=OBJECT Get format:C894(*; "btnVisualize")
			Form:C1466.mode:=$choice
			draw_modeButton()
		End if 
End case 