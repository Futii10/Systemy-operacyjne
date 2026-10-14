#!/bin/bash
# Przesuwanie wszystkich plików  z ustawionym  prawem wykonywania  z jednego  katalogu  do 
# drugiego. Pozostałe pliki w katalogu nie powinny być ruszane. Również katalogi nie są 
# przenoszone. Nazwy katalogów, źródłowego i docelowego, zadawane jako parametry skryptu.

katalog_zrodlowy=$1
katalog_docelowy=$2

if [ ! -d "$katalog_zrodlowy" ] || [ ! -d "$katalog_docelowy" ]; then
    echo "podaj katalog źródłowy i docelowy"
    exit 1
fi

for plik in "$katalog_zrodlowy"/*; do
    if [ -f "$plik" ] && [ -x "$plik" ]; then
        mv "$plik" "$katalog_docelowy/"
    fi
done