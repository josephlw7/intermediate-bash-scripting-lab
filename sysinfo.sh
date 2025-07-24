#!/bin/bash

# Help check
if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    echo "======================================================"
    echo " USAGE: ./sysinfo.sh"
    echo " DESCRIPTION: This script displays a system information menu."
    echo " OPTIONS:"
    echo "   1: Show System Info"
    echo "   2: Show Disk Usage"
    echo "   3: Show Current Users"
    echo "   4: Show Top 5 CPU-Intensive Processes"
    echo "   5: Exit the script"
    echo "======================================================"
    exit 0
fi

while true; do
    # Display the menu
    echo ""
    echo "======================================================"
    echo " Welcome, select one of the following options using the number keys:"
    echo " 1: Show System Info"
    echo " 2: Show Disk Usage"
    echo " 3: Show Current Users"
    echo " 4: Show Top Processes"
    echo " 5: Exit"
    echo "======================================================"

    # Capture user input
    read -p "Enter your choice (1-5): " choice

    # Add timestamp
    timestamp=$(date)

    # Handle the user's choice
    if [ "$choice" == "1" ]; then
        echo ""
        echo "------------------------------------------------------"
        echo " SYSTEM INFO - Generated on: $timestamp"
        echo "------------------------------------------------------"
        echo "Operating System : $(grep '^PRETTY_NAME' /etc/os-release | cut -d '"' -f2)"
        echo "Hostname         : $(hostname)"
        echo "Kernel Version   : $(uname -r)"
        echo "Uptime           : $(uptime -p)"
        echo "------------------------------------------------------"

    elif [ "$choice" == "2" ]; then
        echo ""
        echo "------------------------------------------------------"
        echo " DISK USAGE - Generated on: $timestamp"
        echo "------------------------------------------------------"
        df -h
        echo "------------------------------------------------------"

    elif [ "$choice" == "3" ]; then
        echo ""
        echo "------------------------------------------------------"
        echo " CURRENT USERS - Generated on: $timestamp"
        echo "------------------------------------------------------"
        who
        echo "------------------------------------------------------"

    elif [ "$choice" == "4" ]; then
        echo ""
        echo "------------------------------------------------------"
        echo " TOP 5 CPU-INTENSIVE PROCESSES - Generated on: $timestamp"
        echo "------------------------------------------------------"
        echo "+------+--------+--------+-------------+"
        echo "| PID  | User   | CPU%   | Command     |"
        echo "+------+--------+--------+-------------+"

        # Get top 5 CPU-consuming processes excluding the header row
        ps -eo pid,user,%cpu,comm --sort=-%cpu | head -n 6 | tail -n 5 | awk '{printf "| %-4s | %-6s | %-6s | %-11s |\n", $1, $2, $3"%", $4}'

        echo "+------+--------+--------+-------------+"
        echo "------------------------------------------------------"

    elif [ "$choice" == "5" ]; then
        echo "Exiting the script. Goodbye!"
        exit 0
    else
        echo "Invalid option. Please select a number from 1 to 5."
    fi

done
