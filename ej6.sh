#!/bin/bash

if  [ $# -eq 2 ]
	then mkdir $1
	cp $2 $1
	else echo "No se han recibido los parámetros necesarios"
fi
