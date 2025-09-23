$shareName = "Windows"
$sharePath = "C:\Partage"

# Vérifier si le partage existe
$existingShare = Get-SmbShare -Name $shareName -ErrorAction SilentlyContinue

if ($existingShare -ne $null) {
    # Supprimer le partage
    Remove-SmbShare -Name $shareName -Force
    Write-Host "Le partage '$shareName' a été supprimé avec succès."
} else {
    Write-Host "Le partage '$shareName' n'existe pas."
}

# Vérifier si le dossier existe et le supprimer
if (Test-Path $sharePath) {
    Remove-Item -Path $sharePath -Recurse -Force
    Write-Host "Le dossier '$sharePath' a été supprimé."
} else {
    Write-Host "Le dossier '$sharePath' n'existe pas."
}