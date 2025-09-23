# Demande du nom de l'OU à l'utilisateur
$NomOU = Read-Host "Entrez le nom de l'OU"
$Domaine = (Get-ADDomain).DistinguishedName  # Récupère le domaine automatiquement

# Vérifie si l'OU existe déjà
if (Get-ADOrganizationalUnit -Filter "Name -eq '$NomOU'" -ErrorAction SilentlyContinue) {
    Write-Host "L'OU '$NomOU' existe déjà dans le domaine." -ForegroundColor Yellow
} else {
    # Création de l'OU
    New-ADOrganizationalUnit -Name $NomOU -Path $Domaine -ProtectedFromAccidentalDeletion $true
    Write-Host "L'OU '$NomOU' a été créée avec succès !" -ForegroundColor Green
    }
