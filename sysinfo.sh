#!/bin/bash

# Display the menu
echo "Welcome, select one of the following options using the number keys:"
echo "1: Show System Info"
echo "2: Show Disk Usage"
echo "3: Show Current Users"
echo "4: Show Top Processes"
echo "5: Exit"

# Capture user input
read -p "Enter your choice (1-5): " choice

# Handle the user's choice
if [ "$choice" == "1" ]; then
    echo "You selected Option 1: Show System Info"
elif [ "$choice" == "2" ]; then
    echo "You selected Option 2: Show Disk Usage"
elif [ "$choice" == "3" ]; then
    echo "You selected Option 3: Show Current Users"
elif [ "$choice" == "4" ]; then
    echo "Exiting the script. Goodbye!"
    exit 0
elif [ "$choice" == "5" ]; then
    echo "You selected Option 5: Show Top Processes"
    echo ""
    echo "+------+--------+--------+-------------+"
    echo "| PID  | User   | CPU%   | Command     |"
    echo "+------+--------+--------+-------------+"
    
    # Get top 5 CPU-consuming processes excluding the header row
    ps -eo pid,user,%cpu,comm --sort=-%cpu | head -n 6 | tail -n 5 | awk '{printf "| %-4s | %-6s | %-6s | %-11s |\n", $1, $2, $3"%", $4}'
    
    echo "+------+--------+--------+-------------+"
else
    echo "Invalid option. Please run the script again and select 1-5."
    exit 1
fi
