#!/bin/bash

echo "Introduce en qué año naciste y conocerás qué animal te corresponde"
read n

##Calculo el resto mediante %

res=$(($n % 12))

##Según el resultado del resto, se usa case para saber qué animal equivale al número

case $res in
	0) echo "La rata";;
	1) echo "El buey";;
	2) echo "El tigre";;
	3) echo "El conejo";;
	4) echo "El dragón";;
	5) echo "La serpiente";;
	6) echo "El caballo";;
	7) echo "La cabra";;
	8) echo "El mono";;
	9) echo "El gallo";;
	10) echo "El perro";;
	11) echo "El cerdo";;
esac
