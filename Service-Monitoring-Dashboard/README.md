# Service Monitoring Dashboard

## Task Description

As a system administrator at “MyComp,” you are responsible for monitoring the status of critical services
running on your servers. This includes services such as httpd, sshd, mysql, and others. To efficiently
track and display the status of these services, you need to develop a script that retrieves the current
status of each service and presents it on a web-based dashboard. This dashboard will provide real-time
updates on whether each service is running or stopped.

## Requirements
1. Monitor Service Status:
    - Check the status of critical services (httpd, sshd, mysql, etc.).
    - Determine if each service is running or stopped.
2. Web-Based Dashboard:
    - Display the service statuses in a web interface.
    - Provide real-time updates without manual refresh.
3. User-Friendly Interface:
    - Present the dashboard in a clear and organized manner.
    - Include meaningful labels and indicators for service statuses.
4. Automatic Updates:
    - Implement automatic updates or periodic checks to refresh the dashboard.
  
## Make the Script Executable:
* Run the following command to grant execution permissions
    - chmod +x monitor_dashboard.sh

## Usage

* Run the Dashboard Script:
    - Start the script by running:
      - ./monitor_dashboard.sh  (This will start the netcat server, listening on port 8080.)
    
* Access the Dashboard:
    - Open your web browser and navigate to:
      - http://localhost:8080 (The dashboard displays the status of each service and auto-refreshes every 5 seconds.)

## How It Works:

  - The script loops through a list of predefined services (httpd, sshd, mysql), checks each service's status using systemctl, and assigns a "Running" or "Stopped" label accordingly.
  - A function generates an HTML page with a meta refresh tag to reload the page every 5 seconds. The page displays service statuses in a table with simple styling.
  - The script uses netcat (nc) to listen on port 8080. When a browser connects, the script sends an HTTP header followed by the generated HTML content.

## Security Considerations:

  - All commands in the script use their full paths (e.g., /bin/systemctl and /bin/nc) to ensure that the correct, trusted binaries are executed.
  - The solution is lightweight and does not require complex dependencies, reducing the potential attack surface.

## Customization:

  - Add/Remove Services: Edit the SERVICES array in monitor_dashboard.sh to monitor different services.
  - Port Configuration: If port 8080 is already in use or you wish to use another port, modify the -p 8080 argument in the netcat command inside the script.

        

      
