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
  echo "❌ Error: Configuration file '$CONFIG_FILE' not found!"
  echo "Please create it with key=value pairs."
  exit 1
fi

echo "✅ Configuration file found."
echo "🔄 Loading variables..."

# Step 2: Auto-export and load variables
set -o allexport
source "$CONFIG_FILE"
set +o allexport

# Step 3: Validate required variables
missing_vars=()

for var in WEB_ROOT PORT DEBUG; do
  if [[ -z "${!var}" ]]; then
    missing_vars+=("$var")
  fi
done

if (( ${#missing_vars[@]} > 0 )); then
  echo "⚠️ Warning: Missing required variables: ${missing_vars[*]}"
  echo "Please check your demo.env file."
else
  echo "✅ All required variables loaded successfully."
fi

echo
echo "🔍 Current Configuration:"
echo "WEB_ROOT: ${WEB_ROOT:-<undefined>}"
echo "PORT: ${PORT:-<undefined>}"
echo "DEBUG: ${DEBUG:-<undefined>}"