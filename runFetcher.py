import subprocess
import time
import os

# Define the paths for the scripts
current_directory = os.path.dirname(os.path.realpath(__file__))
request_reports_path = os.path.join(current_directory, '..', 'FindMy', 'request_reports.py')
poster_path = os.path.join(current_directory, '..', 'FindMy', 'poster.py')

# Log file path
log_file = os.path.join(current_directory, 'processes.log')
# Creates a log file at directory.

with open(log_file, 'a') as log: # a for append w for write mode, resets when restarted
    while True:
        # Run request_reports.py and log output
        print("Running request_reports.py...")
        subprocess.run(["python3", request_reports_path], stdout=log, stderr=subprocess.STDOUT)
        
        # Wait for 10 seconds
        time.sleep(10)

        # Run server.py and log output
        print("Running server.py...")
        subprocess.run(["python3", server_path], stdout=log, stderr=subprocess.STDOUT)
        
        # Wait for 1 minute
        time.sleep(60)

