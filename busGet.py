from flask import Flask, jsonify
import requests
import json
from dotenv import dotenv_values

# Load environment variables
config = dotenv_values('./.env')

app = Flask(__name__)

def parse_received_data(received_data):
    try:
        data_dict = json.loads(received_data)
        return data_dict
    except json.JSONDecodeError as e:
        print("Error parsing received data:", e)
        return None

def fetch_and_store_data():
    try:
        response = requests.get(config['GET_URL'])
        if response.status_code == 200:
            received_data_str = response.text
            data_dict = parse_received_data(received_data_str)
            if data_dict is not None:
                return data_dict
    except Exception as e:
        print("Error:", e)
        return None
    
def schedule_fetch_and_store_data():
    scheduler = BackgroundScheduler()
    scheduler.add_job(func=fetch_and_store_data, trigger="interval", seconds=30)
    scheduler.start()

@app.route('/fetch_data', methods=['GET'])
def fetch_data_route():
    data = fetch_and_store_data()
    if data:
        return jsonify(data)
    else:
        return jsonify({"error": "Failed to fetch data"}), 500

if __name__ == "__main__":
    schedule_fetch_and_store_data()
    app.run(debug=True)