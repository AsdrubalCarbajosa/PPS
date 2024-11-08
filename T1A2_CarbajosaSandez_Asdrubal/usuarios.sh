#!/bin/bash

##Función para mostrar la información de un usuario
info() {
	usu=$1

    # Verificamos si el usuario existe en el sistema
    if id "$usu" &>/dev/null; then
        # Si el usuario existe, obtenemos la información
        nombre=$(getent passwd "$usu" | cut -d: -f1)
        uid=$(id -u "$usu")
        gid=$(id -g "$usu")
        directorio=$(getent passwd "$usu" | cut -d: -f6)

        # Mostramos la información
        echo "Información del usuario $usu"
        echo "Nombre de usuario: $nombre"
        echo "UID: $uid"
        echo "GID: $gid"
        echo "Directorio de trabajo: $directorio"
    else
        # Si el usuario no existe, mostramos un mensaje de error
        echo "Error: El usuario $usu no existe en el sistema."
        echo "Error: El usuario '$usuario' no existe." >> usuarios.sh-log
    fi
}

# Bucle principal para solicitar el nombre de usuario
while true; do
    # Pedimos el nombre de usuario al usuario
    echo "Introduce el nombre de usuario (o 'salir' para terminar): " 
	read usu

    # Si el usuario introduce salir, salimos del bucle
    if [ "$usu" == "salir" ]; then
        echo "Saliendo del programa."
        exit
    fi

    # Llamamos a la función para mostrar la información del usuario
    info "$usu"

    # Preguntamos si desea continuar con otro usuario o salir
    echo "¿Deseas consultar otro usuario? (s/n): "
	read respuesta
    if [ "$respuesta" != "s" ]; then
        echo "Saliendo del programa."
        exit
    fi
done
