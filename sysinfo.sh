#!/bin/bash

echo "System Information Utility"
echo ""

echo "Welcome, select one of the following options using the number keys:"
echo "1: Show System Info"
echo "2: Show Disk Usage"
echo "3: Show Current Users"
echo "4: Exit"

# Read user input
read -p "Enter your choice [1-4]: " choice

# Handle choices using if/elif/else
if [ "$choice" == "1" ]; then
    echo "You selected Option 1"
elif [ "$choice" == "2" ]; then
    echo "You selected Option 2"
elif [ "$choice" == "3" ]; then
    echo "You selected Option 3"
elif [ "$choice" == "4" ]; then
    echo "Exiting the script. Goodbye!"
    exit 0
else
    echo "Invalid choice. Please select a valid option (1-4)."
fi
