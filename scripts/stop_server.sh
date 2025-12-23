#!/bin/bash
echo "Stopping current running application..."
CURRENT_PID=$(pgrep -f .jar)
if [ -z "$CURRENT_PID" ]; then
    echo "No running application found."
else
    echo "Killing process $CURRENT_PID"
    kill -15 $CURRENT_PID
    sleep 5
fi