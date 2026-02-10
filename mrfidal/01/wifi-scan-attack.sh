#!/bin/bash

# ===== COLORS =====
green="\e[32m"
yellow="\e[33m"
red="\e[31m"
white="\e[97m"
cyan="\e[36m"
reset="\e[0m"

pause() {
  read -p "Press ENTER to continue..."
}

progress() {
  for i in {1..40}; do
    echo -ne "${green}#${reset}"
    sleep 0.06
  done
  echo
}

clear
echo -e "${white}"
echo " aircrack-ng 1.7"
echo " ================================"
echo
sleep 1

echo -e "${white}Interface\tChipset\t\tDriver"
echo -e "wlan0\t\tAtheros\t\tath9k"
echo
pause
clear

# ---- STEP 1 ----
echo -e "${white}CH  6 ][ Elapsed: 00:00 ][ 2026-02-10"
echo
echo -e "${yellow} BSSID              PWR  Beacons  #Data  CH  MB   ENC   CIPHER  AUTH  ESSID"
echo -e "${white} ---------------------------------------------------------------------------"
echo -e " A4:9B:CD:11:44:01  -40      212      34   1  54e  WPA2  CCMP    PSK   FTTH"
echo -e " A4:9B:CD:11:44:02  -53      188      21   6  54e  WPA2  CCMP    PSK   FTTH-4D18"
echo
pause
clear

# ---- STEP 2 ----
echo -e "${white}Select target ESSID:"
echo
echo -e "${cyan}[1] FTTH"
echo -e "${cyan}[2] FTTH-4D18"
echo
read -p "Target > " target

if [ "$target" == "1" ]; then
  essid="FTTH"
elif [ "$target" == "2" ]; then
  essid="FTTH-4D18"
else
  echo -e "${red}Invalid selection"
  exit
fi

clear
echo -e "${white}Monitoring target: ${yellow}$essid"
sleep 1
echo -e "${white}Waiting for authentication packets..."
sleep 2
progress

echo
echo -e "${green}[ WPA handshake captured ]"
pause
clear

# ---- STEP 3 ----
echo -e "${white}Opening aircrack-ng"
echo
sleep 1
echo -e "${white}Reading packets, please wait..."
sleep 2
progress

clear
echo -e "${white}"
echo " Aircrack-ng 1.7"
echo
echo -e "${yellow}ESSID\t\t: $essid"
echo -e "${yellow}Encryption\t: WPA2"
echo -e "${yellow}Wordlist\t: rockyou.txt"
echo
pause
clear

# ---- STEP 4 ----
echo -e "${white}Testing keys..."
echo
for i in {1..10}; do
  printf "Tried %6d keys | Current passphrase: ********\r" $((i*1200))
  sleep 0.5
done

echo
echo
echo -e "${green}KEY FOUND!"
echo -e "${white}[ ${yellow}************ ${white}]"
echo
echo -e "${white}Session completed"
echo -e "${reset}"
