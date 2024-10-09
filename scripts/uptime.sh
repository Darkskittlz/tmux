#!/bin/bash

# Get uptime information using the uptime command
uptime_info=$(uptime -p)

# Remove the "up " prefix and format the output
formatted_uptime=${uptime_info#up }

# Replace "hour" and "minute" variations with their respective abbreviations
formatted_uptime=${formatted_uptime// hour/h}    # Replace " hour" with "h"
formatted_uptime=${formatted_uptime// hours/h}   # Replace " hours" with "h"
formatted_uptime=${formatted_uptime// minute/m}  # Replace " minute" with "m"
formatted_uptime=${formatted_uptime// minutes/m} # Replace " minutes" with "m"

# Remove any occurrences of the letter 's' after 'h' and 'm'
formatted_uptime=$(echo $formatted_uptime | sed 's/h\s*s/h/g; s/m\s*s/m/g')

# Print the formatted uptime
echo "⏳: $formatted_uptime"
