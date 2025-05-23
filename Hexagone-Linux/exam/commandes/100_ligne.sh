#!/usr/bin/bash

for ((i=0; i<100; i++));
do echo "Ligne $i"
done

# On peut également faire echo Ligne {1..100} -> affichera Ligne 1 Ligne 2 Ligne 3 etc sans sauter de lignes
# Si on veut sauter une ligne à chaque echo (comme si on utilisait echo en boucle), on peut ajouter un "\n" :

# "Ligne {1..100}\n" ne fonctionnera pas, il faudra formater la chaine de charactères et donc utiliser printf
# printf "Ligne %d\n" {1..100}

# Comme pour les remarques précédentes cela dépendra du contexte... Faites ce qui vous semble le plus approprié et lisible
