#!/bin/bash

echo "Dime tu edad"
read ed

##Obtengo el año en el que estamos con el comando date

year=$(date +%Y)

##Obtengo el año de nacimiento restando la edad introducida al año actual

nac=$((year - ed))

##Obtengo la década dividiendo el año de nacimiento entre 10 y luego multiplicándolo por 10 de nuevo

dec=$((nac / 10 * 10))

echo "Si naciste en $nac, naciste en la década de $dec"
