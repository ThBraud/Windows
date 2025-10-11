## Voir les règles 
Get-NetFirewallRule
## Filtrer par nom 
Get-NetFirewallRule -DisplayName "*RDP*"
## Créer une règle 
New-NetFirewallRule -DisplayName "Ouvrir port 8080" -Direction Inbound -Protocol TCP -LocalPort 8080 -Action Allow
## Bloquer un programme
New-NetFirewallRule -DisplayName "Bloquer Chrome" -Direction Outbound -Program "C:\Program Files\Google\Chrome\Application\chrome.exe" -Action Block
## Activer désactiver une règle
Set-NetFirewallRule -DisplayName "Nom de la règle" -Enabled False
## Remettre a zéro le pare-feu 
netsh advfirewall reset
## Exporter la configuration actuelle, on la restaure avec "import". 
netsh advfirewall export "C:\sauvegarde_parefeu.wfw"
