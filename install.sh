#!/bin/bash
RED="31"
GREEN="32"
BOLDGREEN="\e[1;${GREEN}m"
BOLDRED="\e[1;${RED}m"
ENDCOLOR="\e[0m"
SCRIPT_PATH=$(readlink -f $(dirname $0))
neofetch
PS3=' To exit type --12-- '
options=("UpdateRepository" "impacket" "Crackmapexec" "kerbrute" "PKINITtools" "mitm6" "BloodHound" "Setup dictionaries"  "CertiPy" "Fix" "All" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "UpdateRepository")
	echo -e "${BOLDGREEN}You have chosen to update the repositoy${ENDCOLOR}"
	cd ~/Desktop/ADlab-uow/
	more sources.list
	echo "deb http://kali.cs.nctu.edu.tw/kali kali-rolling main non-free contrib" >>  sources.list
	cd /etc/apt/
	sudo cp sources.list sources.list.bkp
	sudo cp ~/Desktop/ADlab-uow/sources.list sources.list
	sudo apt-get update
	sudo apt-get install neofetch
	cp ~/Desktop/ADlab-uow/neofetch/config.conf /home/kali/.config/neofetch/config.conf

        ;;
        "impacket")
       	echo -e "${BOLDGREEN}You have chosen to install impacket${ENDCOLOR}"
        python3 -m pip install impacket

        ;;
     
        "Crackmapexec")
	echo -e "${BOLDGREEN}You have chosen to install Crackmapexec${ENDCOLOR}"
	sudo apt-get install crackmapexec

        ;;
           "kerbrute")
        echo -e "${BOLDGREEN}You have chosen to install kerbrute${ENDCOLOR}"
        cd ~/Desktop/arsenal-uow
	wget https://github.com/ropnop/kerbrute/releases/download/v1.0.3/kerbrute_linux_amd64
	chmod +x kerbrute_linux_amd64

   	;;
         "PKINITtools")
        echo -e "${BOLDGREEN}You have chosen to install PKINITtools${ENDCOLOR}"
        cd ~/Desktop/
        git clone https://github.com/dirkjanm/PKINITtools
	python3 -m pip install minikerberos 

      	        ;;
        
        
        "mitm6")
	echo -e "${BOLDGREEN}you have chosen to install mimt6${ENDCOLOR}"
	cd ~/Desktop
	git clone https://github.com/dirkjanm/mitm6.git
	cd mitm6
	pip install -r requirements.txt
	cd ~/Desktop

	;;
	 "BloodHound")
	echo -e "${BOLDGREEN}you have chosen to install BloodHound${ENDCOLOR}"
	echo -e "${BOLDRED} THIS WILL possibly BREAK YOUR KALI- Make sure you save your work. ${ENDCOLOR}"
	sudo apt-get install bloodhound --fix-missing 
	echo "You will need to start neo4j before you start BloodHound"
	echo "you can start it by typing sudo neo4j start"
	echo "You will need to create a password the first time you use it."
	echo "Make sure you use the correct port on the browser"
	sudo neo4j start

	;;
	
	 "Setup dictionaries")
	echo -e "${BOLDGREEN}you have chosen to setup your dictionaries${ENDCOLOR}"
	cd ~/Desktop/arsenal-uow
	touch userlist.txt
	touch passlist.txt
	cd ~/Desktop

	;;
	 "CertiPy")
	echo -e "${BOLDGREEN}You have chosen to install CertiPy.${ENDCOLOR}"
	cd ~/Desktop
	sudo apt install python3-certipy
	cd ~/Desktop
      	echo "To exit type: 12"
	;;

	 "Fix")
	echo -e "${BOLDGREEN}You have installed Bloodhound. Time to fix Arsenal after installing BloodHound${ENDCOLOR}"
	cd ~/Desktop
	cd arsenal-uow
	sudo apt-get install python3-libtmux  python3-pyyaml-env-tag python3-pyperclip python3-docutils
	cd ~/Desktop

	;;

"All")
	echo -e "${BOLDGREEN} You have chosen to setup all enviroment- This will not install Bloodhound${ENDCOLOR}"
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
	cd ~/Desktop/
        		git clone https://github.com/dirkjanm/PKINITtools
python3 -m pip install minikerberos 
        python3 -m pip install impacket
                cd ~/Desktop/arsenal-uow
	wget https://github.com/ropnop/kerbrute/releases/download/v1.0.3/kerbrute_linux_amd64
	chmod +x kerbrute_linux_amd64

	;;        "Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
        
    esac
done

