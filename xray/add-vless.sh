#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
#########################



clear
source /var/lib/scrz-prem/ipvps.conf
if [[ "$IP" = "" ]]; then
domain=$(cat /etc/xray/domain)
else
domain=$IP
fi
tls="$(cat ~/log-install.txt | grep -w "Vless TLS" | cut -d: -f2|sed 's/ //g')"
none="$(cat ~/log-install.txt | grep -w "Vless None TLS" | cut -d: -f2|sed 's/ //g')"
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
echo -e "\033[0;34m┌─────────────────────────────────────────────────┐\033[0m"
echo -e "\E[44;1;39m              Create Xray/Vless Account            \E[0m"
echo -e "\033[0;34m└─────────────────────────────────────────────────┘\033[0m"

		read -rp "User: " -e user
		CLIENT_EXISTS=$(grep -w $user /etc/xray/config.json | wc -l)

		if [[ ${CLIENT_EXISTS} == '1' ]]; then
clear
		echo -e "\033[0;34mт┌─────────────────────────────────────────────────┐\033[0m"
		echo -e "\E[44;1;39m              Create Xray/Vless Account             \E[0m"
		echo -e "\033[0;34mт└─────────────────────────────────────────────────┘\033[0m"
			echo ""
			echo "A client with the specified name was already created, please choose another name."
			echo ""
			read -n 1 -s -r -p "Press any key to back on menu"
			v2ray-menu
		fi
	done

uuid=$(cat /proc/sys/kernel/random/uuid)
read -p "Expired (days): " masaaktif
read -p "Limit User (GB): " Quota
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#vless$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json
sed -i '/#vlessgrpc$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json
vlesslink1="vless://${uuid}@${domain}:$tls?path=/vless&security=tls&encryption=none&type=ws#${user}"
vlesslink2="vless://${uuid}@${domain}:$none?path=/vless&encryption=none&type=ws#${user}"
vlesslink3="vless://${uuid}@${domain}:$tls?mode=gun&security=tls&encryption=none&type=grpc&serviceName=vless-grpc&sni=bug.com#${user}"
systemctl restart xray
clear
echo -e "${BIBlue}═══════════XRAY/VLESS═══════════${NC}"
echo -e "${BIBlue}════════════════════════════════${NC}"
echo -e "Remarks       : ${user}" 
echo -e "User Quota    : ${Quota} GB" 
echo -e "Expired On    : $exp" 
echo -e "Domain        : ${domain}" 
echo -e "port TLS      : $tls" 
echo -e "port none TLS : $none"
echo -e "port GRPC     : $tls" 
echo -e "id            : ${uuid}"
echo -e "Encryption    : none" 
echo -e "Network       : ws" 
echo -e "Path          : /vless" 
echo -e "Path          : vless-grpc"  
echo -e "${BIBlue}════════════════════════════════${NC}"
echo -e "Link TLS :"
echo -e "${vlesslink1}" 
echo -e "${BIBlue}════════════════════════════════${NC}"   
echo -e "Link none TLS : "
echo -e "${vlesslink2}" 
echo -e "${BIBlue}════════════════════════════════${NC}"
echo -e "Link GRPC : "
echo -e "${vlesslink3}" 
echo -e "${BIBlue}════════════════════════════════${NC}" 
echo -e "${BICyan}Premium VPN Auto Script Service${NC}" 
echo -e ""
read -n 1 -s -r -p "Press any key to back on menu"

menu
