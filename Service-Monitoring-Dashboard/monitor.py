#!/usr/bin/env python3

import subprocess
from flask import Flask, render_template, jsonify

app = Flask(__name__)

# List of critical services to monitor
SERVICES = ['httpd', 'sshd', 'mysql']

def check_service_status(service):
    """
    Check the status of a service using /bin/systemctl command.
    Returns "Running" if the service is active, otherwise "Stopped" or an error message.
    """
    try:
        result = subprocess.run(
            ['/bin/systemctl', 'is-active', service],
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            text=True
        )
        status = result.stdout.strip()
        if status == 'active':
            return "Running"
        else:
            return "Stopped"
    except Exception as e:
        return f"Error: {e}"

@app.route('/')
def index():
    return render_template('dashboard.html')

@app.route('/status')
def status():
    service_status = {}
    for service in SERVICES:
        service_status[service] = check_service_status(service)
    return jsonify(service_status)

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')
