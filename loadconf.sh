#!/usr/bin/env bash
###############################################################################
# loadconf.sh
# Author: Anudeep Cherukupalli
# Description: Basic configuration loader that checks for a .env file.
###############################################################################

CONFIG_FILE="demo.env"

echo "=== Bash Config Loader ==="

# Step 1: Validate config file
if [[ ! -f "$CONFIG_FILE" ]]; then
  echo "Error: Configuration file '$CONFIG_FILE' not found!"
  echo "Please create it with key=value pairs."
  exit 1
fi

echo "Configuration file found."
echo "Loading variables..."

# Step 2: Automatically export all variables
set -o allexport
source "$CONFIG_FILE"
set +o allexport

echo "Variables loaded successfully!"
echo
echo "WEB_ROOT: $WEB_ROOT"
echo "PORT: $PORT"
echo "DEBUG: $DEBUG"
