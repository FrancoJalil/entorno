#!/bin/bash

while true; do
    echo "Ingrese una opción:
            1 -> GENERAR
            2 -> DESCOMPRIMIR
            3 -> PROCESAR
            4 -> COMPRIMIR
            * -> SALIR"
    read OPCION

    if [ "$OPCION" == "*" ]; then
        break
    fi

    case $OPCION in
        1)
            echo "Ingrese la cantidad de imágenes a generar"
            read CANTIDAD
            bash generar.sh $CANTIDAD
            ;;
        2)
            bash descomprimir.sh imagenes.tar.gz suma_verificacion.txt
            ;;
        3)
            bash procesar.sh
            ;;
        4)
            # convertir los retornos de carro
            dos2unix comprimir.sh
            bash comprimir.sh
            ;;
        *)
            echo "Ingrese una opción válida"
            ;;
    esac
done

echo "¡Hasta luego!"
