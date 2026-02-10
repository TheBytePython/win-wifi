#!/bin/bash

# ===== COLORS =====
green="\e[32m"
yellow="\e[33m"
red="\e[31m"
blue="\e[34m"
white="\e[97m"
cyan="\e[36m"
reset="\e[0m"

progress() {
  for i in {1..30}; do
    echo -ne "${green}█${reset}"
    sleep 0.05
  done
  echo
}

clear
echo -e "${cyan}"
echo "================================================"
echo "              Wireless Control Panel            "
echo "================================================"
echo -e "${reset}"

echo
echo -e "${white}[1] Scan Wi-Fi Networks"
echo -e "${white}[2] Target Information"
echo -e "${white}[3] Monitor Activity"
echo -e "${white}[4] Password Analysis"
echo -e "${white}[0] Exit"
echo
read -p "Select option: " opt

case $opt in

1)
  echo
  echo -e "${white} [${green}++${white}] Scanning wifi signals"
  sleep 1
  progress
  echo
  echo -e "${yellow} BSSID              CH   SIGNAL   SECURITY    ESSID"
  echo " -----------------------------------------------------"
  echo -e " A4:9B:CD:11:44:01   1   -40 dBm   WPA2        FTTH"
  echo -e " A4:9B:CD:11:44:02   6   -53 dBm   WPA2        FTTH-4D18"
  ;;

2)
  echo
  echo -e "${cyan}Target profile loaded"
  echo
  echo -e "${white}ESSID       : ${yellow}FTTH-4D18"
  echo -e "${white}Channel     : 6"
  echo -e "${white}Encryption  : WPA2-PSK"
  echo -e "${white}Signal      : -53 dBm"
  echo -e "${white}Clients     : 1"
  ;;

3)
  echo
  echo -e "${white} [${green}++${white}] Monitoring target: ${yellow}FTTH-4D18"
  sleep 1
  echo -e "${white} [${green}++${white}] Listening for activity"
  sleep 1
  progress
  echo
  echo -e "${green}[OK] Client detected: 9C:AF:CA:11:23:88"
  echo -e "${green}[OK] Session data logged"
  ;;

4)
  echo
  echo -e "${white} [${green}++${white}] Initializing password analysis"
  sleep 1
  echo -e "${white} [${green}++${white}] Loading wordlist"
  sleep 1
  progress

  echo
  echo -e "${white} [${green}++${white}] Testing combinations"
  sleep 2
  echo -e "${yellow}Attempts: 14,238"
  sleep 2
  echo -e "${yellow}Attempts: 29,901"
  sleep 2

  echo
  echo -e "${white} [${green}OK${white}] Match detected"
  sleep 1
  echo
  echo -e "${green}Last found password:"
  echo -e "${yellow}****************"
  ;;

0)
  echo -e "${red}Exiting..."
  exit
  ;;

*)
  echo -e "${red}Invalid option"
  ;;
esac

echo
echo -e "${white}Session closed${reset}"
