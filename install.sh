#!/bin/bash

SCRIPT_PATH=$(readlink -f $(dirname $0))

PS3='AD Lab setup- Make sure you do all if needed: '
options=("UpdateRepository" "Crackmapexec" "mitm6" "BloodHound" "Setup dictionaries" "All" "Quit")
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
	echo "you have chosen to install mimt6"
	cd ~/home/kali/Desktop
	git clone https://github.com/dirkjanm/mitm6.git
	cd mitm6
	pip install -r requirements.txt
		cd ~/Desktop	
	;;
	 "BloodHound")
	echo "you have chosen to install BloodHound"
	sudo apt-get install bloodhound --fix-missing 
	echo "You will need to start neo4j before you start BloodHound"
	echo "you can start it by typing sudo neo4j start"
	echo "You will need to create a password the first time you use it."
	echo "Make sure you use the correct port on the browser"
	sudo neo4j start
	;;
	
	 "Setup dictionaries")
	echo "you have chosen to setup your dictionaries"
	echo "We are setting up two dictinonaries at the moment"
	echo "One for users and the other for passwords"
	echo "You will need to create a password the first time you use it."
	echo "Make sure you use the correct port on the browser"
	sudo neo4j start
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
	sudo apt-get install bloodhound --fix-missing 
	sudo neo4j start
;;


        "Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done

