from flask import Flask, request, jsonify

app = Flask(__name__)

# Global variable to store data
data_store = {}

@app.route('/post', methods=['POST'])
def handle_post():
    data = request.json
    print("Received data:", data)

    # Store the data in the global variable
    global data_store
    data_store['last_post'] = data

    return jsonify({"message": "Data received successfully"}), 200

@app.route('/getdata', methods=['GET'])
def handle_get():
    # Return the last stored data
    return jsonify(data_store.get('last_post', {})), 200

if __name__ == "__main__":
    app.run(debug=True, host='0.0.0.0', port=1337)
