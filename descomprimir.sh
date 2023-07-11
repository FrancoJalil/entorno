#!/bin/bash

# recibe dos args
    # imagenes comprimidas
    # suma de verificación

imagenes_comprimidas="$1"
suma_verificacion="$2"

# Descomprimir imagenes
tar -xzf $imagenes_comprimidas

# chequea si es valida la suma
md5sum -c $suma_verificacion

if [ $? -eq 0 ]; then
    echo "La validación de la suma fue exitosa, los archivos se descomprimieron exitosamente"

else
    echo "La validación de la suma ha fallado. Ha ocurrido un error con la descompresión"

fi

echo "Proceso completado."