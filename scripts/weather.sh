#!/bin/bash

# Variables
API_KEY="2c7d8f1164d6570023d1ade69de034b0" # Replace with your OpenWeatherMap API Key
CITY="Boulder"                             # Replace with your desired city
UNITS="imperial"                           # Use "metric" for Celsius or "imperial" for Fahrenheit
WEATHER_API="http://api.openweathermap.org/data/2.5/weather?q=$CITY&apikey=$API_KEY&units=$UNITS"

# Fetch weather data
weather=$(curl -s $WEATHER_API)

# Extract data using jq (install jq if you don't have it)
if [[ $(command -v jq) ]]; then
  temp=$(echo $weather | jq '.main.temp' | xargs printf "%.0f") # Round temperature
  desc=$(echo $weather | jq -r '.weather[0].description')       # Weather description
else
  temp="N/A"
  desc="N/A"
fi

# Format the output
if [[ $temp != "N/A" && $desc != "N/A" ]]; then
  echo "Boulder: ${temp}°F, ${desc}"
else
  echo "Weather: N/A"
fi
