# Ejercicios

## Ejercicio 1

Crea mediante comandos de bash la siguiente jerarquía de ficheros y directorios

```bash
foo/

├─ dummy/

│  ├─ file1.txt

│  ├─ file2.txt

├─ empty/
```


Donde file1.txt debe contener el siguiente texto:

Me encanta la bash!!
Y file2.txt debe permanecer vacío.

```bash
mkdir -p ./foo/empty ./foo/dummy
echo "Me encanta bash" > foo/dummy/file1.txt
touch foo/dummy/file2.txt
```

## Ejercicio 2

2. Mediante comandos de bash, vuelca el contenido de file1.txt a file2.txt y mueve file2.txt a la carpeta empty
El resultado de los comandos ejecutados sobre la jerarquía anterior deben dar el siguiente resultado.
```bash 
# En este caso como solamente queremos VOLCAR el contenido y el archivo de destino esta vacío utilizaremos este comando:

# volcar el contenido 
cat file1.txt > file2.txt ; mv ./file2.txt ../empty/file2.txt

```
```bash

foo/
├─ dummy/
│  ├─ file1.txt
├─ empty/
  ├─ file2.txt

```
Donde file1.txt y file2.txt deben contener el siguiente texto:

## Ejercicio 3
3. Crear un script de bash que agrupe los pasos de los ejercicios anteriores y además permita establecer el texto de file1.txt alimentándose como parámetro al invocarlo
Si se le pasa un texto vacío al invocar el script, el texto de los ficheros, el texto por defecto será:

Que me gusta la bash!!!!

```bash
#!/bin/bash

# Verificar si se proporciona un argumento
if [ $# -eq 0 ]; then
    texto="Que me gusta la bash!!!!"
else
    texto="$*"
fi

# Crear la carpeta "foo" si no existe
if [ ! -d "foo" ]; then
    mkdir foo
fi

# Crear las carpetas "empty" y "dummy" dentro de "foo"
mkdir -p ./foo/empty ./foo/dummy

# Crear el archivo "file1.txt" en "dummy" con el contenido proporcionado o predeterminado
echo "$texto" > foo/dummy/file1.txt

# Crear el archivo "file2.txt" en "dummy" como un archivo vacío
touch foo/dummy/file2.txt

# Copiar el contenido de "file1.txt" a "file2.txt"
cat foo/dummy/file1.txt > foo/dummy/file2.txt

# Mover la carpeta "dummy" dentro de la carpeta "empty"
mv foo/dummy/file2.txt foo/empty/file2.txt

```
## Ejercicio 4
4. Crea un script de bash que descargue el contenido de una página web a un fichero y busque en dicho fichero una palabra dada como parámetro al invocar el script
La URL de dicha página web será una constante en el script.

Si tras buscar la palabra no aparece en el fichero, se mostrará el siguiente mensaje:

$ ejercicio4.sh patata
> No se ha encontrado la palabra "patata"
Si por el contrario la palabra aparece en la búsqueda, se mostrará el siguiente mensaje:

$ ejercicio4.sh patata
> La palabra "patata" aparece 3 veces
> Aparece por primera vez en la línea 27
*Ejecutaremos un Script  que tiene un URL y por parámetro le pasaremos la palabra que quiere buscar*


```bash
#!/bin/bash

URL="https://es.wikipedia.org/wiki/Valle_de_Arán"

# Se guardará aquí el contenido que se descargue
ARCHIVO="contenido.txt"

# Descargar el contenido de la página web utilizando curl
curl -o "$ARCHIVO" "$URL" 2>/dev/null

# Palabra a buscar pasada como parámetro al invocar el script
PALABRA="$1"

# Verificamos que exista la palabra
if grep -q "$PALABRA" "$ARCHIVO"; then
    PRIMERA_LINEA=$(grep -in "$PALABRA" "$ARCHIVO" | head -n 1 | cut -d ':' -f 1)
    echo "La palabra \"$PALABRA\" aparece por primera vez en la línea $PRIMERA_LINEA"
else
    echo "No se ha encontrado la palabra \"$PALABRA\""
fi

# Eliminar el archivo de contenido web después de su uso
rm "$ARCHIVO"


```
### Captura de pantalla.
![Alt text](image-6.png)
## Ejercicio  5
5. OPCIONAL - Modifica el ejercicio anterior de forma que la URL de la página web se pase por parámetro y también verifique que la llamada al script sea correcta
Si al invocar el script este no recibe dos parámetros (URL y palabra a buscar), se deberá de mostrar el siguiente mensaje:

$ ejercicio5.sh https://lemoncode.net/ patata 27
> Se necesitan únicamente dos parámetros para ejecutar este script
Además, si la palabra sólo se encuentra una vez en el fichero, se mostrará el siguiente mensaje:

$ ejercicio5.sh https://lemoncode.net/ patata
> La palabra "patata" aparece 1 vez
> Aparece únicamente en la línea 27

```bash
#!/bin/bash

URL="https://es.wikipedia.org/wiki/Valle_de_Arán"

# Se guardará aquí el contenido que se descargue
ARCHIVO="contenido.txt"

# Descargar el contenido de la página web utilizando curl
curl -o "$ARCHIVO" "$URL" 2>/dev/null

# Palabra a buscar pasada como parámetro al invocar el script
PALABRA="$1"

# Verificamos que exista la palabra
if grep -q "$PALABRA" "$ARCHIVO"; then
    PRIMERA_LINEA=$(grep -in "$PALABRA" "$ARCHIVO" | head -n 1 | cut -d ':' -f 1)
    echo "La palabra \"$PALABRA\" aparece por primera vez en la línea $PRIMERA_LINEA"
else
    echo "No se ha encontrado la palabra \"$PALABRA\""
fi

# Eliminar el archivo de contenido web después de su uso
rm "$ARCHIVO"

```
### Aqui esta la captura de pantalla.
![
  
](image-7.png)
![Alt text](image-8.png)

