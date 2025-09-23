##Étape 1 : Vérifier si l'adresse IP est déjà attribuée. N'oublie pas de changer le numéro de InterfaceIndex si besoin !
$existingIP = Get-NetIPAddress -InterfaceIndex 4 -AddressFamily IPv4 | Where-Object { $_.IPAddress -eq "192.168.56.21" }
if (-not $existingIP) {
    Write-Host "Ajout de l'adresse IP 192.168.56.21 à l'interface 3."
    New-NetIPAddress -InterfaceIndex 4 -IPAddress 192.168.56.21 -PrefixLength 24
} else {
    Write-Host "L'adresse IP 192.168.56.21 est déjà attribuée."
}

##Étape 2 : Vérifier si l'adresse DNS est déjà configurée. N'oublie pas de changer le numéro de InterfaceIndex si besoin !
$dnsServers = Get-DnsClientServerAddress -InterfaceIndex 4 | Select-Object -ExpandProperty ServerAddresses

if ($dnsServers -notcontains "192.168.56.21") {
    Write-Host "Configuration du serveur DNS 192.168.56.21..."
    Set-DnsClientServerAddress -InterfaceIndex 4 -ServerAddresses 192.168.56.21
} else {
    Write-Host "Le serveur DNS 192.168.56.21 est déjà configuré."
}
# #Étape 3 : Vérifier la configuration DNS. N'oublie pas de changer le numéro de InterfaceIndex si besoin !
Write-Host "Configuration DNS actuelle :"
Get-DnsClientServerAddress -InterfaceIndex 4
