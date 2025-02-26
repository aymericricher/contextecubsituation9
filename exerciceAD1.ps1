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
    $OUName = Read-Host "Entrez le nom de la nouvelle OU"
    $ParentOU = Read-Host "Entrez le chemin de l'OU parente (laissez vide pour la racine du domaine)"
    
 

    if ($ParentOU -eq ""){
        try {New-ADOrganizationalUnit -Name $OUName -Path "DC=local,DC=californie,DC=cub,DC=sioplc,DC=fr"}
        catch {"échec de la création de l'OU";break}
    }
    else {
        try {New-ADOrganizationalUnit -Name $OUName -Path "OU=$ParentOU,DC=local,DC=californie,DC=cub,DC=sioplc,DC=fr"}
        catch {"échec de la création de l'OU";break}
    }
    $Continue = Read-Host "Voulez-vous créer une autre OU ? (O/N)"
    if ($Continue -ne "O") { break }
}








