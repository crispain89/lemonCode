#!/bin/bash


URL="https://es.wikipedia.org/wiki/Valle_de_Arán"  

# Se guardará aquí el contenido que se descargue
ARCHIVO="contenido.txt"

# Descargar el contenido de la página web utilizando curl
curl -o "$ARCHIVO" "$URL"  

# Palabra a buscar pasada como parámetro al invocar el script
PALABRA="$1"

# Verificamos que exista la palabra
if grep -q "$PALABRA" "$ARCHIVO"; then
    CANTIDAD=$(grep -o -i "$PALABRA" "$ARCHIVO" | wc -l)  
    PRIMERA_LINEA=$(grep -in "$PALABRA" "$ARCHIVO" | head -n 1)  
    echo "La palabra \"$PALABRA\" aparece $CANTIDAD veces"
    echo "Aparece por primera vez en la línea $PRIMERA_LINEA"
else
   
    echo "No se ha encontrado la palabra \"$PALABRA\""
fi

# Eliminar el archivo de contenido web después de su uso
# rm "$ARCHIVO"

