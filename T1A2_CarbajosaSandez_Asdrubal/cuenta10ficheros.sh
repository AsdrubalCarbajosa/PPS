#!/bin/bash

##Declaro una variable con el comando find vara encontrar los ficheros y wc para contarlos

cue=$(find $1 -maxdepth 1 -type f | wc -l)
##Hago un if en el que comparo si el resultado es mayor o menor de 10

if [ $cue -ge 10 ]
	then echo "El directorio tiene más de 10 ficheros"
	else echo "El directorio tiene menos de 10 ficheros"
fi
