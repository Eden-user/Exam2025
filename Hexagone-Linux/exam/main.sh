#!/usr/bin/bash
. _setupjeu.sh

main() {
    nb=$(how_m_players)
    echo "Okay, I'll setup the game for $nb players."
    game=$(menu)
    create $game
    joueurs=()
    scores=()
    for ((i = 1; i <= nb; i++)); do
        echo "Creating a new player"
        read -p "First name : " first_name
        echo "You'll be the Player $i"
        joueurs[$i]="$first_name"
        scores[$i]=$game
        echo "${joueurs[$i]} added succesfully."
    done
    count=0
    while [ $count -eq 0 ]; do
        for ((y = 1; y <= nb; y++)); do
            show_scores
            echo "Player $y, your turn !"
            echo "Enter your score : "
            read points
            while [ $points -gt 180 ]; do
                echo "I need a valid number(less than 180), try again."
                echo "Enter your score :"
                read points
            done
            if [ ${scores[$y]} -le 10 ] && [ $points -ne ${scores[$y]} ]; then
                echo "You need to reach exactly 0, try again !"
                continue
            else
                newscore=$((${scores[$y]} - $points))
                scores[$y]=$newscore
                if ((${scores[$y]} < 1)); then
                    echo "Player $y has won !"
                    count=1
                    break
                fi
            fi
            show_scores
        done
    done
}

main

end_game


# N'hésitez pas à décomposer encore plus (tant que ca fait sens)
# Par exemple au lieu de
for ((i = 1; i <= nb; i++)); do
    echo "Creating a new player"
    read -p "First name : " first_name
    echo "You'll be the Player $i"
    joueurs[$i]="$first_name"
    scores[$i]=$game
    echo "${joueurs[$i]} added succesfully."
done


create_player() {
    echo "Creating a new player"
    read -p "First name : " first_name
    echo "You'll be the Player $1"
    joueurs[$1]="$first_name"
    scores[$1]=$game
    echo "${joueurs[$1]} added succesfully."
}

for ((i = 1; i <= nb; i++)); do
    create_player $i
done
