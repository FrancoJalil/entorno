#!/bin/bash

# Verificar si se proporciona un número válido de imágenes para generar
if [ $# -eq 0 ] || ! [[ $1 =~ ^[0-9]+$ ]]; then
	echo "Error. Debe proporcionar un número válido de imágenes para generar."
	exit 1
fi

# argumento: cantidad de imagenes a generar


# bucle
	# Genera imagenes
		# nombrar a la imagen con un nombre aleatorio
		# usar sleep

# obtener lista de nombres
wget -q "https://raw.githubusercontent.com/adalessandro/EdP-2023-TP-Final/main/dict.csv" -O dict.csv

nombres=$(cut -d',' -f1 dict.csv)

# descargar y generar las imagenes
cantidad="$1"
suma_verificacion=""

for ((i=1; i<=cantidad; i++)); do
    nombre=$(echo "$nombres" | shuf -n 1)
    echo "Generando imagen $i: $nombre.jpg"
    
    # Descargar imagen de thispersondoesnotexist.com
    wget -q -O "$nombre.jpg" "https://thispersondoesnotexist.com/"
    
    # Agregar nombre de archivo a la lista de nombres de personas generados
    suma_verificacion+="$nombre.jpg "
    
    # Esperar un tiempo aleatorio antes de la siguiente descarga
    sleep $((RANDOM % 2))
done

# Comprimir las imágenes
echo "Comprimiendo imágenes..."

rm imagenes.tar.gz
tar -czvf imagenes.tar.gz *.jpg

# Generar el archivo con la suma de verificación
echo "Generando archivo de suma de verificación..."

rm suma_verificacion.txt
md5sum *.jpg >> suma_verificacion.txt


# Crear carpeta para guardar todos los datos de esta ejecución

mkdir -p "imagenes"
rm -f imagenes/*.jpg
mv *.jpg "imagenes"


echo "Proceso completado."

