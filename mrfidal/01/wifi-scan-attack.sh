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

clear
echo -e "${white}"
echo " aircrack-ng 1.7"
echo " ================================"
echo
sleep 1

echo -e "Interface\tChipset\t\tDriver"
echo -e "wlan0\t\tAtheros\t\tath9k"
echo
pause
clear

# ------------------ SCAN ------------------
start=$(date +%s)
echo -e "CH  6 ][ Elapsed: 00:12 ][ $(date '+%Y-%m-%d %H:%M')"
echo
echo -e "${yellow} BSSID              PWR  Beacons  #Data  CH  MB   ENC   CIPHER  AUTH  ESSID"
echo -e "${white} ---------------------------------------------------------------------------"
sleep 0.6
echo -e " A4:9B:CD:11:44:01  -41      244      52   1  54e  WPA2  CCMP    PSK   FTTH"
sleep 0.6
echo -e " A4:9B:CD:11:44:02  -53      198      29   6  54e  WPA2  CCMP    PSK   FTTH-4D18"
echo
pause
clear

# ------------------ TARGET ------------------
echo -e "${white}Select target ESSID:"
echo
echo -e "${cyan}[1] FTTH"
echo -e "${cyan}[2] FTTH-4D18"
echo
read -p "Target > " t

if [ "$t" = "1" ]; then
  essid="FTTH"
else
  essid="FTTH-4D18"
fi

clear
echo -e "${white}Waiting for WPA handshake on ${yellow}$essid${white}..."
sleep 2
echo -e "${green}[ WPA handshake captured ]"
sleep 1
pause
clear

# ------------------ AIRCRACK ------------------
echo -e "${white}Opening aircrack-ng..."
sleep 1
echo
echo -e "${white}Reading packets... OK"
echo -e "${white}Using wordlist: rockyou.txt"
echo
pause
clear

echo -e "${white}"
echo " Aircrack-ng 1.7"
echo
echo -e "ESSID\t\t: $essid"
echo -e "Encryption\t: WPA2"
echo -e "Keys tested\t: live"
echo
sleep 1

# ------------------ CRACK LOOP ------------------
keys=0
rate=1342

examples=(
  "password123"
  "ftthwifi2023"
  "homewifi@123"
  "admin@1234"
  "welcome2024"
  "ftth-4d18!"
  "userwifi789"
)

for pass in "${examples[@]}"; do
  keys=$((keys+rate))
  printf "Tried %8d keys | %4d k/s | Current key: %-16s\r" "$keys" "$rate" "$pass"
  sleep 0.8
done

echo
echo
sleep 1
echo -e "${green}KEY FOUND!"
echo -e "${white}[ ${yellow}************ ${white}]"
echo
echo -e "${white}Master Key     : **:**:**:**:**:**:**:**:**:**:**:**:**:**:**:**"
echo -e "${white}Transient Key  : **:**:**:**:**:**:**:**:**:**:**:**:**:**:**:**"
echo
echo -e "${white}Session completed"
echo -e "${reset}"
