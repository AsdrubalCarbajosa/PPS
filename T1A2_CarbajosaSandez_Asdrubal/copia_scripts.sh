#!/bin/bash

# Verificar si se pasó un parámetro (el directorio)
if [ -z "$1" ]
	then echo "Error: Debes proporcionar el directorio como parámetro."
    	exit 1
fi

# Verificar si el directorio existe
if [ ! -d "$1" ]; then
	echo "Error: El directorio '$1' no existe."
	exit 1
fi

# Obtener la fecha actual en el formato ddmmaaaa
fecha=$(date +"%d%m%Y")

# Crear el nombre del archivo tar con la fecha actual
nom_tar="copia_scripts_${fecha}.tar"

# Buscar todos los archivos con extensión .sh en el directorio proporcionado
# y empaquetarlos en el archivo tar
find "$1" -type f -name "*.sh" | tar -cvf "$nom_tar" -T -
