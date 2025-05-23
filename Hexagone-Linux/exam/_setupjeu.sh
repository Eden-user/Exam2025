#!/usr/bin/bash
DB_FILE="players.txt"
SEP=";"

menu() {
	read -p "Select one of the following options : 501 double out (501) ou 301 double out (301) or exit this menu (Q) : " game_choice
	case $game_choice in
	501)
		value="501"
		echo $value
		;;
	301)
		valeur="301"
		echo $valeur
		;;
	Q)
		echo "Goodbye" && exit 0
		;;
	*)
		echo "The choices are 501, 301 or Q to exit"
		;;
	esac
}

how_m_players() {
	read -p "How many players ? " nb_players
	echo $nb_players
}

get_next_id() {
	next_id=$(awk -F ";" '{print $1}' "$DB_FILE" | sort -n | tail -1)
	next_id=$((next_id + 1))
	echo $next_id
}

create() {
	echo $1

}

show_scores() {
	for ((i = 1; i <= nb; i++)); do
		echo "${joueurs[$i]} = ${scores[$i]}"
	done
}
end_game() {
	>players.txt
}


# Top, je n'ai pas vérifié le fonctionnement mais la décomposition en fonctions les plus simples possibles et bien nommées font que le tout est simple à comprendre
