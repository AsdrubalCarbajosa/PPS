#!/bin/bash

## Se pide un número con read para comprobar si es multiplo de 10 o no

echo "Insertar un numero para saber si es múltiplo de 10 o no"
read n1

## Ahora se calcula el resto de la división entre el número y 10

op=$[ $n1 % 10 ]

## Si el resto es igual 0 significa que es múltiplo de 10, de lo contrario no lo es

if [ $op -eq 0 ]
	then
		echo "Es múltiplo de 10"
	exit
	else
		echo "No es múltiplo de 10"
fi
