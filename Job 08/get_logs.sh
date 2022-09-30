#!/bin/bash

cd /home/max/shell.exe/"Job 08"

nbreConnexions=$(last | grep -c max)

dateSysteme=$(date +%d-%m-%Y-%H:%M)
nomFichier="number_connexion-"$dateSysteme".txt"

echo $nbreConnexions > $nomFichier

tar --force-local -cf $nomFichier.tar $nomFichier && rm $nomFichier && mv $nomFichier.tar ./Backup

# Pour regler CRON pour qu'il s'éxecute toutes les heures:
# 0 */1 * * * bash /home/max/shell.exe/"Job 08"/get_logs.sh


