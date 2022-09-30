#!/bin/bash

case "$2" in 
	"+" )
		result=$(($1 + $3));;
	"-" )
		result=$(($1 - $3));;
# Si c'est une étoile qui est rentrée comme opérateur, l'expression "$2" sera égale au nom du script: my_calculator.sh (mais $0 ne fonctionne pas) 
	"x" | "*" | "X" | "my_calculator.sh" )
		result=$(($1 * $3));;
	"/" | "÷" )
		result=$(($1 / $3));;
    * )
        echo "Vous n'avez pas rentré le bon opérateur !";;
esac

echo $result

