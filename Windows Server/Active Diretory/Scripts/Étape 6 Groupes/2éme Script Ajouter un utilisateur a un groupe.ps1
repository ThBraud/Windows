# Définir la variable pour le nom de l'utilisateur
$userName = "Albert"

if (-not (Get-AdGroupMember -Identity WindowsServer| Where-Object {$_.SamAccountName -eq $userName})) {
    Add-AdGroupMember -Identity Linux -Members $userName
    Write-Host "L'utilisateur '$userName' a été ajouté au groupe WindowsServer."
} else {
    Write-Host "L'utilisateur '$userName' est déjà membre du groupe WindowsServer."
}
