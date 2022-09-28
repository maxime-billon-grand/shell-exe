#!/bin/bash
#PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
#HOME=/home/max
cd /home/max/shell.exe/"Job 08"

nbreConnexions=$(last | grep -c max)

#echo $nbreConnexions

dateSysteme=$(date +%d-%m-%Y-%H:%M)
nomFichier="number_connexion-"$dateSysteme".txt"

echo $nbreConnexions > $nomFichier

tar --force-local -cf $nomFichier.tar $nomFichier && rm $nomFichier && mv $nomFichier.tar ./Backup

