#!/bin/bash

# Develop a Bash script that interacts with AWS EC2 instance metadata
# and executes commands based on user input

echo "Select an operation:"
echo "1) Launch htop on instance"
echo "2) Launch tcpdump utility on instance"
echo "3) Show EC2 instance metadata"
read -p "Enter choice: " choice
if [ "$choice" == "1" ]; then
    echo "Launching htop..."
    htop
elif [ "$choice" == "2" ]; then
    echo "Launching tcpdump..."
    tcpdump
elif [ "$choice" == "3" ]; then
    echo "Retrieving instance metadata.."
    # Metadata token retrieval
    TOKEN=$(curl -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600")
    # Fetching metadata
    METADATA=$(curl -H "X-aws-ec2-metadata-token: $TOKEN" http://169.254.169.254/latest/meta-data/)
    echo "$METADATA"
fi