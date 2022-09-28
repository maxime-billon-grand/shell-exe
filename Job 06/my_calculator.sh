#!/bin/bash

case "$2" in 
	"+" )
		result=$(($1 + $3));;
	"-" )
		result=$(($1 - $3));;
	"x" | "*" | "X" )
		result=$(($1 * $3));;
	"/" | "÷" )
		result=$(($1 / $3));;
    * )
        echo "Vous n'avez pas rentré le bon opérateur !";;
esac

echo $result

