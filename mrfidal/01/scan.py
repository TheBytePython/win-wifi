from miniwifi import WifiScanner

scanner = WifiScanner()
try:
    networks = scanner.scan_networks()
    print("Available Networks : ")
    for i, ssid in enumerate(networks, 1):
        print(f"{i}. {ssid}")
except Exception as e:
    print(f"Error: {str(e)}")
