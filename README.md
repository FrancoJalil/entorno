---
#marp: true
---

# Trabajo Práctico Final - Entorno de programación
El objetivo del trabajo práctico es diseñar y escribir un programa para procesar un lote de imágenes. Este programa consta de **tres partes principales**:
* Generar y descargar las imágenes a través
de un servicio web
* Aplicar una transformación solamente a las imágenes de
personas.
* Generar un archivo comprimido con las imágenes
procesadas.

## Requisitos Previos
Es necesario de antemano descargar e instalar [docker](https://www.docker.com/) y [git](https://git-scm.com/), para descargar y ejecutar el repositorio correctamente.


## Instalación
1. Dentro de la terminal de preferencia, nos ubicamos en el directorio donde deseamos guardar el repositorio.
2. Ingresamos los siguientes comandos:
   
   Para clonar el repositorio:
   ``` 
   git init
   git clone https://github.com/FrancoJalil/entorno.git 
   ```
   
   Para guardar el archivo final en el servidor host:

   ```
   sudo docker run -it -v (ruta local del repositorio):/app/archivos_comprimidos/ myapp
   ```
   
   Para construir el contenedor a partir del dockerfile:

   ```
   sudo docker build -t tp-entorno-final-5 .
   ```
 3. Por defecto, el archivo **./menu.sh** es ejecutado, por lo que ya estamos corriendo el programa en el container de docker.
   