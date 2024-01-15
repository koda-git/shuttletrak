# ShuttleTrak (Project for Deltahacks X)

A shuttle bus tracking app using Apple's FindMy Network to allow tracking without a constant data or GPS data
Keep track of McMaster's Shuttle Bus Terminals, Find live locations of Buses, and estimate arrival time.

## Inspiration
Building a tool that saves students' time waiting for the campus shuttle buses

## What it does
Provides an interactive map that lets you access the real-time location of your shuttle bus and all the on-campus parking information you need. Simply click on any parking lot to see its daily price and handicapp services availability, and easily search up their locations. See your shuttle bus in real time on the map and get a time estimate of when it will arrive.
## How we built it
Flutter was used for the front end, ensuring compatability with every platform. The real time location capabilities were made possible with Bluetooth Low Energy on a Raspberry Pi. Python was used for parsing data.
## Challenges we ran into

Frontend was tough to integrate with the json data of the live coordinates and timestamps

## Accomplishments that we're proud of
We are proud of the use of Bluetooth Low Energy 

## What we learned

Ways to integrate google maps API,
Flutter and Flask Webservers,
Secure POST and GET requests
Data decryption with AES256 keys

## What's next for ShuttleTrak

Grab and parse data for Bus arrivals and Departs 
and track estimated times and trip times.
