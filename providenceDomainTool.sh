#!/usr/bin/env bash
set -euo pipefail

# ================= COLORS =================
RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
PURPLE='\033[1;35m'
CYAN='\033[1;36m'
WHITE='\033[1;37m'
BOLD='\033[1m'
DIM='\033[2m'
RESET='\033[0m'

# ================= BANNER =================
echo -e "${CYAN}${BOLD}"
cat << "EOF"

        ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣀⣤⣤⣤⣤⣤⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⡴⠞⠛⣉⡉⠄⠀⠀⠀⠀⠀⠐⠯⣛⡳⢦⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⡴⢛⡡⠔⠚⣉⡀⠄⠀⠀⠒⠀⠀⠀⠀⠀⠀⠈⠓⠪⣝⡳⢤⣀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⣀⡴⢛⡥⢒⡩⠔⣒⣩⡥⠶⠖⠚⠛⠛⠓⠶⠦⢤⣄⣈⠑⠢⢄⡀⠉⠲⢝⠳⣤⡀⠀⠀⠀⠀
⠀⠀⠀⠀⢀⣤⠞⢉⣔⡯⢒⣥⠶⠛⣉⣤⣶⣶⣿⣿⣿⣿⣿⣿⠿⢷⣾⣯⣟⡶⣤⣈⠲⠀⠀⠑⢬⠙⢦⡀⠀⠀
⠀⠀⢀⡴⠟⠁⣴⢟⣡⡾⢋⣥⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⣤⣤⡈⠻⣿⣿⣿⣯⣻⣦⣅⡀⠀⠀⠀⠙⢷⣄
⣠⡼⠋⠀⠀⣠⡴⣛⣥⣾⣿⣿⣿⢿⡟⡿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⡇⢸⠻⣿⣿⣿⣿⣮⣿⡦⠀⠀⠀⠀⠉
⠉⠀⠀⣠⣾⣯⡾⠟⠋⠀⢻⣿⣿⠘⡇⠙⠙⣿⣿⣿⣿⣿⣿⣿⣿⣿⢿⠃⣼⠀⣾⠉⡏⢸⡟⠛⠛⣷⠀⢰⡀⠀
⠀⠀⣨⣷⡟⢹⠀⠀⠀⠀⠀⠈⢻⣆⠹⡄⠀⠈⠛⠿⣿⣿⣿⣿⠿⣫⠎⡰⠃⣼⠃⠘⠁⣼⠁⣠⣾⡏⠀⠼⠁⠀
⠀⠸⣿⣽⣷⣤⣄⡀⠀⡀⠀⠀⠀⠙⠷⣤⡀⠀⠀⠀⠀⠀⠀⠀⠈⣡⠞⣡⠞⠁⠀⠀⢀⣡⣾⣿⠋⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠉⠙⠳⢮⣗⣦⣀⣀⠀⠈⠙⠷⠶⢤⣤⣤⣤⣤⡾⠿⠛⠁⠀⢀⣠⣶⣿⡿⢋⣰⠆⡀⠀⠀⠀⠀
⠀⠙⠛⠛⠛⠳⢦⣄⡀⠀⠈⠙⠻⠾⢿⣶⣦⣄⠀⠀⠀⠀⠀⠀⠀⣀⣀⣤⣶⣿⠿⠛⢉⣤⠞⣡⠞⠁⠀⠀⠀⠀
⠀⠀⠀⠀⢠⡳⢤⣉⠛⠳⠶⣤⣄⣀⡀⠀⠉⠙⠛⠛⠛⠛⠛⠛⠛⠛⠛⠉⠉⢀⣠⡶⠋⣡⠞⡡⠚⣡⠊⠀⠀⠀
⠀⠀⠀⠀⠰⣝⡳⠮⣭⠂⠀⠀⠈⠉⠙⢛⠶⠶⢶⣤⣤⣄⣀⣀⣠⣤⣴⠶⠟⠋⠁⠰⠋⠕⣊⠴⠂⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠉⠉⠉⠀⠀⠀⠀⠀⠀⠈⠓⣖⡒⠂⠠⠤⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⠒⠦⠭⠭⠭⠤⠵⠒⠒⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
   
	MADE BY PROVIDENCE
   FOR DOMAIN INTELLIGENCE

EOF
echo -e "${RESET}"

# ================= DEPENDENCY CHECK =================
for cmd in whois dig jq curl; do
    command -v $cmd >/dev/null 2>&1 || { echo -e "${RED}[!] $cmd is required${RESET}"; exit 1; }
done

# ================= INPUT =================
read -rp "$(echo -e "${CYAN}Enter domain (example.com): ${RESET}")" DOMAIN
[[ -z "$DOMAIN" ]] && { echo -e "${RED}[!] No domain provided${RESET}"; exit 1; }
DOMAIN="${DOMAIN,,}"

# ================= TOR OPTION =================
echo
read -rp "$(echo -e "${CYAN}Do you want to enable Tor for privacy?${RESET} ${DIM}(slower, but more anonymous) [y/N]: ${RESET}")" USE_TOR
USE_TOR="${USE_TOR,,}"

if [[ "$USE_TOR" == "y" ]]; then
    if ! command -v torsocks >/dev/null 2>&1; then
        echo -e "${YELLOW}[!] torsocks is required to use Tor.${RESET}"
        read -rp "$(echo -e "${CYAN}Do you want to install torsocks now? [y/N]: ${RESET}")" INSTALL_TORSOCKS
        INSTALL_TORSOCKS="${INSTALL_TORSOCKS,,}"

        if [[ "$INSTALL_TORSOCKS" == "y" ]]; then
            echo -e "${CYAN}Select your system type:${RESET}"
            echo -e "1) Debian / Ubuntu / Kali"
            echo -e "2) Fedora / CentOS / RHEL"
            echo -e "3) Arch / Manjaro"
            read -rp "Enter number [1-3]: " SYS_TYPE

            case "$SYS_TYPE" in
                1)
                    echo -e "${GREEN}[i] Installing torsocks on Debian/Ubuntu/Kali...${RESET}"
                    sudo apt update && sudo apt install torsocks -y
                    ;;
                2)
                    echo -e "${GREEN}[i] Installing torsocks on Fedora/CentOS/RHEL...${RESET}"
                    sudo dnf install torsocks -y
                    ;;
                3)
                    echo -e "${GREEN}[i] Installing torsocks on Arch/Manjaro...${RESET}"
                    sudo pacman -S torsocks --noconfirm
                    ;;
                *)
                    echo -e "${RED}[!] Invalid selection. Please install torsocks manually.${RESET}"
                    exit 1
                    ;;
            esac

            # Re-check if installation succeeded
            command -v torsocks >/dev/null 2>&1 || { echo -e "${RED}[!] torsocks installation failed. Exiting.${RESET}"; exit 1; }
            echo -e "${GREEN}[✓] torsocks installed successfully.${RESET}"
        else
            echo -e "${RED}[!] torsocks is required to run Tor. Exiting.${RESET}"
            exit 1
        fi
    fi

    echo -e "${YELLOW}[!] Tor enabled: queries will be routed through Tor, this may take longer.${RESET}"
    WHOIS_CMD="torsocks whois"
    DIG_CMD="torsocks dig"
    CURL_CMD="torsocks curl -s"
else
    WHOIS_CMD="whois"
    DIG_CMD="dig"
    CURL_CMD="curl -s"
fi


# ================= DATA =================
declare -A SEEN
QUEUE=()
JSON_WHOIS=()
JSON_RDAP=()
JSON_DNS=()
JSON_IPS=()

rate_sleep() { sleep 0.6; }
normalize_server() { sed 's|whois://||;s|https://||;s|/.*||'; }

# ================= WHOIS WALK =================
query_whois() {
    local SERVER="$1"
    local TARGET="$2"

    [[ -n "${SEEN[$SERVER]:-}" ]] && return
    SEEN[$SERVER]=1

    echo -e "${CYAN}${BOLD}================ WHOIS @ $SERVER ================${RESET}"
    OUTPUT=$($WHOIS_CMD -h "$SERVER" "$TARGET" 2>/dev/null || true)
    echo "$OUTPUT"

    # Add WHOIS JSON
    JSON_WHOIS+=("$(jq -Rn --arg server "$SERVER" --arg data "$OUTPUT" '{server:$server, raw:$data}')")

    # Queue new referral servers
    while read -r REF; do
        [[ -n "$REF" && -z "${SEEN[$REF]:-}" ]] && QUEUE+=("$REF")
    done < <(echo "$OUTPUT" | grep -Ei '^(refer|whois|ReferralServer):' | awk '{print $NF}' | normalize_server)

    rate_sleep
}

echo -e "${GREEN}${BOLD}[+] WHOIS WALK${RESET} ${DIM}(IANA → REGISTRY → REGISTRAR → NIC)${RESET}"
query_whois "whois.iana.org" "$DOMAIN"
while [[ ${#QUEUE[@]} -gt 0 ]]; do
    SERVER="${QUEUE[0]}"
    QUEUE=("${QUEUE[@]:1}")
    query_whois "$SERVER" "$DOMAIN"
done

# ================= RDAP =================
echo
echo -e "${PURPLE}${BOLD}[+] RDAP ENUMERATION${RESET}"
rdap_servers=(
    "https://rdap.iana.org/domain/"
    "https://rdap.verisign.com/com/v1/domain/"
)
for rdap in "${rdap_servers[@]}"; do
    echo -e "${PURPLE}----- RDAP @ $rdap -----${RESET}"
    DATA=$($CURL_CMD "${rdap}${DOMAIN}" || true)
    if jq -e . >/dev/null 2>&1 <<<"$DATA"; then
        echo "$DATA" | jq .
        JSON_RDAP+=("$(jq -c . <<<"$DATA")")
    else
        echo -e "${RED}[!] No RDAP data${RESET}"
    fi
done

# ================= DNS =================
echo
echo -e "${BLUE}${BOLD}[+] DNS ENUMERATION${RESET}"

dns_query() { $DIG_CMD "$1" "$DOMAIN" +short | sed '/^$/d'; }

NS=$(dns_query NS)
SOA=$(dns_query SOA)
A=$(dns_query A)
AAAA=$(dns_query AAAA)
MX=$(dns_query MX)
TXT=$(dns_query TXT)
CNAME=$(dns_query CNAME)

echo -e "${BLUE}[NS]${RESET}\n$NS\n"
echo -e "${BLUE}[SOA]${RESET}\n$SOA\n"
echo -e "${BLUE}[A / AAAA]${RESET}\n$A\n$AAAA\n"
echo -e "${BLUE}[MX]${RESET}\n$MX\n"
echo -e "${BLUE}[TXT]${RESET}\n$TXT\n"
echo -e "${BLUE}[CNAME]${RESET}\n$CNAME\n"

# JSON-friendly arrays for DNS
JSON_DNS+=("$(jq -n \
    --argjson ns "$(jq -R -s -c 'split("\n") | map(select(. != ""))' <<<"$NS")" \
    --argjson soa "$(jq -R -s -c 'split("\n") | map(select(. != ""))' <<<"$SOA")" \
    --argjson a "$(jq -R -s -c 'split("\n") | map(select(. != ""))' <<<"$A")" \
    --argjson aaaa "$(jq -R -s -c 'split("\n") | map(select(. != ""))' <<<"$AAAA")" \
    --argjson mx "$(jq -R -s -c 'split("\n") | map(select(. != ""))' <<<"$MX")" \
    --argjson txt "$(jq -R -s -c 'split("\n") | map(select(. != ""))' <<<"$TXT")" \
    --argjson cname "$(jq -R -s -c 'split("\n") | map(select(. != ""))' <<<"$CNAME")" \
    '{NS:$ns, SOA:$soa, A:$a, AAAA:$aaaa, MX:$mx, TXT:$txt, CNAME:$cname}')")

# ================= IP / ASN =================
echo
echo -e "${WHITE}${BOLD}[+] IP / ASN / RIR INTELLIGENCE${RESET}"

for ip in $A; do
    echo -e "${WHITE}${BOLD}----------- IP: ${YELLOW}$ip${WHITE} -----------${RESET}"
    IP_WHOIS=$($WHOIS_CMD "$ip" || true)
    ASN=$($WHOIS_CMD -h whois.cymru.com "-v $ip" || true)

    echo "$IP_WHOIS"
    echo -e "${PURPLE}[ASN lookup]${RESET}"
    echo "$ASN"

    JSON_IPS+=("$(jq -Rn --arg ip "$ip" --arg whois "$IP_WHOIS" --arg asn "$ASN" '{ip:$ip, whois:$whois, asn:$asn}')")
done

# ================= COMPLETE =================
echo
echo -e "${GREEN}${BOLD}=================================================${RESET}"
echo -e "${GREEN}${BOLD}[✓] INTELLIGENCE COLLECTION COMPLETE${RESET}"
echo -e "${DIM}Providence sees what others miss.${RESET}"
echo -e "${GREEN}${BOLD}=================================================${RESET}"

# ================= JSON SAVE =================
read -rp "$(echo -e "${CYAN}Save results as JSON? (y/N): ${RESET}")" SAVE_JSON
SAVE_JSON="${SAVE_JSON,,}"
if [[ "$SAVE_JSON" == "y" ]]; then
    read -rp "Filename (without .json, default: $DOMAIN): " FILENAME
    [[ -z "$FILENAME" ]] && FILENAME="$DOMAIN"
    OUT="${FILENAME}.json"
    COUNT=1
    while [[ -e "$OUT" ]]; do
        OUT="${FILENAME}_${COUNT}.json"
        ((COUNT++))
    done

    jq -n \
        --arg domain "$DOMAIN" \
        --argjson whois "$(jq -s . <<<"${JSON_WHOIS[*]}")" \
        --argjson rdap "$(jq -s . <<<"${JSON_RDAP[*]:-}")" \
        --argjson dns "$(jq -s . <<<"${JSON_DNS[*]}")" \
        --argjson ips "$(jq -s . <<<"${JSON_IPS[*]}")" \
        '{ domain:$domain, whois:$whois, rdap:$rdap, dns:$dns[0], ips:$ips }' > "$OUT"

    echo -e "${GREEN}[✓] JSON saved to $OUT${RESET}"

    # ================= SIGNATURE =================
    echo -e "${GREEN}${BOLD}"
    cat << "EOF"

=================================================
✓ JSON saved and intelligence collected!
MADE BY PROVIDENCE DOMAIN TOOL
FOLLOW THE PATH WHERE OTHERS WON'T
=================================================

EOF
    echo -e "${RESET}"
fi
