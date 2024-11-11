#!/bin/bash

dia=$(date "+%d%m%Y")
hora=$(date "+%H%M%S")

if [ ! -f usuarios.csv ]
	then touch usuarios.csv
fi

echo "-----------$dia $hora------------" >> log.log

function  copia {
	tar -czf copia_usuarios_"$dia"_"$hora".zip usuarios.csv
	
	cop=$(ls -t copia_usuarios*)
	num=$(echo "$cop" | wc -l)

	if [ $num -gt 2 ]
		then bor=$(echo "$cop" | tail -n +3)
		echo "Se eliminarán las siguientes copias antiguas:"
		echo "$bor"
		echo "$bor" | xargs rm
	fi
}

function alta {

	function generauser {
    	nombre=$1
    	apellido1=$2
    	apellido2=$3
    	dni=$4

    	##Primer letra del nombre
    	user=$(echo "$nombre" | cut -c 1 | tr '[:upper:]' '[:lower:]')

    	##Tres primeras letras del primer apellido
    	user+=$(echo "$apellido1" | cut -c 1-3 | tr '[:upper:]' '[:lower:]')

    	##Tres primeras letras del segundo apellido
    	user+=$(echo "$apellido2" | cut -c 1-3 | tr '[:upper:]' '[:lower:]')

    	##Tres últimos dígitos del DNI
    	user+=$(echo "$dni" | tail -c 4)

    	echo $user
	}

	##Función para comprobar si el nombre de usuario ya existe en el archivo
	function existe {
    	usuario=$1
    	if grep -q ":$usuario$" "usuarios.csv"
		then return 0  # El usuario ya existe
    		else return 1  # El usuario no existe
    	fi
	}

	##Función para añadir un nuevo usuario
	function añadir_usuario {
    	echo "Introduce el nombre del usuario:"
    	read nombre
    	echo "Introduce el primer apellido del usuario:"
    	read apellido1
    	echo "Introduce el segundo apellido del usuario:"
    	read apellido2
    	echo "Introduce el DNI del usuario (8 dígitos y letra):"
    	read dni

    	##Convertir todo a minúsculas
    	nombre=$(echo "$nombre" | tr '[:upper:]' '[:lower:]')
    	apellido1=$(echo "$apellido1" | tr '[:upper:]' '[:lower:]')
    	apellido2=$(echo "$apellido2" | tr '[:upper:]' '[:lower:]')
    	dni=$(echo "$dni" | tr '[:upper:]' '[:lower:]')

    	##Generar el nombre de usuario
    	usuario=$(generauser "$nombre" "$apellido1" "$apellido2" "$dni")
	##Insertar una línea en el archivo de logs sobre la creación del nuevo usuario
	echo "INSERTADO $nombre:$apellido1:$apellido2:$dni:$usuario el $dia a las $hora" >> log.log

    	##Verificar si el usuario ya existe
    	if existe "$usuario" 
		then echo "El nombre de usuario '$usuario' ya existe. Introduce otro nombre."
    		else echo "$nombre:$apellido1:$apellido2:$dni:$usuario" >> usuarios.csv
        	echo "Usuario '$usuario' añadido correctamente."
    	fi
	}

	añadir_usuario
}

function baja {
	echo "Introduce el nombre de usuario a eliminar:"
    	read usuario
	
	function existe {
    	usuario=$1
    	if grep -q ":$usuario$" "usuarios.csv" 
		then return 0
    	else
        	return 1
    	fi
	}

    	##Comprobar si el usuario existe
    	if existe "$usuario"
		then
        ##Crear un nuevo archivo sin la línea del usuario a eliminar
        	grep -v ":$usuario$" "usuarios.csv" > temp.txt && mv temp.txt "usuarios.csv"
        	echo "El usuario '$usuario' ha sido eliminado."
		echo "BORRADO $nombre:$apellido1:$apellido2:$dni:$usuario el $dia a las $hora" >> log.log
    		else echo "El usuario '$usuario' no existe."
   	 fi

}

function mostrar_usuarios {
	if [ -f "usuarios.csv" ]
		then cat "usuarios.csv"
            else
                echo "El archivo de usuarios no existe."
            fi
}

function mostrar_log {
	cat log.log
}

function menu {
	echo "-------AE1.3--------"
	echo "Elige una de las siguientes opciones:"
	echo "1.- Ejecutar copia de seguridad"
	echo "2.- Dar de alta usuario"
	echo "3.- Dar de baja al usuario"
	echo "4.- Mostrar usuarios"
	echo "5.- Mostrar log del sistema"
	echo "6.- Salir"
	read n
	case $n in 
		1) copia;;
		2) alta;;
		3) baja;;
		4) mostrar_usuarios;;
		5) mostrar_log;;
		6) exit;;
	esac
}
menu
