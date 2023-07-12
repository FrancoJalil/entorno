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

   Para crear la imagen a partir del dockerfile:
   ```
   docker build . -t myapp
   ```

   Para crear el contenedor, ejecutar la imagen y establecer un directorio para guardar los archivos compartidos:

   LINUX:
   ```
   docker run -it -v /home/user/ejemplo:/app/archivos_comprimidos/ myapp
   ```

   WINDOWS:
   ```
   docker run -it -v C:/Users/user/ejemplo:/app/archivos_comprimidos/ myapp
   ```

   // donde '/home/user/ejemplo' o  'C:/Users/user/ejemplo' es la ruta donde se guardarán los archivos creados con el programa.
   
 2. Por defecto, el archivo **./menu.sh** es ejecutado, por lo que ya estamos corriendo el programa en el container de docker.
   
