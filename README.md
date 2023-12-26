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

## Axiom Guide (spanish)
Te dejo mi guía en videos par aprender a usar Axiom
- [Instalación y Uso Básico](https://www.youtube.com/watch?v=NP2Nxm-whs4) 
- [Crea tus propios Módulos](https://www.youtube.com/watch?v=-IGtEdE9Z6Q) 

## Digital Ocean u$s 200 coupon
- Cupón de u$s 200.- para tu VPS en Digital Ocean: https://m.do.co/c/6de1329372f1 
- Coupon of u$s 200.- for your VPS in Digital Ocean: https://m.do.co/c/6de1329372f1 
