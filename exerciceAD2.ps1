#=======================================================
#NAME:exerciceAD1.ps1
#AUTHOR: RICHER Aymeric
#DATE:26/02/2025
#
#VERSION:1.0
#
#=======================================================

Import-Module ActiveDirectory


while ($true) {
    # Demande des informations pour la création de l'utilisateur
    $Nom = Read-Host "Entrez le nom de l'utilisateur"
    $Prenom = Read-Host "Entrez le prénom de l'utilisateur"
    $SamAccountName = Read-Host "Entrez le nom de connexion (sAMAccountName)"
    $UserPrincipalName = "$SamAccountName@local.californie.cub.sioplc.fr"   
    $MotDePasse = Read-Host "Entrez le mot de passe" -AsSecureString
        
    try{New-ADUser -Name "$Prenom $Nom" `
               -DisplayName "$Nom $Prenom" `
               -GivenName $Prenom `
               -Surname $Nom `
               -SamAccountName $SamAccountName `
               -UserPrincipalName $UserPrincipalName `
               -AccountPassword $MotDePasse `
               -Enabled $true `
               -PassThru
    }
    catch{"échec de la création de l'utilisateur";break}
    Write-Host "Utilisateur $Prenom $Nom créé avec succès !" -ForegroundColor Green

    $Continue = Read-Host "Voulez-vous créer une autre OU ? (O/N)"
    if ($Continue -ne "O") { break }
}



