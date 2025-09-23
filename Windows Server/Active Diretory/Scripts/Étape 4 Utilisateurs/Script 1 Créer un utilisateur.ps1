# Définition des variables
$UserSamAccountName = "hzidane"
$UserUPN = "hzidane@remoteworks.local"
$UserGivenName = "Henri"
$UserSurname = "Zidane"
$UserDisplayName = "$UserGivenName $UserSurname"
$UserPassword = "MotDePasse123!"

# Vérifier si l'utilisateur existe déjà
$ExistingUser = Get-ADUser -Filter {SamAccountName -eq $UserSamAccountName} -ErrorAction SilentlyContinue

if ($ExistingUser) {
    Write-Output "L'utilisateur '$UserSamAccountName' existe déjà."
} else {
    Write-Output "Création de l'utilisateur '$UserSamAccountName'..."

    New-ADUser -Name $UserDisplayName `
               -GivenName $UserGivenName `
               -Surname $UserSurname `
               -SamAccountName $UserSamAccountName `
               -UserPrincipalName $UserUPN `
               -AccountPassword (ConvertTo-SecureString $UserPassword -AsPlainText -Force) `
               -Enabled $true `
               -ChangePasswordAtLogon $true

    Write-Output "L'utilisateur '$UserSamAccountName' a été créé avec succès."
}
