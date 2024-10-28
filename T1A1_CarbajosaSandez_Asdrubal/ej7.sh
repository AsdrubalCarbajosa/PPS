#!/bin/bash

if [ -e $1 ]
	then
		if  [ -f $1 ]
			then echo "La ruta indicada pertenece a un fichero"
		elif [ -d $1 ]
			then echo "La ruta indicada pertenece a un directorio"
		fi
	else echo "El fichero no existe"
	exit
fi
