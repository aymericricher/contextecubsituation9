#=======================================================
#NAME:exerciceAD1.ps1
#AUTHOR: RICHER Aymeric
#DATE:26/02/2025
#
#VERSION:1.0
#
#=======================================================


$csvPath = "\\192.168.3.3\Partage\import.csv"


$users = Import-Csv -Delimiter ";" -Path $csvPath 










foreach ($user in $users) {
    $name = $user.firstName + " " + $user.lastName
    $fname = $user.firstName
    $lname = $user.lastName
    $login = $user.firstName + "." + $user.lastName
    $Ulogin = "$login@local.californie.cub.sioplc.fr"
    $upassword = "EtudiantAymeric_007"
    $oupath = $user.ou 
    $ou = "OU=$oupath,DC=local,DC=californie,DC=cub,DC=sioplc,DC=fr"
    
    
    try {
        New-ADUser  -SamAccountName $name `
                    -UserPrincipalName $Ulogin `
                    -GivenName $fname `
                    -Surname $lname `
                    -Name "$fname" `
                    -DisplayName "$name" `
                    -Path $ou `
                    -AccountPassword (ConvertTo-SecureString $password -AsPlainText -Force) `
                    -Enabled $true `
                    -PassThru
    
    
      }
    catch{"échec de la création de l'utilisateur";break}
  
}








