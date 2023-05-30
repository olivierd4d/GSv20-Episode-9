//%attributes = {}
#DECLARE($string : Text)->$trimedString : Text

$trimedString:=Split string:C1554($string; " "; ck ignore null or empty:K85:5).join(" ")