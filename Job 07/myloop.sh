#!/bin/bash

nbre=1

while [ "$nbre" -le 10 ]
do
    echo "Je suis un script qui arrive à faire une boucle" $nbre
    nbre=$(($nbre+1))
done

