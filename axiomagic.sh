#!/bin/bash

# Green color setup
green="\033[0;32m"
normal="\033[0m"

# Check for domains file or prompt for a different file
if [ ! -f "domains.txt" ]; then
    echo -e "${green}File 'domains.txt' not found. Please enter the full path to your domains file:${normal}"
    read file_path
    if [ ! -f "$file_path" ]; then
        echo -e "${green}File not found at the provided path. Exiting script.${normal}"
        exit 1
    fi
else
    file_path="domains.txt"
fi

# Ask for the output directory name
echo -e "${green}Please enter the name of the directory where you want to save the results:${normal}"
read output_dir

# Create the output directory
mkdir -p "$output_dir"

# Request user input for the number of fleets to create
echo -e "${green}Please enter the number of fleets you want to create:${normal}"
read fleet_count

# Create the specified number of fleets
axiom-fleet worker -i $fleet_count

# Scan for subdomains using subfinder
echo -e "${green}Scanning for subdomains with subfinder...${normal}"
axiom-scan "$file_path" -m subfinder -all -o "$output_dir/subfinder_out.txt"

# Scan the found subdomains with httpx
echo -e "${green}Scanning with httpx...${normal}"
axiom-scan "$output_dir/subfinder_out.txt" -m httpx -p 80,81,300,443,591,593,832,981,1010,1311,2082,2087,2095,2096,2480,3000,3128,3333,4243,4567,4711,4712,4993,5000,5104,5108,5800,6543,7000,7396,7474,8000,8001,8008,8014,8042,8069,8080,8081,8088,8090,8091,8118,8123,8172,8222,8243,8280,8281,8333,8443,8500,8834,8880,8888,8983,9000,9043,9060,9080,9090,9091,9200,9443,9800,9981,12443,16080,18091,18092,20720,28017 -sc -fr -title -o "$output_dir/httpx_out.txt"

# Perform aquatone scan on the httpx results
echo -e "${green}Scanning with aquatone...${normal}"
axiom-scan "$output_dir/httpx_out.txt" -m aquatone -scan-timeout 200 -screenshot-timeout 60000 -o "$output_dir/aquatone"

# List the scan results
echo -e "${green}Listing the scan results in $output_dir...${normal}"
axiom-ls "$output_dir"

# Ask the user if they want to delete the created fleets
echo -e "${green}Do you want to delete the created fleets? (y/n)${normal}"
read delete_fleets

# Conditionally delete the fleets based on user input
if [ "$delete_fleets" = "y" ]; then
    echo -e "${green}Deleting fleets...${normal}"
    axiom-rm "worker*" -f
else
    echo -e "${green}Keeping the fleets...${normal}"
fi
