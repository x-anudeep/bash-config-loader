#!/usr/bin/env bash
###############################################################################
# loadconf.sh
# Author: Anudeep Cherukupalli
# Description: Basic configuration loader that checks for a .env file.
###############################################################################

CONFIG_FILE="demo.env"

echo "=== Bash Config Loader ==="

# Step 1: Check if file exists
if [[ ! -f "$CONFIG_FILE" ]]; then
  echo "Error: $CONFIG_FILE not found!"
  echo "Please create one with key=value pairs."
  exit 1
fi

echo "Configuration file found: $CONFIG_FILE"
echo "Loading variables..."
