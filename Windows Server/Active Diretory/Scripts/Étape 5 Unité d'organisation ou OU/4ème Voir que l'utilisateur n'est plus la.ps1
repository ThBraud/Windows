$UserName = "VVitrou"
# Tenter de récupérer l'utilisateur
$User = Get-ADUser -Filter {SamAccountName -eq $UserName} -ErrorAction SilentlyContinue
	if ($User) {
		    Write-Host "L'utilisateur '$UserName' existe."
		} else {
		    Write-Host "L'utilisateur '$UserName' n'existe pas."
}