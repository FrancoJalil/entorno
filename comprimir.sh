#!/bin/bash

valid_name_pattern="^[A-Z][a-zA-Z]*(\s+[A-Z][a-zA-Z]*)*$"

lista_nombres="lista_nombres.txt"
lista_nombres_validos="lista_nombres_validos.txt"
lista_nombres_a="lista_nombres_a.txt"

rm -f lista_nombres.txt
rm -f lista_nombres_validos.txt
rm -f lista_nombres_a.txt

# bucle *.jpg TODOS LOS NOMBRES
for archivo in *.jpg; do
    # añadir cada nombre al .txt
    filename=$(basename "$archivo")
    filename=${filename%.*}

    echo "$filename" >> "$lista_nombres"
    # Verificar si el nombre del archivo coincide con el patrón

    
    if [[ $filename =~ $valid_name_pattern ]]; then
        # Añadir los nombres validos a otra lista txt
        echo "$filename" >> "$lista_nombres_validos"
    fi

    if [[ $filename == *a ]]; then
        echo "$filename" >> "$lista_nombres_a"
    fi
done

# Generar archivo comprimido que incluya los archivos generados y todas las imágenes
tar -czvf archivos_comprimidos.tar.gz "$lista_nombres" "$lista_nombres_validos" "$lista_nombres_a" *.jpg

rm -f *.jpg