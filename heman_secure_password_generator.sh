#!/bin/bash


generate_password() {
    local length=$1

    local chars="A-Za-z0-9!@#$%^&*()_+-=[]{}|:;<>,.?/"

    local password=$(cat /dev/urandom | tr -dc "$chars" | head -c "$length")
    echo "$password"
}


while true; do

    read -p "Enter the desired password length (12-32): " password_length


    if [[ "$password_length" =~ ^[0-9]+$ ]] && [ "$password_length" -ge 12 ] && [ "$password_length" -le 32 ]; then
        break
    else
        echo "Invalid input. Please enter a number between 12 and 32."
    fi
done


password=$(generate_password "$password_length")


echo "Generated Password: $password"
echo "Password Length: $password_length"
