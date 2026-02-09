from miniwifi import WifiCracker
import sys

def main(ssid, wordlist_path):
    cracker = WifiCracker()
    try:
        result = cracker.crack(ssid, wordlist_path)
        if result['success']:
            print(f"\nPassword found : {result['password']}")
            print(f"Attempts : {result['attempt']} | Time : {result['elapsed']:.2f}s")
        else:
            print("\nPassword not found")
            print(f"Total attempts : {result['attempt']} | Time : {result['elapsed']:.2f}s")
    except Exception as e:
        print(f"\nError: {str(e)}")

if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("Usage : python attack.py <SSID> <WORDLIST_PATH>")
        sys.exit(1)
    main(sys.argv[1], sys.argv[2])
