#!/usr/bin/env bash
###############################################################################
# loadconf.sh
# Author: Anudeep Cherukupalli
# Description:
#   Loads environment variables from demo.env using set -a and source,
#   validates required variables, logs progress to logs/config_loader.log,
#   and prints a formatted configuration summary.
###############################################################################

CONFIG_FILE="demo.env"
LOG_FILE="logs/config_loader.log"

# === Functions ===

# Ensure log directory exists
mkdir -p "$(dirname "$LOG_FILE")"

# Log both to terminal and file
log() {
  local level="$1"
  local message="$2"
  local timestamp
  timestamp="$(date '+%Y-%m-%d %H:%M:%S')"
  echo "[$timestamp] [$level] $message" | tee -a "$LOG_FILE"
}

# Print formatted configuration summary
print_summary() {
  log "INFO" "Printing configuration summary"
  echo "==================================================" | tee -a "$LOG_FILE"
  echo "          CYBERCAFE CONFIGURATION SUMMARY" | tee -a "$LOG_FILE"
  echo "==================================================" | tee -a "$LOG_FILE"
  printf "%-20s : %s\n" "WEB_ROOT" "${WEB_ROOT:-<undefined>}" | tee -a "$LOG_FILE"
  printf "%-20s : %s\n" "PORT" "${PORT:-<undefined>}" | tee -a "$LOG_FILE"
  printf "%-20s : %s\n" "DEBUG" "${DEBUG:-<undefined>}" | tee -a "$LOG_FILE"
  echo "==================================================" | tee -a "$LOG_FILE"
  echo | tee -a "$LOG_FILE"
}

# === Main Execution ===

log "INFO" "Starting Bash Config Loader"

# Step 1: Check if file exists
if [[ ! -f "$CONFIG_FILE" ]]; then
  log "ERROR" "Configuration file '$CONFIG_FILE' not found!"
  echo "Please create it with key=value pairs."
  exit 1
fi

log "INFO" "Configuration file found."
log "INFO" "Loading variables..."

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
  log "WARN" "Missing required variables: ${missing_vars[*]}"
else
  log "INFO" "All required variables loaded successfully."
fi

# Step 4: Print summary
print_summary

log "INFO" "Configuration loading complete."
