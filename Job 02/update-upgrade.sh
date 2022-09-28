#!/bin/bash

if sudo apt update ; then
    echo $'UPDATE SUCCEEDED\nStart upgrade ? (y/n)'
    read startNext
    if [ "$startNext" = "y" ]; then 
        sudo apt upgrade
    elif [ "$startNext" = "n" ]; then
        echo "Arrêt du processus......."
        exit
    else
        echo $'Mauvaise réponse !\nArrêt du processus'
        exit
    fi
else
    echo "UPDATE FAILED"
fi
