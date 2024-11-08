#!/bin/bash

echo "Introduce 3 alturas en centímetros (cm) para saber cuál es la más alta"
read n1 n2 n3

alt1=$(($n1 / 100))
alt2=$(($n2 / 100))
alt3=$(($n3 / 100))

altmax=$(echo "$alt1 $alt2 $alt3" | tr " " "\n" | sort -n | tail -n 1)

echo "La altura mayor es de $altmax metros"
