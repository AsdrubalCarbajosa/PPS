#!/bin/bash

echo "Introduce 2 números"
read n1 n2

##Se comprueba si el primer número es mayor o menor que el segundo

if [ $n1 -gt $n2 ]
	then 
		n3=$n1
		n1=$n2
		n2=$n3
fi

##Se establece la variable en la que se almacenará la suma

suma=0

##Creo un bucle en el que se repite la suma hasta que la variable i es 
##menor o igual que el segundo numero

for (( i=$n1; i<=$n2; i++ ))
	do
		suma=$((suma + i))
done

echo "La suma del rango de $n1 a $n2 es: $suma"
