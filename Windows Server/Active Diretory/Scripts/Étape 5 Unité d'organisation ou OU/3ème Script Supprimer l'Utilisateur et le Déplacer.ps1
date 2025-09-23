# Définir le nom de l'utilisateur, l'OU actuelle et le conteneur "Users"
$UserName = "Albert"  
$OUPath = "OU=B1,DC=remoteworks,DC=local"  
$DefaultContainer = "CN=Users,DC=remoteworks,DC=local"  # Conteneur par défaut

# Vérifier si l'utilisateur existe dans l'OU
$User = Get-ADUser -Filter {SamAccountName -eq $UserName} -SearchBase $OUPath -ErrorAction SilentlyContinue

if ($User) {
    Write-Host "L'utilisateur '$UserName' existe dans l'OU '$OUPath'. Déplacement vers '$DefaultContainer'..."

    # Déplacer l'utilisateur vers le conteneur "Users"
    Move-ADObject -Identity $User.DistinguishedName -TargetPath $DefaultContainer

    Write-Host "L'utilisateur '$UserName' a été déplacé avec succès vers '$DefaultContainer'."
} else {
    Write-Host "L'utilisateur '$UserName' n'existe pas dans l'OU '$OUPath'."
}
