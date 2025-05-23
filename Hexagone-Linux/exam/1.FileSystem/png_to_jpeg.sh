#!/bin/bash

for file in $input.png
do
	rename 's/.png/.jpeg/' *
done

# Ici on peut utiliser mv : 
for file in *.png
do
    mv "$file" "${file%.png}.jpeg"
done

# Ce n'est pas forcément mieux mais évite d'installer rename (d'une manière générale, faites ce qui vous semble le plus adapté)
