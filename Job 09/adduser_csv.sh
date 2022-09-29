#!/bin/bash

# Boucle qui va décomposer chaque ligne du fichier et mettre dans une variable $array {ID Prénom Nom Mdp Role}
# Par exemple ${array[0]} correspondra à l'ID
while IFS=, read -ra array
do

# Si l'ID est un chiffre et est supérieur à 1000
    if [[ ${array[0]} =~ '^[0-9]+$' ]] & [[ ${array[0]} -gt 1000 ]]; then

# Si l'utilisateur n'existe pas
        if ! id -u "${array[1],,}" >/dev/null 2>&1; then
            echo "USER DOESNT EXISTS" ${array[1],,} ${array[2]}

# Créer l'utilisateur
            sudo adduser ${array[1],,} --gecos "${array[1]} ${array[2]},,," --disabled-password
            echo "${array[1],,}:${array[3]}" | sudo chpasswd

# Si l'utilisateur est un admin, il est ajouté au groupe sudo
            if [[ ${array[4]} = "Admin" ]]; then
                echo ${array[1]} "IS AN ADMIN ->" ${array[4]}
                sudo adduser ${array[1],,} sudo
            else
                echo ${array[1]} "ISNT ADMIN ->" ${array[4]}

            fi

# Si l'utilisateur existe déja
        else 
            echo "USER ->" ${array[1],,} "ALREADY EXISTS"

        fi

    fi
done < Shell_Userlist.csv





