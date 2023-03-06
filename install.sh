#!/bin/bash

SCRIPT_PATH=$(readlink -f $(dirname $0))

PS3='AD Lab setup- Make sure you do all if needed: '
options=("UpdateRepository" "Crackmapexec" "mitm6" "All" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "UpdateRepository")
	echo "You have chosen to update the repositoy"
	sudo sudo add-apt-repository 'deb http://kali.cs.nctu.edu.tw/kali kali-rolling main non-free contrib'
	sudo apt-get update
        ;;
        "Crackmapexec")
	echo "You have chosen to install Crackmapexec"
	sudo apt-get install crackmapexec
	echo "To exit type: "
        ;;
        "mitm6")
	echo "you chosen to install mimt6"
	cd ~/home/kali/Desktop
	git clone https://github.com/dirkjanm/mitm6.git
	cd mitm6
	pip install -r requirements.txt
	cd ~/Desktop	
	echo "To exit type: "
	;;


















"All")
	echo "You have chosen to setup all enviroment"
	sudo sudo add-apt-repository 'deb http://kali.cs.nctu.edu.tw/kali kali-rolling main non-free contrib'
	sudo apt-get update
        sudo apt-get install crackmapexec
	cd /home/kali/Desktop
        git clone https://github.com/dirkjanm/mitm6.git
        cd mitm6
        pip install -r requirements.txt
	cd ~/Desktop
;;


        "Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done

