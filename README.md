# Providence Domain Tool

Providence Domain Tool is a professional **domain intelligence and reconnaissance** script designed for cybersecurity professionals, researchers, and enthusiasts. It automates the collection of domain registration data, DNS records, IP/ASN information, and more. Optional **Tor routing** allows queries to be made anonymously, preserving privacy.

---

## Features

- **WHOIS Walk**: Automates a full WHOIS walk (IANA → Registry → Registrar → NIC) to collect detailed registration data.
- **RDAP Enumeration**: Fetches domain registration details via RDAP endpoints for structured information.
- **DNS Enumeration**: Collects NS, A, AAAA, MX, TXT, CNAME, and SOA records.
- **IP / ASN / RIR Intelligence**: Performs WHOIS and ASN lookups for associated IPs.
- **Tor Support**: Optional Tor routing for anonymized network queries.
- **JSON Output**: Save all collected intelligence into a structured JSON file for further analysis.
- **Cross-Platform Bash Script**: Works on most Linux distributions and macOS environments.

---

## Installation

Clone the repository and make the script executable:

```bash
https://github.com/AliSalih-ops/Providence-Domain-Tool.git
cd providence-domain-tool
chmod +x providenceDomainTool.sh

```
Optional: Tor Setup

For anonymized queries:

Install Tor:

Debian / Ubuntu / Kali:

```bash
sudo apt update
sudo apt install tor torsocks -y
```

Usage

Run the script and follow the prompts:
```bash
./providenceDomainTool.sh

```


