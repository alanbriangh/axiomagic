# Axiom Automation Script "Axiomagic"

## Description
This Bash script is designed to automate the process of scanning domains using Axiom, a dynamic infrastructure framework for distributed scanning [https://github.com/pry0cc/axiom](https://github.com/pry0cc/axiom).

### Features
- **Fleet Creation**: Prompts the user to enter the desired number of fleets and creates them accordingly.
- **Subfinder Scan**: Executes `axiom-scan` with Subfinder to find subdomains, saving the output to `subfinder_out.txt`.
- **Httpx Scan**: Further scans the Subfinder results with Httpx on a range of ports, outputting to `httpx_out.txt`.
- **Aquatone Scan**: Utilizes Aquatone for detailed scanning, including screenshots, of the Httpx results.
- **Fleet Management**: Asks the user whether to delete the created fleets post-scanning, providing an option to clean up resources.

## Usage
The script streamlines the scanning process, making it efficient for users handling multiple domains. It's particularly useful for security researchers and penetration testers looking to automate their workflow with Axiom's cloud-based scanning capabilities.

