##Ajout de l'AD comme controleur de domaine 
if (-not (Get-ADDomainController -Filter {Domain -eq "remoteworks.local"})) {
    Import-Module ADDSDeployment
    Install-ADDSDomainController `
        -NoGlobalCatalog:$true `
        -CreateDnsDelegation:$false `
        -Credential (Get-Credential) `
        -CriticalReplicationOnly:$false `
        -DatabasePath "C:\Windows\NTDS" `
        -DomainName "remoteworks.local" `
        -InstallDns:$true `
        -LogPath "C:\Windows\NTDS" `
        -NoRebootOnCompletion:$false `
        -SiteName "Default-First-Site-Name" `
        -SysvolPath "C:\Windows\SYSVOL" `
        -Force:$true

    Write-Host "Le contrôleur de domaine pour 'remoteworks.local' a été installé avec succès."
} else {
    Write-Host "Le contrôleur de domaine pour 'remoteworks.local' existe déjà."
}
