# ShuttleTrak (Project for Deltahacks X)
Hackathon project for Deltahacks X (36 hours)

A shuttle bus tracking app using Apple's FindMy Network to allow tracking without a constant data or GPS data
Keep track of McMaster's Shuttle Bus Terminals, Find live locations of Buses, and estimate arrival time.

## How does it work
With the hard work of https://github.com/seemoo-lab/openhaystack/, 
We use microcontrollers to track live location data as they send them to nearby iPhones and then Apple's FindMy location servers

## FrontEnd Information
Provides an interactive map that lets you access the real-time location of your shuttle bus and all the on-campus parking information you need. Simply click on any parking lot to see its daily price and handicapp services availability, and easily search up their locations. See your shuttle bus in real time on the map and get a time estimate of when it will arrive.

## Simple Documentation 
 - Frontend: Flutter
 - API used: Apple_Anisette, Openhaystack, Google Maps
 - Backend: Python, Flask
 - Hardware used:
   - Server: aarch64 or x86_64 system compatible with python3.11 to act as the webserver + parser
   - Tracker: Raspberry Pi4 2GB with Raspbian 10 to act as the BLE device to ping nearby Apple Devices for information

## Deployment
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


## TODO
Grab and parse data for Bus arrivals and Departs 
and track estimated times and trip times.
