# Imagen base
FROM ubuntu:latest

# Establecer directorio de trabajo
WORKDIR /app

# Copiar archivos necesarios al contenedor
COPY generar.sh /app
COPY descomprimir.sh /app
COPY procesar.sh /app
COPY comprimir.sh /app
COPY menu.sh /app

# Instalar dependencias o utilidades adicionales si es necesario
RUN apt-get update && apt-get install -y curl imagemagick dos2unix

# Establecer permisos de ejecución para los scripts
RUN chmod +x generar.sh descomprimir.sh procesar.sh comprimir.sh menu.sh

# Convierte los archivos en formato Unix
RUN dos2unix generar.sh descomprimir.sh procesar.sh comprimir.sh menu.sh

# Comando por defecto al ejecutar el contenedor
CMD ["./menu.sh"]
