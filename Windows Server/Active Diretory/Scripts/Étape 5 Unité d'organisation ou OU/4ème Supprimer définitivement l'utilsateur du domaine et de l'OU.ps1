# Définir le nom de l'utilisateur et l'OU
$UserName = "VVitrou"  
$OUPath = "OU=B1,DC=remoteworks,DC=local"  

# Vérifier si l'utilisateur existe dans l'OU
$User = Get-ADUser -Filter {SamAccountName -eq $UserName} -SearchBase $OUPath -ErrorAction SilentlyContinue

if ($User) {
    # Supprimer l'utilisateur
    Write-Host "L'utilisateur '$UserName' existe. Suppression de l'utilisateur..."
    Remove-ADUser -Identity $User -Confirm:$false
} else {
    Write-Host "L'utilisateur '$UserName' n'existe pas dans l'OU '$OUPath'."
}