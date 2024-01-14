import requests
import json
import ast
import time
import re

def parse_received_data(received_data):
    try:
        # Use regular expressions to extract the dictionary part
        match = re.search(r"\{.*\}", received_data)
        if match:
            dictionary_part = match.group(0)
            # Parse the dictionary string into a Python dictionary using ast.literal_eval
            data_dict = ast.literal_eval(dictionary_part)
            return data_dict
        else:
            print("No dictionary found in the received data.")
            return None
    except Exception as e:
        print("Error parsing received data:", e)
        return None

def fetch_and_store_data():
    try:
        
        response = requests.get('YOUR_API_ENDPOINT')
        
        # Check if the request was successful (status code 200)
        if response.status_code == 200:
            # Parse the received data string
            received_data_str = response.text
            data_dict = parse_received_data(received_data_str)
        
        # Check if parsing was successful
        if data_dict is not None:
            #print("Parsed data:", data_dict)
            return data_dict
                    
    except Exception as e:
        print("Error:", e)

def main():
    while True:
        # Fetch and store data
        fetch_and_store_data()
        
        parsed = fetch_and_store_data(input)
        
        for key in parsed:
            print(key, parsed[key])
        # Wait for 30 seconds before making the next fetch request
        time.sleep(30)
    input = "Received data: {'datePublished': 1705195638316, 'id': 'ppqCpzp14Agk8Haqy+EDBwdmGDlrJYepJGeCfGk7oW4=', 'longitude': 43.2657083, 'latitude': -79.9177732}"
    

if __name__ == "__main__":
    main()
