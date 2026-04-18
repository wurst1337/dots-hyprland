#!/bin/bash

# Settings
TEMP_NIGHT=3000
TEMP_DAY=6500
START_HOUR=20  # 20:00
END_HOUR=7     # 07:00

while true; do
    HOUR=$(date +%H)
    
    # Cheking, day or night
    if [ "$HOUR" -ge "$START_HOUR" ] || [ "$HOUR" -lt "$END_HOUR" ]; then
        TARGET_TEMP=$TEMP_NIGHT
    else
        TARGET_TEMP=$TEMP_DAY
    fi

    # run hyprsunset
    if ! pgrep -f "hyprsunset --temperature ${TARGET_TEMP}K" > /dev/null; then
        pkill hyprsunset
        hyprsunset --temperature "${TARGET_TEMP}K" &
    fi

    sleep 300  # 300 = 5 minutes
done