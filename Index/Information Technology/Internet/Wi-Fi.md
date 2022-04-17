- **Links**
	- [Wi-Fi Fundamentals | Apple Developer Forums](https://developer.apple.com/forums/thread/45283)

**IEEE 802.11** - defines wi-fi standard

There're a few sub standard (newest one is **802.11ac** which introduces ability to have a gigabyte speed connection)

Wi-Fi is usually connected to **modem** which translates analog signals to digital signals from **optical fiber** or **telephone line (ADSL)**.

Modem can be integrated into router 

Роутер == Маршрутизатор 

## Security

**WPA2 Personal (AES) ≥** is minimum acceptable encryption mode

## Configuration types

- **DHCP (Dynamic Host Configuration Protocol)**
    
    Default for typical TCP connected device
    
    Is used to dynamically get host IP address (+ network mask, DNS server address) from server
    
- **PPPoE (Point-to-point protocol over Ethernet)**
    
    Another protocol to get host IP address. Host is sending to special PPPoE server a MAC address in Ethernet frame with  `PPPoE Active Discovery Initiation` type
    
- **Static IP**