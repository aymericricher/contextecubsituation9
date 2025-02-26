#=======================================================
#NAME:exerciceDNS1.ps1
#AUTHOR: RICHER Aymeric
#DATE:26/02/2025
#
#VERSION:1.0
#COMMENTS: Création d'une étentue DHCP avec le nom,l'adresse réseau,le masque,la première adresse,la dernière et la passerelle
#
#=======================================================



$nombre = Read-Host "Combien d'hôtes voulez-vous créer ?"




for ($i = 0; $i -lt $nombre; $i++){
$nomA = Read-host "Entrer le nom du type A ?"
$addrA = Read-host "Entrer l'adresse réseau de l'hote ?"
Add-DnsServerResourceRecordA -Name $nomA -Zone local.californie.cub.sioplc.fr. -IPv4Address $addrA
}




