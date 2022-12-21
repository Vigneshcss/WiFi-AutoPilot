#!/bin/bash
NONE='\033[00m'   	#${NONE}
RED='\033[01;31m'  	#${RED}
GREEN='\033[01;32m'	#${GREEN}
YELLOW='\033[01;33m'	#${YELLOW}
PURPLE='\033[01;35m'	#${PURPLE}
CYAN='\033[01;36m'	#${CYAN}
WHITE='\033[01;37m'	#${WHITE}
BOLD='\033[1m'		#${BOLD}
UNDERLINE='\033[4m'	#${UNDERLINE}

echo -e "${RED}Welcome to ${UNDERLINE}WiFi-AutoPilot${NONE} ${RED}Tool${NONE}"


banner() {
	
echo -e "${CYAN} __    __ _   ___ _         _         _          ___ _ _       _   "
echo -e "/ / /\ \ (_) / __(_)       /_\ __   _| |_ ___   / _ (_) | ___ | |_ "
echo -e "\ \/  \/ / |/ _\ | |_____ //_\|  | | | __/ _ \ / /_)/ | |/ _ \| __|"
echo -e " \  /\  /| / /   | |_____/  _  \ |_| | || (_) / ___/| | | (_) | |_ "
echo -e "  \/  \/ |_\/    |_|     \_/ \_/\__,_|\__\___/\/    |_|_|\___/ \__| 1.0${NONE}"
echo ""
echo -e "	                                  ${CYAN}Credits:${NONE} ${YELLOW}Vignesh.S${NONE}"   
echo -e "	                                           ${YELLOW}Jayanth.K${NONE}"
}
	{ clear; banner; echo; }

monitor(){
	echo "-----------------------------"
	echo -e "${RED}${BOLD}Monitor mode enabled!${NONE}"
	echo "-----------------------------"
}	
dismonitor(){
	echo "-----------------------------"
	echo -e "${RED}${BOLD}Monitor mode Disabled!${NONE}"
	echo "-----------------------------"
}
menu(){
	echo ""
	echo "====================================================="
	echo -e "${RED}${BOLD}Warning!:${NONE} ${BOLD}This tool is only for educational purpose!${NONE}"
	echo "====================================================="
	echo -e "${CYAN}Options: ${NONE}"
	echo ""
	start= echo -e "${YELLOW}1.WiFi Monitor Modes"
		echo ""
		echo "2.Change WiFi Mac Address" 
		echo ""
		echo "3.Contact US"
		echo ""
		echo "4.More tools"
		echo ""
		echo "5.Exit"
		echo ""
		echo -e "${NONE}-->Use ${CYAN}iwconfig${NONE} command to know your WiFi Adapter ID"
		echo ""
		echo -e "${GREEN}Select any option: ${NONE}"
		select1
}
select1() {
		read options
		clear
		if [[ $options == 1 ]]; then
			echo "============================================================"
			echo ""
			echo -e "${CYAN}WiFi Monitor Modes:${NONE}"
			echo ""
			echo -e "${YELLOW}1.Enable WiFi into Monitor Mode"
			echo ""
			echo -e "${YELLOW}2.Disable WiFi from Monitor Mode${NONE}"
			echo ""
			echo -e "${YELLOW}3.Back to Main menu${NONE}"
			echo ""
			echo "============================================================"
			echo -e "${GREEN}Select any option:${NONE}"
			read options2
			if [[ $options2 == 1 ]]; then
				echo "============================================================"
				echo -e "${RED}Enter your WiFi Adapter ID: (Ex: wlan0)${NONE}"
				read wlan_id
				echo "============================================================"
				clear
				sudo ifconfig $wlan_id down
				echo -e $wlan_id "${PURPLE}Interface down${NONE}"
				sleep 1
				sudo airmon-ng check kill
				sudo iwconfig $wlan_id mode monitor
				sudo ifconfig $wlan_id up
				echo -e $wlan_id "${PURPLE}Interface up${NONE}"
				sleep 1
				echo "============================================================"
				echo -e $wlan_id "${CYAN}--monitor Mode Enabled--${NONE}"
				echo -e "============================================================"
				echo ""
				echo -e "${YELLOW}Press any Key to Go Back${NONE}"
				read back
				if [[ $back == 2 ]]; then
					clear
					banner
					monitor
					menu
				else
					clear
					banner
					monitor
					menu	
				fi
			clear
			elif [[ $options2 == 2 ]]; then
				echo "============================================================"
				echo -e "${RED}Enter your WiFi Adapter ID: (Ex: wlan0)${NONE}" 
				read wlan_id2
				echo "============================================================"
				clear
				sudo ifconfig $wlan_id2 down
				echo -e $wlan_id "${PURPLE}Interface down${NONE}"
				sleep 1
				sudo iwconfig $wlan_id2 mode managed
				sudo ifconfig $wlan_id2 up
				echo -e $wlan_id "${PURPLE}Interface up${NONE}"
				sleep 1
				service NetworkManager restart
				echo "============================================================"
				echo -e "${CYAN}--Monitor Mode Disabled--${NONE}"
				echo "============================================================"
				echo ""
				echo -e "${YELLOW}Press any Key to Go Back${NONE}"
				read back
				if [[ $back == 1 ]]; then
					clear
					banner
					dismonitor
					menu
				else
					clear
					banner
					dismonitor
					menu	
				fi
			elif [[ $options2 == 3 ]]; then
				clear
				banner
				menu
			else
				clear
				banner
				menu
			fi
		clear
		elif [[ $options == 2 ]]; then
			echo "============================================================"
			echo ""
			echo -e "${BOLD}${CYAN}Change WiFi MAC Address:${NONE}"
			echo ""
			echo -e "${YELLOW}1.Change MAC Address to Random"
			echo ""
			echo "2.Change MAC address to a specific address"
			echo ""
			echo "3.Check the current MAC Address"
			echo ""
			echo -e "${YELLOW}4.Reset MAC Address to Default${NONE}"
			echo ""
			echo -e "${YELLOW}5.Back to main menu${NONE}"
			echo ""
			echo "============================================================"
			echo -e "${GREEN}Select any option:${NONE}"
			read opt
			echo "============================================================"
			if [[ $opt == 1 ]]; then
				echo -e "${RED}Enter your WiFi Adapter ID: (Ex: wlan0)${NONE}"
				read wlan_id
				echo "============================================================"
				clear
				sudo ifconfig $wlan_id down
				echo -e $wlan_id "${PURPLE}Interface down${NONE}"
				sleep 1
				echo ""
				sudo macchanger -r $wlan_id
				echo ""
				sudo ifconfig $wlan_id up
				echo -e $wlan_id "${PURPLE}Interface up${NONE}"
				sleep 1
				echo "============================================================"
				echo -e "${CYAN}--MAC Address Changed successfully--${NONE}"
				echo "============================================================"
				echo ""
				echo -e "${YELLOW}Press any Key to Go Back${NONE}"
				read back
				if [[ $back == 1 ]]; then
					clear
					banner
					menu
				else
					clear
					banner
					menu	
				fi
			elif [[ $opt == 2 ]]; then
				echo "============================================================"
				echo -e "${RED}Enter your WiFi Adapter ID: (Ex: wlan0)${NONE}"
				read wlan_id
				echo "============================================================"
				clear
				echo ""
				sudo ifconfig $wlan_id down
				echo -e $wlan_id "${PURPLE}interface down${NONE}"
				sleep 2
				echo "============================================================"
				echo -e "${RED}Enter MAC Address to a Specific address:${NONE}"
				read mac_addr
				echo "============================================================"
				sudo macchanger -m $mac_addr $wlan_id
				echo ""
				sudo ifconfig $wlan_id up
				echo -e $wlan_id "${PURPLE}Interface up${NONE}"
				sleep 2
				echo "============================================================"
				echo -e "${CYAN}--MAC Address Changed succesfully--${NONE}"
				echo "============================================================"
				echo ""
				echo -e "${YELLOW}Press any Key to Go Back${NONE}"
				read back
				if [[ $back == 1 ]]; then
					clear
					banner
					menu
				else
					clear
					banner
					menu	
				fi
			elif [[ $opt == 3 ]]; then
				echo "============================================================"
				echo -e "${RED}Enter your WiFi Adapter ID: (Ex: wlan0)${NONE}"
				read wlan_id
				echo "============================================================"
				clear
				macchanger -s $wlan_id
				echo "============================================================"
				echo -e "${CYAN}Current MAC Address:${NONE}"
				echo "============================================================"
				echo ""
				echo -e "${YELLOW}Press any Key to Go Back${NONE}"
				read back
				if [[ $back == 1 ]]; then
					clear
					banner
					menu
				else
					clear
					banner
					menu	
				fi
			elif [[ $opt == 4 ]]; then
				echo "============================================================"
				echo -e "${RED}Enter your WiFi Adapter ID: (Ex: wlan0)${NONE}"
				read wlan_id
				echo "============================================================"
				clear
				sudo ifconfig $wlan_id down
				echo -e $wlan_id "${PURPLE}Interface down${NONE}"
				sleep 2
				echo ""
				sudo macchanger -p $wlan_id
				sudo ifconfig $wlan_id up
				echo ""
				echo -e $wlan_id "${PURPLE}Interface up${NONE}"
				sleep 2
				echo "============================================================"
				echo -e "${CYAN} --MAC Address reseted to Deafult--${NONE}"
				echo "============================================================"
				echo ""
				echo -e "${YELLOW}Press any Key to Go Back${NONE}"
				read back
				if [[ $back == 1 ]]; then
					clear
					banner
					menu
				else
					clear
					banner
					menu	
				fi
			elif [[ $opt == 5 ]]; then
				clear
				banner
				menu
			else
				clear
				banner
				menu
			fi	
	elif [[ $options == 3 ]]; then
		echo "============================================================"
		echo -e "${YELLOW} Author    ${RED}:  ${CYAN}Vignesh.S"
		echo -e "${YELLOW} Author    ${RED}:  ${CYAN}Jayanth.K"
		echo -e "${YELLOW} Github    ${RED}:  ${CYAN}https://github.com/..."
		echo -e "${YELLOW} instagram ${RED}:  ${CYAN}https://instagram.com/vigneshcss?igshid=N2ZiY2E3YmU=${NONE}"
		echo "============================================================"
		echo -e "${RED}Warning:${NONE}"
		echo -e "${CYAN}This Tool is made for educational purpose only!"
		echo -e "${CYAN}Author will not be responsible for any misuse of this toolkit!${NONE}"
		echo -e "============================================================"
		echo -e "${YELLOW}Thank you for using this tool. Have a good day!${NONE}"
		echo -e "============================================================"
	elif [[ $options == 5 ]]; then
		sleep 0.5
		echo -e "${CYAN}--------------------------------------------------------------------------------------${GREEN}Thanks for comming${NONE}${CYAN}---------------------------------------------------------------------------------------------${NONE}"
		sleep 1
		clear
	elif [[ $options == 4 ]]; then
		echo -e "============================================================"
		echo -e "${PURPLE}--${RED}Will be updated soon!${NONE}${PURPLE}--${NONE}"
		echo -e "============================================================"
		sleep 4
		clear
		banner
		menu
	
	else
		echo -e "${RED}Oh NO!${NONE}"
		sleep 1
		clear
		banner
		menu
	fi
}
menu

