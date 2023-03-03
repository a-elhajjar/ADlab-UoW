#!/bin/bash

SCRIPT_PATH=$(readlink -f $(dirname $0))

PS3='AD Lab setup- Make sure you do all if needed: '
options=("UpdateRepository" "Ubuntu" "Arch" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "UpdateRepository")
            echo "You have chosen to update the repositoy"
            sudo sudo add-apt-repository 'deb http://kali.cs.nctu.edu.tw/kali kali-rolling main non-free contrib'
            ;;
        "Option 2")
            echo "you chose Ubuntu"
            ${SCRIPT_PATH}/ubuntu.sh
            ;;
        "Option 3")
            echo "you chose Arch $REPLY which is $opt"
            ${SCRIPT_PATH}/arch.sh
            ;;
        "Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done