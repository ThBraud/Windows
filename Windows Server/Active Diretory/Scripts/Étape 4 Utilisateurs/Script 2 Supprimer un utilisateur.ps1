# Définition des variables
$UserSamAccountName = "hzidane"

# Vérifier si l'utilisateur existe
$ExistingUser = Get-ADUser -Filter {SamAccountName -eq $UserSamAccountName} -ErrorAction SilentlyContinue

if ($ExistingUser) {
    # Supprimer l'utilisateur
    Remove-ADUser -Identity $UserSamAccountName -Confirm:$false
    Write-Output "L'utilisateur '$UserSamAccountName' a été supprimé avec succès."
} else {
    Write-Output "L'utilisateur '$UserSamAccountName' n'existe pas."
}
