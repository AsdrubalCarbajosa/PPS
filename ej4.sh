#!/bin/bash

if [ $# = 0 ]
	then  echo "No has introducido ningún parámetro"
exit
	else echo "Has introducido $# parámetros:"
		echo $*
fi
