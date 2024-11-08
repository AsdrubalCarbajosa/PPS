#!/bin/bash

##Obtengo el mes actual con date

mes=$(date +%B)

##Obtengo el número corrpondiente al mes actual

num=$(date +%m)

##Uso case para hacer variables dependiendo del número de mes en el que nos encontremos

case $num in
	1|3|5|7|8|10|12)
		dias=31;;
	4|6|9|11)
		dias=30;;
	2)
		dias=28;;
esac

echo "Estamos en $mes, un mes con $dias días"
