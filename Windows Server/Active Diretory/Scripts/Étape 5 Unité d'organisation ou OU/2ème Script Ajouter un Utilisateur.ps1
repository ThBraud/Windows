# Définition des variables
$UserSamAccountName = "Albert"
$OUPath = "OU=B1,DC=remoteworks,DC=local"  

# Vérifier si l'utilisateur existe
$User = Get-ADUser -Filter {SamAccountName -eq $UserSamAccountName} -ErrorAction SilentlyContinue

if ($User) {
    # Vérifier si l'utilisateur est déjà dans la bonne OU
    if ($User.DistinguishedName -match $OUPath) {
        Write-Output "L'utilisateur '$UserSamAccountName' est déjà dans l'OU spécifiée."
    } else {
        # Déplacer l'utilisateur dans l'OU cible
        Move-ADObject -Identity $User.DistinguishedName -TargetPath $OUPath
        Write-Output "L'utilisateur '$UserSamAccountName' a été déplacé dans l'OU '$OUPath'."
    }
} else {
    Write-Output "L'utilisateur '$UserSamAccountName' n'existe pas. Vérifiez le nom d'utilisateur."
}
