#!/bin/bash

if [ $# = 0 ]
	then  echo "No has introducido ningún parámetro"
exit 1
	else echo "Has introducido $# parámetros:"
		echo $*
exit 0
fi
