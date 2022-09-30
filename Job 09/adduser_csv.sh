#!/bin/bash
cd /home/max/shell.exe/"Job 09"

# Boucle pour décomposer chaque ligne du fichier CSV et les placer dans une variable array $ligne {ID Prénom Nom Mdp Role}
while IFS=, read -ra ligne
do

# Si l'ID est un chiffre et est supérieur à 1000
    if [[ ${ligne[0]} =~ '^[0-9]+$' ]] & [[ ${ligne[0]} -gt 1000 ]]; then

# Si l'utilisateur n'existe pas
        if ! id -u "${ligne[1],,}" >/dev/null 2>&1; then
            echo "USER DOESN'T EXISTS" ${ligne[1]} ${ligne[2]}

# Créer l'utilisateur sans mot de passe
            sudo adduser ${ligne[1],,} --gecos "${ligne[1]} ${ligne[2]},,," --disabled-password
# Ajouter le mot de passe de lutilisateur créé
            echo "${ligne[1],,}:${ligne[3]}" | sudo chpasswd

# Si l'utilisateur est un admin, il est ajouté au groupe sudo
            if [[ ${ligne[4]} = "Admin" ]]; then
                echo ${ligne[1]} "IS AN ADMIN ->" ${ligne[4]}
                sudo adduser ${ligne[1],,} sudo
            else
                echo ${ligne[1]} "IS NOT ADMIN ->" ${ligne[4]}

            fi

# Si l'utilisateur existe déja
        else 
            echo "USER ->" ${ligne[1],,} "ALREADY EXISTS"

        fi
    
    else 
        echo "L'ID --> ${ligne[0]} n'est pas bon (n'est pas un nombre et n'est pas supérieur à 1000)"
    fi
done < /home/max/shell.exe/"Job 09"/Shell_Userlist.csv



