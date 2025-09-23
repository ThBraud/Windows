$shareName = "Windows"
$sharePath = "C:\Partage"
 
# Vérifier si le dossier existe, sinon le créer
if (-Not (Test-Path $sharePath)) {
    New-Item -ItemType Directory -Path $sharePath -Force | Out-Null
    Write-Host "Le dossier '$sharePath' a été créé."
}
 
# Vérifier si le partage existe déjà
$existingShare = Get-SmbShare -Name $shareName -ErrorAction SilentlyContinue
 
if ($existingShare -eq $null) {
    # Créer le partage s'il n'existe pas
    New-SmbShare -Name $shareName -Path $sharePath -FullAccess "Tout le monde"
    Write-Host "Le partage '$shareName' a été créé avec succès."
} else {
    Write-Host "Le partage '$shareName' existe déjà."
}
