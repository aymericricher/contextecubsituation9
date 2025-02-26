#=======================================================
#NAME:exerciceDNS2.ps1
#AUTHOR: RICHER Aymeric
#DATE:26/02/2025
#
#VERSION:1.0
#COMMENTS: Création d'une étentue DHCP avec le nom,l'adresse réseau,le masque,la première adresse,la dernière et la passerelle
#
#=======================================================



$nombre = Read-Host "Combien d'hôtes voulez-vous créer ?"



for ($i = 0; $i -lt $nombre; $i++){

    $type = Read-Host "Quel type d'enregistrement(A/CNAME) ? "

    if ($type -eq 'A'){
        $nomA = Read-host "Entrer le nom du type A :"
        $addrA = Read-host "Entrer l'adresse réseau de l'hote :"
        try { Add-DnsServerResourceRecordA -Name $nomA -ZoneName 'local.californie.cub.sioplc.fr.' -IPv4Address $addrA }
        catch{"échec de la création de l'hote";break}
    }

    elseif ($type -eq 'CNAME'){
        $nomCNAME = Read-host "Entrer le nom du type CNAME :"
        $HostCNAME = Read-host "Entrer l'alias du domaine :"
        try { Add-DnsServerResourceRecordCName -Name $nomCNAME -HostNameAlias $hostCNAME -ZoneName 'local.californie.cub.sioplc.fr.' }
        catch{"échec de la création de l'hote";break}
    }

    else {
    Write-Host "Veuillez entrez A ou CNAME : "
    }






}



