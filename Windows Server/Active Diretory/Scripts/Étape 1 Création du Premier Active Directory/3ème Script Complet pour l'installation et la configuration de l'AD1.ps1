$FeatureList = @("AD-Domain-Services", "DNS")

Foreach($Feature in $FeatureList){
   $FeatureState = (Get-WindowsFeature -Name $Feature).InstallState

   if($FeatureState -eq "Available"){
      # Si la fonctionnalité est disponible mais pas installée, on tente de l'installer
     Write-Output "La fonctionnalité $Feature va être installée. "

     Try{
        Add-WindowsFeature -Name $Feature -IncludeManagementTools -IncludeAllSubFeature
        Write-Output "Installation réussie "
     } Catch{
        Write-Output "Erreur lors de l'installation. "
     }
   } 
   elseif($FeatureState -eq "Installed"){
      # Si la fonctionnalité est déjà installée
      Write-Output "La fonctionnalité $Feature est déjà installée."
   }
   else {
      Write-Output "L'état de la fonctionnalité $Feature est inconnu."
   }
}

# Importer le module ADDSDeployment
Import-Module ADDSDeployment

# Vérifier si Active Directory est déjà installé
try {
    $domain = Get-ADDomain -ErrorAction Stop
    Write-Host "Le domaine $($domain.DNSRoot) existe déjà."
    exit 0
} catch {
    Write-Host "Aucun domaine Active Directory trouvé. Installation de l'active directory. "
}

# Vérifier la présence des fichiers AD (NTDS et SYSVOL)
$ntdsPath = "C:\Windows\NTDS"
$sysvolPath = "C:\Windows\SYSVOL"

if (Test-Path $ntdsPath -and Test-Path $sysvolPath) {
    Write-Host "Les fichiers AD existent déjà ($ntdsPath et $sysvolPath), aucune installation requise. "
    exit 0
}

# Exécuter l'installation uniquement si AD n'est pas installé et que les fichiers n'existent pas
Install-ADDSForest `
    -CreateDnsDelegation:$false `
    -DatabasePath $ntdsPath `
    -DomainMode "WinThreshold" `
    -DomainName "remoteworks.local" `
    -DomainNetbiosName "REMOTEWORKS" `
    -ForestMode "WinThreshold" `
    -InstallDns:$true `
    -LogPath $ntdsPath `
    -NoRebootOnCompletion:$false `
    -SysvolPath $sysvolPath `
    -Force:$true

Write-Host "Installation de Active Directory terminée avec succès."
