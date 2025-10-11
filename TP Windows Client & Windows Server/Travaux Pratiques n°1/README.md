# ℹ️ Informations 
Le projet a été essentiellement réalisé sur des VM via VMWare ESXi. Avec Windows Server 2022 et Windows 10. Dans le dossier, il n'y a qu'un seul script PowerShell, il regroupe seulement les commandes utiles au pare-feu. Il est inutile de l'exécuter. C'était seulement pour avoir un rendu plus propre, et une possibilité pour ceux qui le voudraient de copier-coller directement. 

# Membres du groupe
👨  [Vladimir Vitrou](https://www.linkedin.com/in/vladimir-vitrou-90680b34a)  

👨  [Lucas Molendi](https://www.linkedin.com/in/lucasmolendi)  

👨  [Nino Cailloud](https://www.linkedin.com/in/nino-caillaud-47a08634b)

# ⁉ Problématique du projet 
*Il est conçu pour être réalisable dans un environnement de machines virtuelles (VM) ou sur des machines physiques*.

Objectif global : Déployer, sécuriser et administrer des postes Windows 10 ou 11 dans un contexte professionnel, en appliquant des politiques avancées de sécurité et d’administration. 

## Jour 1 – Déploiement et préparation

Objectifs : Préparer et déployer une image Windows standardisée et intégrer les postes dans le domaine.

Tâches à réaliser :
- Installer un poste Windows 10, 11 (VM).
- Configurer les partitions correctement (UEFI/GPT, préparation pour BitLocker).
- Créer une image de référence avec Sysprep.
- Déployer l’image sur au moins 2 postes via MDT ou WDS.
- Joindre les postes au domaine Active Directory.
- Créer des OU spécifiques (Stagiaires, IT, Direction).
- Affecter des GPO de base (mot de passe fort, verrouillage de session).


## Jour 2 – Sécurisation et GPO avancées

Objectifs : Appliquer des mesures de sécurité avancées et automatiser la configuration via des stratégies de groupe.

Tâches à réaliser :
- Activer BitLocker (TPM + clé de récupération). 
- Activer Credential Guard et Virtualization-Based Security (VBS). 
- Configurer Windows Defender avec exclusions et analyse planifiée. 
- Déployer et tester des GPO supplémentaires : 
  * Redirection de dossiers utilisateurs (Documents, Bureau) vers un partage réseau. 
  * Déploiement d’un script de connexion/déconnexion. 
  * Restriction d’accès au Panneau de configuration et aux paramètres Windows. 
  * Mise en place d’AppLocker avec règles différenciées (Stagiaires vs IT).
  * Interdiction des périphériques USB sauf pour l’équipe IT.
  * Déploiement de préférences GPO (lecteurs réseaux, imprimantes par défaut, fond d’écran de l’entreprise).


## Jour 3 – Administration distante, mise à jour et dépannage

Objectifs : Assurer l’administration et la maintenance à distance des postes, et résoudre des incidents.

Tâches à réaliser :
- Configurer et tester le Bureau à distance (RDP sécurisé avec NLA).
- Créer et tester un accès VPN vers le réseau pédagogique.
- Mettre en place un serveur WSUS, approuver des mises à jour et forcer leur application via GPO.
- Vérifier et personnaliser les règles du pare-feu Windows Defender (in/out).
- Scénarios de dépannage :
  * Poste qui ne démarre plus : réparer avec BCD, SFC, DISM ou WinRE.
  * Perte de profil utilisateur : recréer et restaurer les données.
  * GPO qui ne s’applique pas : analyse avec gpresult /h et Event Viewer.
  * Lenteurs réseau : diagnostic avec Resmon, BranchCache et tests complémentaires.


## Livrables attendus 
- Rapport technique détaillé (captures, scripts, commandes).
- Script de déploiement GPO/AppLocker documenté.
- Procédures de dépannage complètes.


