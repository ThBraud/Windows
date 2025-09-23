# Définir la variable pour le nom de l'utilisateur
$userName = "Albert"

if (Get-AdGroupMember -Identity WindowsServer | Where-Object {$_.SamAccountName -eq $userName}) {
    Remove-AdGroupMember -Identity WindowsServer -Members $userName -Confirm:$false
    Write-Host "L'utilisateur '$userName' a été supprimé du groupe WindowsServer."
} else {
    Write-Host "L'utilisateur '$userName' n'est pas membre du groupe WindowsServer."
}
