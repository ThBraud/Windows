##Etape 1 
$existingIP = Get-NetIPAddress -InterfaceIndex 10 -AddressFamily IPv4 | Where-Object { $_.IPAddress -eq "192.168.56.20" }

if (-not $existingIP) {
    Write-Host "Ajout de l'adresse IP 192.168.56.20 à l'interface 10."
    New-NetIPAddress -InterfaceIndex 10 -IPAddress 192.168.56.20 -PrefixLength 24
} else {
    Write-Host "L'adresse IP 192.168.56.20 est déjà attribuée."
}

##Etape 2 : Mise en place du dns, rappel le dns est l'addrese de l'AD1

$dnsServers = Get-DnsClientServerAddress -InterfaceIndex 10 | Select-Object -ExpandProperty ServerAddresses

if ($dnsServers -notcontains "192.168.56.21") {
    Write-Host "Configuration du serveur DNS 192.168.56.21..."
    Set-DnsClientServerAddress -InterfaceIndex 10 -ServerAddresses 192.168.56.21
} else {
    Write-Host "Le serveur DNS 192.168.56.21 est déjà configuré."
}

# #Étape 3 : Vérifier la configuration DNS
Write-Host "Configuration DNS actuelle :"
Get-DnsClientServerAddress -InterfaceIndex 10