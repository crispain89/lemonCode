#!/bin/bash

# Crear la carpeta "foo" si no existe
if [ ! -d "foo" ]; then
    mkdir foo
fi

# Crear las carpetas "empty" y "dummy" dentro de "foo"
mkdir foo/empty foo/dummy

# Crear el archivo "file1.txt" en "dummy" con el contenido "Me encanta bash"
echo "Me encanta bash" > foo/dummy/file1.txt

# Crear el archivo "file2.txt" en "dummy" como un archivo vacío
touch foo/dummy/file2.txt

# Copiar el contenido de "file1.txt" a "file2.txt"
cp foo/dummy/file1.txt foo/dummy/file2.txt

# Mover la carpeta "dummy" dentro de la carpeta "empty"
mv foo/dummy/file2.txt foo/empty/file2.txt

echo "Operaciones completadas."

