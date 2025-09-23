$GroupName = "WindowsServer"

if (-not (Get-ADGroup -Filter {Name -eq $GroupName})) {
    New-ADGroup -Name $GroupName -Path "OU=B1,DC=REMOTEWORKS,DC=LOCAL" -GroupScope Global
    Write-Host "Le groupe '$GroupName' a été créé avec succès."
} else {
    Write-Host "Le groupe '$GroupName' existe déjà."
}