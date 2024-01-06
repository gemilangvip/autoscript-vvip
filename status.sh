#!/bin/bash
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
# System Request : Debian 9+/Ubuntu 18.04+/20+
# Develovers » Gemilangkinasih࿐
# Email      » gemilangkinasih@gmail.com
# telegram   » https://t.me/gemilangkinasih
# whatsapp   » wa.me/+628984880039
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
# Gemilangkinasih࿐

# Color
NC='\e[0m'
RED='\033[0;31m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BGWHITE='\e[0;100;37m'
clear

# System Information
domain=$(cat /etc/xray/domain)
WKT=$(curl -s ipinfo.io/timezone)
IPVPS=$(curl -s ipv4.icanhazip.com)
tram=$(free -m | awk 'NR==2 {print $2}')
swap=$(free -m | awk 'NR==4 {print $2}')
freq=$(awk -F: ' /cpu MHz/ {freq=$2} END {print freq}' /proc/cpuinfo)
cores=$(awk -F: '/model name/ {core++} END {print core}' /proc/cpuinfo)
cname=$(awk -F: '/model name/ {name=$2} END {print name}' /proc/cpuinfo)
knr=$( uname -r )

# Exporting IP Address
export IP=$( curl -s https://ipinfo.io/ip/ )
# SSH
ssh_service=$(/etc/init.d/ssh status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
openvpn_service="$(systemctl show openvpn.service --no-page)"
oovpn=$(echo "${openvpn_service}" | grep 'ActiveState=' | cut -f2 -d=)
dropbear_status=$(/etc/init.d/dropbear status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
haproxy_service=$(systemctl status haproxy | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
fail2ban_service=$(/etc/init.d/fail2ban status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
cron_service=$(systemctl  status cron | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
badvpn1=$(systemctl status udp-mini-1 | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
badvpn2=$(systemctl status udp-mini-2 | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
badvpn3=$(systemctl status udp-mini-3 | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
Iptables=$(systemctl status netfilter-persistent | grep active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g')
RClocal=$(systemctl status rc-local | grep active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g')
Autorebot=$(systemctl status rc-local | grep active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g')
UdpSSH=$(systemctl status udp-custom | grep active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g')

openssh=$( systemctl status ssh | grep Active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g' )
if [[ $openssh == "running" ]]; then
    status_openssh="${GREEN}Online${NC}(No ${RED}Error${NC})"
else
    status_openssh="${RED}Offline${NC} "
fi

# SSH WEBSHOCKET PROXY
ssh_ws=$( systemctl status ws | grep Active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g' )
if [[ $ssh_ws == "running" ]]; then
    status_ws_epro="${GREEN}Online${NC}(No ${RED}Error${NC})"
else
    status_ws_epro="${RED}Offline${NC} "
fi

# TROJAN PROXY
ss=$( systemctl status xray | grep Active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g' )
if [[ $ss == "running" ]]; then
    status_ss="${GREEN}Online${NC}(No ${RED}Error${NC})$NC"
else
    status_ss="${RED}Offline${NC} "
fi

# NGINX
nginx=$( /etc/init.d/nginx status | grep Active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g' )
if [[ $nginx == "running" ]]; then
    status_nginx="${GREEN}Online${NC}(No ${RED}Error${NC})"
else
    status_nginx="${RED}Offline${NC} "
fi

# STATUS SERVICE IPTABLES
if [[ $Iptables == "exited" ]]; then
    status_galo="${GREEN}Online${NC}(No ${RED}Error${NC})"
else
    status_galo="${RED}Offline${NC}"
fi

# STATUS SERVICE  SSH 
if [[ $ssh_service == "running" ]]; then 
   status_ssh="${GREEN}Online${NC}(No ${RED}Error${NC})"
else
   status_ssh="${RED}Offline${NC} "
fi

# STATUS OHP SSH
# if [[ $ohr == "running" ]]; then 
#   sohr="${GREEN}Online${NC}(No ${RED}Error${NC})${NC}${NC}"
# else
#   sohr="${RED}Offline${NC} ${NC}"
# fi

# STATUS SERVICE OPENVPN
if [[ $oovpn == "active" ]]; then
  status_openvpn="${GREEN}Online${NC}(No ${RED}Error${NC})"
else
  status_openvpn="${RED}Offline${NC} "
fi

# STATUS SERVICE DROPBEAR
if [[ $dropbear_status == "running" ]]; then 
   status_beruangjatuh="${GREEN}Online${NC}(No ${RED}Error${NC})"
else
   status_beruangjatuh="${RED}Offline${NC} ${NC}"
fi

# STATUS SERVICE HAPROXY
if [[ $haproxy_service == "running" ]]; then 
   status_haproxy="${GREEN}Online${NC}(No ${RED}Error${NC})"
else
   status_haproxy="${RED}Offline${NC} "
fi

# STATUS SERVICE  SQUID 
# if [[ $squid_service == "running" ]]; then 
#   status_squid="${GREEN}Online${NC}(No ${RED}Error${NC})"
# else
#   status_squid="${RED}Offline${NC} "
# fi

# STATUS SERVICE  FAIL2BAN 
if [[ $fail2ban_service == "running" ]]; then 
   status_fail2ban="${GREEN}Online${NC}(No ${RED}Error${NC})"
else
   status_fail2ban="${RED}Offline${NC} "
fi

# STATUS SERVICE  CRONS 
if [[ $cron_service == "running" ]]; then 
   status_cron="${GREEN}Online${NC}(No ${RED}Error${NC})"
else
   status_cron="${RED}Offline${NC} "
fi

# STATUS SERVICE  BADVPN 1
if [[ $badvpn1 == "running" ]]; then 
   status_udp1="${GREEN}Online${NC}(No ${RED}Error${NC})"
else
   status_udp1="${RED}Offline${NC} "
fi

# STATUS SERVICE  BADVPN 2
if [[ $badvpn2 == "running" ]]; then 
   status_udp2="${GREEN}Online${NC}(No ${RED}Error${NC})"
else
   status_udp2="${RED}Offline${NC} "
fi

# STATUS SERVICE  BADVPN 3
if [[ $badvpn3 == "running" ]]; then 
   status_udp3="${GREEN}Online${NC}(No ${RED}Error${NC})"
else
   status_udp3="${RED}Offline${NC} "
fi

if [[ $RClocal == "exited" ]]; then
    status_galoo="${GREEN}Online${NC}(No ${RED}Error${NC})"
else
    status_galoo="${RED}Offline${NC}"
fi

if [[ $Autorebot == "exited" ]]; then
    status_galooo="${GREEN}Online${NC}(No ${RED}Error${NC})"
else
    status_galooo="${RED}Offline${NC}"
fi

# STATUS SERVICE  SSH UDP 
if [[ $UdpSSH == "running" ]]; then 
   status_udp="${GREEN}Online${NC}(No ${RED}Error${NC})"
else
   status_udp="${RED}Offline${NC} "
fi

# RUNNING FUNCTION 
clear
echo -e ""
echo -e "${ORANGE} ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e " ${BGWHITE}           » System Server Information «          ${NC}"
echo -e "${ORANGE} ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${GREEN} » ${NC}Operating System : $(cat /etc/os-release | grep -w PRETTY_NAME | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/PRETTY_NAME//g')"
echo -e "${GREEN} » ${NC}ISP Server       : $(cat /etc/xray/isp)${NC}"
echo -e "${GREEN} » ${NC}IP -Server       : $IPVPS$NC"
echo -e "${GREEN} » ${NC}Domain Server    : $(cat /etc/xray/domain)${NC}"
echo -e "${ORANGE} ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e " ${BGWHITE}              » Service Information «             ${NC}"
echo -e "${ORANGE} ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${GREEN} » ${NC}Service SSH / TUN             : $status_openssh${NC}"
echo -e "${GREEN} » ${NC}Service SSH UDP               : $status_udp${NC}"
echo -e "${GREEN} » ${NC}Service OpenVPN SSL           : $status_openvpn${NC}"
echo -e "${GREEN} » ${NC}Service OpenVPN WS-SSL        : $status_openvpn${NC}"
echo -e "${GREEN} » ${NC}Service OpenVPN UDP           : $status_openvpn${NC}"
echo -e "${GREEN} » ${NC}Service OpenVPN TCP           : $status_openvpn${NC}"
echo -e "${GREEN} » ${NC}Service OHP SSH               : $status_openvpn${NC}"
echo -e "${GREEN} » ${NC}Service OHP Dropbear          : $status_openvpn${NC}"
echo -e "${GREEN} » ${NC}Service OHP OpenVPN           : $status_openvpn${NC}"
echo -e "${GREEN} » ${NC}Service WS ePRO               : $status_ws_epro${NC}"
echo -e "${GREEN} » ${NC}Service BadVPN 7100           : $status_udp1${NC}"
echo -e "${GREEN} » ${NC}Service BadVPN 7200           : $status_udp2${NC}"
echo -e "${GREEN} » ${NC}Service BadVPN 7300           : $status_udp3${NC}"
echo -e "${GREEN} » ${NC}Service Dropbear              : $status_beruangjatuh${NC}"
echo -e "${GREEN} » ${NC}Service Haproxy               : $status_haproxy${NC}"
echo -e "${GREEN} » ${NC}Service Fail2Ban              : $status_fail2ban${NC}"
echo -e "${GREEN} » ${NC}Service Crons                 : $status_cron${NC}"
echo -e "${GREEN} » ${NC}Service Nginx Webserver       : $status_nginx${NC}"
echo -e "${GREEN} » ${NC}Service Xray Vmess WS TLS     : $status_ss${NC}"
echo -e "${GREEN} » ${NC}Service Xray Vmess WS Non TLS : $status_ss${NC}"
echo -e "${GREEN} » ${NC}Service Xray Vmess gRPC       : $status_ss${NC}"
echo -e "${GREEN} » ${NC}Service Xray Vless WS TLS     : $status_ss${NC}"
echo -e "${GREEN} » ${NC}Service Xray Vless WS Non TLS : $status_ss${NC}"
echo -e "${GREEN} » ${NC}Service Xray Vless gRPC       : $status_ss${NC}"
echo -e "${GREEN} » ${NC}Service Xray Trojan WS        : $status_ss${NC}"
echo -e "${GREEN} » ${NC}Service Xray Trojan Non WS    : $status_ss${NC}"
echo -e "${GREEN} » ${NC}Service Xray Trojan gRPC      : $status_ss${NC}"
echo -e "${GREEN} » ${NC}Service Xray Shadow WS TLS    : $status_ss${NC}"
echo -e "${GREEN} » ${NC}Service Xray Shadow WS NonTLS : $status_ss${NC}"
echo -e "${GREEN} » ${NC}Service Xray Shadow gRPC      : $status_ss${NC}"
echo -e "${GREEN} » ${NC}Service Iptables              : $status_galo${NC}"
echo -e "${GREEN} » ${NC}Service RClocal               : $status_galoo${NC}"
echo -e "${GREEN} » ${NC}Service Autoreboot            : $status_galooo${NC}"
echo -e "${ORANGE} ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e ""
read -n 1 -s -r -p " Press any key to back on menu"
menu
