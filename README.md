# Shuttletrak — BLE-Powered Shuttle Tracker

A cross-platform shuttle bus tracking app using Apple's FindMy Network to allow tracking without a constant data or GPS connection. Keep track of our university's Shuttle Bus Terminals, find live locations of buses, and estimate arrival times.

> 🗓️ Hackathon: DeltaHacks X (Jan 2024)  
> 🛠️ Stack: Flutter, Python, BLE, iOS/Android/Web

## ❔ How does it work?
We use a Linux-based microcontroller like the **ESP32 or Raspberry Pi Zero series** to emit a constant BLE signal with a **public key**, spoofing itself as an **iDevice**. This makes the microcontroller a part of Apple's FindMy network. We then parse the location data sent via other iDevices and upload our microcontroller's relative location by fetching the coordinate data of a nearby iDevice every **30 seconds** from Apple's servers. We do this by creating an anisette server that authorizes our **fetcher** webserver using the **private key** paired to the **public key** that is sent to Apple's FindMy servers. Lastly, we organize this data and **POST** to our Flask web application, and our frontend application is responsible for sending a **GET** request for the coordinates/unixtime and visualizing it on **Google Maps**.

![](./images/diagram.png)

- Benefits of this tracking method:
  - Extremely low power usage on the microcontroller as it uses Bluetooth Low Energy.
  - No need for a cellular signal or plan; it only needs nearby **Apple devices** to ping it.
  - Works anywhere in the world where there is or was an Apple device nearby.

## 🌐 Features

### ✅ BLE Shuttle Detection
- Detects shuttles by identifying passive BLE broadcasts
- No GPS modules or SIM cards needed
- Built on reverse-engineering Apple's FindMy device network

### ✅ Real-Time Location Mapping
- Updates shuttle location in real time
- Map visualization on mobile and web

### ✅ Privacy-Aware Architecture
- No personal device tracking
- Signals are anonymous and cannot be traced to individuals

### ✅ Multi-Platform App
- Deployed to Web, Android, and iOS via Flutter
- Python backend to process beacon data

---

## 🧰 Tech Stack

| Layer       | Technology            |
|-------------|------------------------|
| Frontend    | Flutter (Dart)         |
| Backend     | Python (custom server) |
| BLE Parsing | FindMy BLE (reverse-engineered) |
| Platforms   | Android, iOS, Web      |
| Data Fetch  | `busGet.py`            |
| Tracker Hw. | Raspberry Pi4, ESP32  |

---


## Frontend Information
Provides an interactive map that lets you access the real-time location of your shuttle bus and all the on-campus parking information you need. Simply click on any parking lot to see its daily price and handicap services availability, and easily search up their locations. See your shuttle bus in real-time on the map and get a time estimate of when it will arrive.

![](./images/scr1.jpeg)
▲ Map of university with its bus stations, and the red marker (placeholder) indicating the current coordinate of the microcontroller

![](./images/scr2.png)
▲ Additional information useful for students



## ⚙️ Deployment Instructions
 - Add your Google Maps API key at ./shuttletrak/web/index.html @ line 36
 - Run Dart Webserver from Root
 - Create a .env file for the webserver
   - ```
        SERVER_URL="http://{ServerIP}/post"
        GET_URL="http://{ServerIP}/getdata"
     ```
 - Run ./webserver.py for the server for GET and POST requests
 - Start the Anisette server by running ```docker run -d --restart always --name anisette-v3 -p 6969:6969 dadoum/anisette-v3-server:latest```
 - cd into the FindMy directory
   - Create the starting database by running ```sqlite3 reports.db 'CREATE TABLE reports (id_short TEXT, timestamp INTEGER, datePublished INTEGER, payload TEXT, id TEXT, statusCode INTEGER, LONGITUDE REAL, LATITUDE REAL,PRIMARY KEY(id_short,timestamp), )'```
 - Generate keys by running ```python3 /generatekeys.py``` inside the FindMy directory
 - Follow Openhaystack for deployment on the tracker device
 - Run the ```python3 runFetcher.py``` in the same directory as the .keys files

## 🤝 Team & Credits

Built with ❤️ during DeltaHacks X by McMaster University students (2024).  
https://github.com/christianzhou1\
https://github.com/ericpark11\
https://github.com/koda-git\

FindMy BLE work adapted from community reverse-engineering efforts.

---

## 📝 License

AGPL3 © [koda-git](https://github.com/koda-git)
