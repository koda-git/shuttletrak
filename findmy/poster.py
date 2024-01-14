import sqlite3
import requests
import json

# Database file path
db_path = './reports.db'

# Flask server URL for the POST request
flask_url = 'http://192.210.243.192:1337/post'

# Connect to the SQLite database
conn = sqlite3.connect(db_path)
cursor = conn.cursor()

# Query the last entry from the database
cursor.execute('SELECT datePublished, id, LONGITUDE, LATITUDE FROM reports ORDER BY timestamp DESC LIMIT 1')
last_entry = cursor.fetchone()

conn.close()

# Check if an entry was found
if last_entry:
    # Unpack the data
    date_published, entry_id, longitude, latitude = last_entry

    # Data to be sent in POST request
    post_data = {
        'datePublished': date_published,
        'id': entry_id,
        'longitude': longitude,
        'latitude': latitude
    }

    # Send the POST request to the Flask server
    response = requests.post(flask_url, json=post_data)

    # Print the response from the server
    print('Server Response:', response.text)
else:
    print('No data found in the database.')
