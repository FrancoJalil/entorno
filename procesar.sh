#!/bin/bash

# filtrar imagenes con nombre de personas validos. Mayus+minus... (no numeros)
# recortar imagenes a una resolucion de 512 x 512 con IMAGEMAGICK

# Patrón para filtrar imágenes con nombres de personas válidos
valid_name_pattern="^[A-Z][a-zA-Z]*(\s+[A-Z][a-zA-Z]*)*$"

dir_imagenes="imagenes"

rm -f imagenes_recortadas/*
mkdir -p "imagenes_recortadas"

# Recorrer los archivos en el directorio de entrada
for file in "$dir_imagenes"/*; do
  # Obtener el nombre del archivo sin la ruta
  filename=$(basename "$file")
  filename=${filename%.*}
  echo $filename
  
  # Verificar si el nombre del archivo coincide con el patrón
  if [[ $filename =~ $valid_name_pattern ]]; then
    # Recortar la imagen a una resolución de 512x512 utilizando ImageMagick
    convert "$file" -resize 512x512 "imagenes_recortadas/$filename.jpg"
  fi
done

echo "Proceso completado."