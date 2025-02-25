#!/bin/bash
#It uses full paths for commands to ensure the original binaries are called.

# Define the full path to systemctl.
SYSTEMCTL="/bin/systemctl"
if [ ! -x "$SYSTEMCTL" ]; then
    SYSTEMCTL="/usr/bin/systemctl"
fi

# List of services to monitor.
SERVICES=("httpd" "sshd" "mysql")

# Function to generate HTML content with service statuses.
generate_html() {
    echo "<html><head>"
    echo "  <meta http-equiv='refresh' content='5'>"
    echo "  <title>Service Monitoring Dashboard</title>"
    echo "  <style>"
    echo "    body { font-family: Arial, sans-serif; }"
    echo "    table { border-collapse: collapse; width: 50%; margin: auto; }"
    echo "    th, td { border: 1px solid #dddddd; text-align: left; padding: 8px; }"
    echo "    th { background-color: #f2f2f2; }"
    echo "    .running { color: green; font-weight: bold; }"
    echo "    .stopped { color: red; font-weight: bold; }"
    echo "  </style>"
    echo "</head><body>"
    echo "  <h1 style='text-align: center;'>Service Monitoring Dashboard</h1>"
    echo "  <table>"
    echo "    <thead><tr><th>Service</th><th>Status</th></tr></thead>"
    echo "    <tbody>"
    for SERVICE in "${SERVICES[@]}"; do
        STATUS=$($SYSTEMCTL is-active "$SERVICE" 2>/dev/null)
        if [ "$STATUS" == "active" ]; then
            RESULT="Running"
            CLASS="running"
        else
            RESULT="Stopped"
            CLASS="stopped"
        fi
        echo "      <tr><td>$SERVICE</td><td class='$CLASS'>$RESULT</td></tr>"
    done
    echo "    </tbody>"
    echo "  </table>"
    echo "</body></html>"
}

#Starting a simple HTTP server using netcat.
#The server listens on port 8080 and serves the generated HTML.
while true; do
    {
        echo -e "HTTP/1.1 200 OK\r\nContent-Type: text/html\r\n\r\n"
        generate_html
    } | /bin/nc -l -p 8080 -q 1
done
