#!/bin/bash

# comprobamos que se le pasen almenos 2 parametros de entrada
if [ "$#" -ne 2 ]; then
    echo "Se necesitan únicamente dos parámetros para ejecutar este script"
    exit 1
fi

# URL de la página web (primer parámetro)
URL="$1"

# Nombre del archivo donde se guardará el contenido de la página
ARCHIVO="textoWeb.txt"

# Descargar el contenido de la página web utilizando curl
curl -o "$ARCHIVO" "$URL" 
# Palabra a buscar (segundo parámetro)
PALABRA="$2"

# Comprobamos que la palabra existe
if grep -q "$PALABRA" "$ARCHIVO"; then
    # La palabra aparece en el archivo
    CANTIDAD=$(grep -o -i "$PALABRA" "$ARCHIVO" | wc -l)  
    PRIMERA_LINEA=$(grep -in "$PALABRA" "$ARCHIVO" | head -n 1)  
    echo "La palabra \"$PALABRA\" aparece $CANTIDAD veces"
    echo "Aparece únicamente en la línea $PRIMERA_LINEA"
else
    # La palabra no se encuentra en el archivo
    echo "No se ha encontrado la palabra \"$PALABRA\""
fi

# Eliminar el archivo de contenido web después de su uso
# rm "$ARCHIVO"
