#!/bin/bash

SCRIPT_PATH=$(readlink -f $(dirname $0))

PS3='AD Lab setup- Make sure you do all if needed: '
options=("UpdateRepository" "impacket" "Crackmapexec" "kerbrute" "mitm6" "BloodHound" "Setup dictionaries"  "CertiPy" "Fix" "All" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "UpdateRepository")
	echo "You have chosen to update the repositoy"
	sudo sudo add-apt-repository 'deb http://kali.cs.nctu.edu.tw/kali kali-rolling main non-free contrib'
	sudo apt-get update
        ;;
        "impacket")
        	echo "You have chosen to install impacket"
        python3 -m pip install impacket
        ;;
     
        "Crackmapexec")
	echo "You have chosen to install Crackmapexec"
	sudo apt-get install crackmapexec
	echo "To exit type: "
        ;;
           "kerbrute")
        	echo "You have chosen to install kerbrute"
        		cd ~/Desktop/arsenal-uow
wget https://github.com/ropnop/kerbrute/releases/download/v1.0.3/kerbrute_linux_amd64
chmod +x kerbrute_linux_amd64
        ;;
        
        
        "mitm6")
	echo "you have chosen to install mimt6"
	cd ~/Desktop
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
	cd ~/Desktop/arsenal-uow
	touch userlist.txt
	touch passlist.txt
	cd ~/Desktop
	;;
	 "CertiPy")
	echo "You have chosen to install CertiPy."
	cd ~/Desktop
	sudo apt install python3-certipy
	cd ~/Desktop
	;;

	 "Fix")
	echo "You have installed Bloodhound. Time to fix Arsenal after installing BloodHound"
	cd ~/Desktop
	cd arsenal-uow
	sudo apt-get install python3-libtmux  python3-pyyaml-env-tag python3-pyperclip python3-docutils
	cd ~/Desktop
	;;

"All")
	echo "You have chosen to setup all enviroment- This will not install Bloodhound"
	sudo sudo add-apt-repository 'deb http://kali.cs.nctu.edu.tw/kali kali-rolling main non-free contrib'
	sudo apt-get update
        sudo apt-get install crackmapexec
	cd /home/kali/Desktop
        git clone https://github.com/dirkjanm/mitm6.git
        cd mitm6
        pip install -r requirements.txt
	cd ~/Desktop/arsenal-uow
	touch userlist.txt
	touch passlist.txt
	cd ~/Desktop
	sudo apt install python3-certipy
	;;        "Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
        
    esac
done

