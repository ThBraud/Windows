# Nom Utilisateur
"Bienvenue"
$env:username   # Donne le nom d’utilisateur
Pause

# Nom de la machine
"Nom de la machine"
Hostname   # Donne le nom de l’Ordinateur
Pause

# Date et Heure
"Voici la date et l'heure"
Get-Date   # Donne la date et l’heure
Pause

# Dernier démarrage de Windows
"Temps depuis le dernier démarrage Windows"
(get-date) – (gcim Win32_OperatingSystem).LastBootUpTime | Format-Table
# Donne le temps depuis le dernier démarrage de Windows
Pause

# Espace disque dur
"Espace du disque dur"
Get-Volume -DriveLetter C | Format-Table
# Donne l’espace utilisé et disponible sur le disque C
Pause