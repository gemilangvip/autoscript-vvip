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
RED="\033[31m"
YELLOW="\033[33m"
NC='\e[0m'
YELL='\033[0;33m'
BRED='\033[1;31m'
GREEN='\033[0;32m'
ORANGE='\033[33m'
BGWHITE='\e[0;100;37m'

# Getting
MYIP=$(wget -qO- ipinfo.io/ip);
clear
echo -e " \033[0;33m ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e " ${NC} ${BGWHITE}              List Member SSH OPENVPN             ${NC}"
echo -e " \033[0;33m ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "  USERNAME          EXP DATE          STATUS"
echo -e " \033[0;33m ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
while read expired
do
AKUN="$(echo $expired | cut -d: -f1)"
ID="$(echo $expired | grep -v nobody | cut -d: -f3)"
exp="$(chage -l $AKUN | grep "Account expires" | awk -F": " '{print $2}')"
status="$(passwd -S $AKUN | awk '{print $2}' )"
if [[ $ID -ge 1000 ]]; then
if [[ "$status" = "L" ]]; then
printf "%-17s %2s %-17s %2s \n" "  $AKUN" "$exp     " "LOCKED"
else
printf "%-17s %2s %-17s %2s \n" "  $AKUN" "$exp     " "UNLOCKED"
fi
fi
done < /etc/passwd
echo -e " \033[0;33m ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e " ${NC} ${BGWHITE}         Masukan Username Akun SSH OPENVPN        ${NC}"
echo -e " \033[0;33m ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
read -p "  Username   : " User
egrep "^$User" /etc/passwd >/dev/null
if [ $? -eq 0 ]; then
read -p "  Day Extend : " Days
Today=`date +%s`
Days_Detailed=$(( $Days * 86400 ))
Expire_On=$(($Today + $Days_Detailed))
Expiration=$(date -u --date="1970-01-01 $Expire_On sec GMT" +%Y/%m/%d)
Expiration_Display=$(date -u --date="1970-01-01 $Expire_On sec GMT" '+%d %b %Y')
passwd -u $User
usermod -e  $Expiration $User
egrep "^$User" /etc/passwd >/dev/null
echo -e "$Pass\n$Pass\n"|passwd $User &> /dev/null
clear
echo -e " \033[0;33m ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e " ${NC} ${BGWHITE}             Perpanjang Masa Aktif SSH            ${NC}"
echo -e " \033[0;33m ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e ""
echo -e " ${GREEN} Username   : $User"
echo -e " ${GREEN} Days Added : $Days Days"
echo -e " ${GREEN} Expires on : $Expiration_Display"
echo -e ""
echo -e " \033[0;33m ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e ""
read -n 1 -s -r -p "  Press any key to back"
menu

else
clear
echo -e " \033[0;33m ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e " ${NC} ${BGWHITE}             Perpanjang Masa Aktif SSH            ${NC}"
echo -e " \033[0;33m ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e " ${NC} ${RED}» Username Tidak Ditemukan !"
echo -e " \033[0;33m ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e ""
read -n 1 -s -r -p "  Press any key to back"
menu
fi
