#!/bin/bash

# Tworzenie  nowych  plików  w  zadanym katalogu (parametr  wywołania skryptu), według listy 
# umieszczonej w pliku (drugi parametr wywołania skryptu). Nowe pliki mają być zerowej wielkości  
# (puste)  i bez prawa zapisu. Jeżeli jakiś plik już istnieje, to nie  powinien zostać nadpisany

katalog=$1
lista=$2

if [ ! -d "$katalog" ] || [ ! -f "$lista" ]; then
    echo "podaj katalog i plik z listą"
    exit 1
fi

while read nazwa
do
    if [ -n "$nazwa" ] && [ ! -e "$katalog/$nazwa" ]; then
        touch "$katalog/$nazwa"
        chmod a-w "$katalog/$nazwa"
    fi
done < "$lista"