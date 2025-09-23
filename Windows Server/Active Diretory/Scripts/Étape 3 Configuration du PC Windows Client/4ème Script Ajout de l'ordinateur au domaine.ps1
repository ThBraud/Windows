$domain = "remoteworks.local"
$domainExists = (Get-WmiObject -Class Win32_ComputerSystem).Domain

# Vérifiez si l'ordinateur est déjà membre du domaine
if ($domainExists -ne $domain) {
    Add-Computer -DomainName $domain -Credential Administrateur
} else {
    Write-Host "L'ordinateur est déjà membre du domaine $domain."
}
