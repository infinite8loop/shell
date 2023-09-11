#!/bin/sh

# Array of SQL scripts to run
SQL_SCRIPT_1="overlapping_trips.sql"

# Variable to store the output of all scripts
OUTPUT=""

run_script_and_collect_output() {
  local script_name="$1"
  local script_output
  script_output=$(PGPASSWORD="$PG_PASSWORD" psql -h "$PG_HOST" -p "$PG_PORT" -U "$PG_USER" -d "$PG_DATABASE" -f "$SCRIPT_DIR/$script_name" 2>&1)
  echo "--- Script: $script_name ---" >> output.csv
  echo "$script_output" >> output.csv 
  echo "" >> output.csv
}

# Create an empty CSV file to store the output
# > output.csv

# Run SQL scripts and collect output
run_script_and_collect_output "$SQL_SCRIPT_1"

curl -F "file=@output.csv" -F "initial_comment=SQL Script Execution Results" -F channels="#alerts-data-integrity" -H "Authorization: Bearer $SLACK_WEBHOOK_URL" https://slack.com/api/files.upload

