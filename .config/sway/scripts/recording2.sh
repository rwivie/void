#!/usr/bin/env bash

# Path to the recording script
RECORDING_SCRIPT="$XDG_CONFIG_HOME/waybar/scripts/recording.sh"

# Function to check if the recording is running
is_recording_running() {
    if [ -f "$pidf" ]; then
        return 0  # Recording is running
    else
        return 1  # Recording is not running
    fi
}

# Check if the recording is running
if is_recording_running; then
    echo "Stopping the recording"
    "$RECORDING_SCRIPT" toggle
else
    echo "Starting the recording"
    "$RECORDING_SCRIPT" toggle fullscreen  # Or "toggle region" as needed
fi
