#!/bin/bash

check_password_strength() {
    local password="$1"
    local score=0

    if [[ ${#password} -ge 8 ]]; then
        ((score+=2))
    fi

    if [[ "$password" =~ [A-Z] ]]; then
        ((score+=2))
    fi


    if [[ "$password" =~ [a-z] ]]; then
        ((score+=2))
    fi


    if [[ "$password" =~ [0-9] ]]; then
        ((score+=2))
    fi

    if [[$(echo "$password" | grep -o'[^a-zA-Z0-9]' | wc -l) -ge 2]]; then
        ((score+=2))
    fi


    case $score in
        0)  echo "Very Weak (Score: 0/10)" ;;
        2)  echo "Weak (Score: 2/10)" ;;
        4)  echo "Fair (Score: 4/10)" ;;
        6)  echo "Strong (Score: 6/10)" ;;
        8)  echo "Strong (Score: 8/10)" ;;
        10) echo "Excellent (Score: 10/10)" ;;
        *)  echo "Unknown strength" ;;
    esac
}


read -sp "Enter a password to check its strength: " password
echo


check_password_strength "$password"
