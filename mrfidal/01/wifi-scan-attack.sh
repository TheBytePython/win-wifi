#!/usr/bin/env bash

# ================= COLORS =================
GREEN="\033[32m"
YELLOW="\033[33m"
RED="\033[31m"
WHITE="\033[97m"
CYAN="\033[36m"
RESET="\033[0m"

pause() {
  echo
  read -rp "Press ENTER to continue..."
}

clear
echo -e "${WHITE}"
echo " aircrack-ng 1.7 (simulation)"
echo " ================================"
echo
sleep 1

echo -e "Interface\tChipset\t\tDriver"
echo -e "wlan0\t\tAtheros AR9271\tath9k_htc"
pause
clear

# ------------------ SCAN ------------------
echo -e "CH  6 ][ Elapsed: 00:18 ][ $(date '+%Y-%m-%d %H:%M')"
echo
echo -e "${YELLOW} BSSID              PWR  Beacons  #Data  CH  MB   ENC   CIPHER  AUTH  ESSID"
echo -e "${WHITE} ---------------------------------------------------------------------------"
sleep 0.6
echo -e " A4:9B:CD:11:44:01  -39      312     148   1  54e  WPA2  CCMP    PSK   FTTH"
sleep 0.6
echo -e " A4:9B:CD:11:44:02  -55      271      93   6  54e  WPA2  CCMP    PSK   FTTH-4D18"

pause
clear

# ------------------ TARGET ------------------
echo -e "${WHITE}Select target ESSID:"
echo
echo -e "${CYAN}[1] FTTH"
echo -e "${CYAN}[2] FTTH-4D18"
echo
read -rp "Target > " t

case "$t" in
  1) essid="FTTH" ;;
  2) essid="FTTH-4D18" ;;
  *) echo -e "${RED}Invalid selection${RESET}"; exit 1 ;;
esac

clear
echo -e "${WHITE}Waiting for WPA handshake on ${YELLOW}$essid${WHITE}..."
sleep 2
echo -e "${GREEN}[ WPA handshake captured ]"
pause
clear

# ------------------ AIRCRACK ------------------
echo -e "${WHITE}Opening aircrack-ng..."
sleep 1
echo
echo -e "Reading packets... OK"
echo -e "WPA handshake: A4:9B:CD:11:44:XX"
echo -e "Using wordlist: rockyou.txt"
pause
clear

echo -e "${WHITE}"
echo " Aircrack-ng 1.7"
echo
echo -e "ESSID           : $essid"
echo -e "Encryption      : WPA2"
echo -e "Dictionary size : 14,344,391"
echo
sleep 1

# ------------------ CRACK LOOP ------------------
keys=0
rate=$((RANDOM % 800 + 900))

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
  keys=$((keys + rate))
  printf "Tried %9d keys | %4d k/s | Current key: %-18s\r" "$keys" "$rate" "$pass"
  sleep 0.9
done

echo
echo
sleep 1

echo -e "${RED}Passphrase not in dictionary.${RESET}"
echo -e "${WHITE}Session completed."
echo -e "${RESET}"
