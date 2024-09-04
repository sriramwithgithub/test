#!/bin/bash

# Database connection string
DATABASE_URL=postgres://u4c8ppmqnpka51:pb1adfc4241ad5cdb09ba2a35835e1f9127a067576bef60a952f23e528c3f191d@ec2-54-174-84-78.compute-1.amazonaws.com:5432/d484jloiiup1kh

# Interval between data sends (in seconds)
INTERVAL=5

# Function to insert data into the database
send_data() {
    local timestamp=$(date +"%Y-%m-%d %H:%M:%S")
    local random_value=$((RANDOM % 100))

    # SQL command to insert data
    local sql="INSERT INTO data_table (timestamp, value) VALUES ('$timestamp', $random_value);"

    # Execute the SQL command
    echo "$sql" | psql $DATABASE_URL
}

# Loop to continuously send data
while true; do
    send_data
    echo "Data sent at $(date)"
    sleep $INTERVAL
done
