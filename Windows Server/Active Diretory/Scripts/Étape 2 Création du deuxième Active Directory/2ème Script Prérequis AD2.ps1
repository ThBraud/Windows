##Étape 1 : Vérifier si l'adresse IP est déjà attribuée. N'oublie pas de changer le numéro de InterfaceIndex si besoin !
$existingIP = Get-NetIPAddress -InterfaceIndex 15 -AddressFamily IPv4 | Where-Object { $_.IPAddress -eq "192.168.56.22" }
if (-not $existingIP) {
    Write-Host "Ajout de l'adresse IP 192.168.56.22 à l'interface 15."
    New-NetIPAddress -InterfaceIndex 15 -IPAddress 192.168.56.22 -PrefixLength 24
} else {
    Write-Host "L'adresse IP 192.168.56.22 est déjà attribuée."
}

##Étape 2 : Vérifier si l'adresse DNS est déjà configurée. N'oublie pas de changer le numéro de InterfaceIndex si besoin !
$dnsServers = Get-DnsClientServerAddress -InterfaceIndex 15 | Select-Object -ExpandProperty ServerAddresses

if ($dnsServers -notcontains "192.168.56.21") {
    Write-Host "Configuration du serveur DNS 192.168.56.21..."
    Set-DnsClientServerAddress -InterfaceIndex 15 -ServerAddresses 192.168.56.21
} else {
    Write-Host "Le serveur DNS 192.168.56.21 est déjà configuré."
}
# #Étape 3 : Vérifier la configuration DNS. N'oublie pas de changer le numéro de InterfaceIndex si besoin !
Write-Host "Configuration DNS actuelle :"
Get-DnsClientServerAddress -InterfaceIndex 15
