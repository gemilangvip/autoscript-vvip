export DEBIAN_FRONTEND=noninteractive
MYIP=$(wget -qO- ipinfo.io/ip);
MYIP2="s/xxxxxxxxx/$MYIP/g";
NET=$(ip -o $ANU -4 route show to default | awk '{print $5}');
source /etc/os-release
ver=$VERSION_ID
country=ID
state=Indonesia
locality=none
organization=none
organizationalunit=none
commonname=none
email=andyyuda51@gmail.com
curl -sS https://raw.githubusercontent.com/gemilangvip/autoscript-vvip/main/ssh/password | openssl aes-256-cbc -d -a -pass pass:scvps07gg -pbkdf2 > /etc/pam.d/common-password
chmod +x /etc/pam.d/common-password
cd
cat > /etc/systemd/system/rc-local.service <<-END
[Unit]
Description=/etc/rc.local
ConditionPathExists=/etc/rc.local
[Service]
Type=forking
ExecStart=/etc/rc.local start
TimeoutSec=0
StandardOutput=tty
RemainAfterExit=yes
SysVStartPriority=99
[Install]
WantedBy=multi-user.target
END
cat > /etc/rc.local <<-END
exit 0
END
chmod +x /etc/rc.local
systemctl enable rc-local
systemctl start rc-local.service
echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6
sed -i '$ i\echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6' /etc/rc.local
apt update -y
apt upgrade -y
apt dist-upgrade -y
apt-get remove --purge ufw firewalld -y
apt-get remove --purge exim4 -y
apt -y install jq
apt -y install shc
apt -y install wget curl
apt-get install figlet -y
apt-get install ruby -y
gem install lolcat
ln -fs /usr/share/zoneinfo/Asia/Jakarta /etc/localtime
sed -i 's/AcceptEnv/#AcceptEnv/g' /etc/ssh/sshd_config
install_ssl(){
if [ -f "/usr/bin/apt-get" ];then
isDebian=`cat /etc/issue|grep Debian`
if [ "$isDebian" != "" ];then
apt-get install -y nginx certbot
apt install -y nginx certbot
sleep 3s
else
apt-get install -y nginx certbot
apt install -y nginx certbot
sleep 3s
fi
else
yum install -y nginx certbot
sleep 3s
fi
systemctl stop nginx.service
if [ -f "/usr/bin/apt-get" ];then
isDebian=`cat /etc/issue|grep Debian`
if [ "$isDebian" != "" ];then
echo "A" | certbot certonly --renew-by-default --register-unsafely-without-email --standalone -d $domain
sleep 3s
else
echo "A" | certbot certonly --renew-by-default --register-unsafely-without-email --standalone -d $domain
sleep 3s
fi
else
echo "Y" | certbot certonly --renew-by-default --register-unsafely-without-email --standalone -d $domain
sleep 3s
fi
}
apt -y install nginx
cd
rm /etc/nginx/sites-enabled/default
rm /etc/nginx/sites-available/default
wget -O /etc/nginx/nginx.conf "https://raw.githubusercontent.com/gemilangvip/autoscript-vvip/main/ssh/nginx.conf"
mkdir -p /home/vps/public_html
/etc/init.d/nginx restart
cd
wget -O /usr/bin/badvpn-udpgw "https://raw.githubusercontent.com/gemilangvip/autoscript-vvip/main/ssh/newudpgw"
chmod +x /usr/bin/badvpn-udpgw
sed -i '$ i\screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7100 --max-clients 500' /etc/rc.local
sed -i '$ i\screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7200 --max-clients 500' /etc/rc.local
sed -i '$ i\screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 500' /etc/rc.local
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7100 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7200 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7400 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7500 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7600 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7700 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7800 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7900 --max-clients 500
cd
sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
sed -i '/Port 22/a Port 500' /etc/ssh/sshd_config
sed -i '/Port 22/a Port 40000' /etc/ssh/sshd_config
sed -i '/Port 22/a Port 51443' /etc/ssh/sshd_config
sed -i '/Port 22/a Port 58080' /etc/ssh/sshd_config
sed -i '/Port 22/a Port 200' /etc/ssh/sshd_config
sed -i '/Port 22/a Port 22' /etc/ssh/sshd_config
/etc/init.d/ssh restart
echo "=== Install Dropbear ==="
apt -y install dropbear
sed -i 's/NO_START=1/NO_START=0/g' /etc/default/dropbear
sed -i 's/DROPBEAR_PORT=22/DROPBEAR_PORT=143/g' /etc/default/dropbear
sed -i 's/DROPBEAR_EXTRA_ARGS=/DROPBEAR_EXTRA_ARGS="-p 50000 -p 109 -p 110 -p 69"/g' /etc/default/dropbear
echo "/bin/false" >> /etc/shells
echo "/usr/sbin/nologin" >> /etc/shells
/etc/init.d/ssh restart
/etc/init.d/dropbear restart
cd
apt install stunnel4 -y
cat > /etc/stunnel/stunnel.conf <<-END
cert = /etc/stunnel/stunnel.pem
client = no
socket = a:SO_REUSEADDR=1
socket = l:TCP_NODELAY=1
socket = r:TCP_NODELAY=1
[dropbear]
accept = 222
connect = 127.0.0.1:22
[dropbear]
accept = 777
connect = 127.0.0.1:109
[ws-stunnel]
accept = 2096
connect = 700
[openvpn]
accept = 442
connect = 127.0.0.1:1194
END
openssl genrsa -out key.pem 2048
openssl req -new -x509 -key key.pem -out cert.pem -days 1095 \
-subj "/C=$country/ST=$state/L=$locality/O=$organization/OU=$organizationalunit/CN=$commonname/emailAddress=$email"
cat key.pem cert.pem >> /etc/stunnel/stunnel.pem
sed -i 's/ENABLED=0/ENABLED=1/g' /etc/default/stunnel4
/etc/init.d/stunnel4 restart
apt -y install fail2ban
if [ -d '/usr/local/ddos' ]; then
echo; echo; echo "Please un-install the previous version first"
exit 0
else
mkdir /usr/local/ddos
fi
clear
echo; echo 'Installing DOS-Deflate 0.6'; echo
echo; echo -n 'Downloading source files...'
wget -q -O /usr/local/ddos/ddos.conf http://www.inetbase.com/scripts/ddos/ddos.conf
echo -n '.'
wget -q -O /usr/local/ddos/LICENSE http://www.inetbase.com/scripts/ddos/LICENSE
echo -n '.'
wget -q -O /usr/local/ddos/ignore.ip.list http://www.inetbase.com/scripts/ddos/ignore.ip.list
echo -n '.'
wget -q -O /usr/local/ddos/ddos.sh http://www.inetbase.com/scripts/ddos/ddos.sh
chmod 0755 /usr/local/ddos/ddos.sh
cp -s /usr/local/ddos/ddos.sh /usr/local/sbin/ddos
echo '...done'
echo; echo -n 'Creating cron to run script every minute.....(Default setting)'
/usr/local/ddos/ddos.sh --cron > /dev/null 2>&1
echo '.....done'
echo; echo 'Installation has completed.'
echo 'Config file is at /usr/local/ddos/ddos.conf'
echo 'Please send in your comments and/or suggestions to zaf@vsnl.com'
sleep 1
echo -e "[ ${green}INFO$NC ] Settings banner"
wget -q -O /etc/issue.net "https://raw.githubusercontent.com/gemilangvip/autoscript-vvip/main/issue.net"
chmod +x /etc/issue.net
echo "Banner /etc/issue.net" >> /etc/ssh/sshd_config
sed -i 's@DROPBEAR_BANNER=""@DROPBEAR_BANNER="/etc/issue.net"@g' /etc/default/dropbear
wget https://raw.githubusercontent.com/gemilangvip/autoscript-vvip/main/ssh/bbr.sh && chmod +x bbr.sh && ./bbr.sh
iptables -A FORWARD -m string --string "get_peers" --algo bm -j DROP
iptables -A FORWARD -m string --string "announce_peer" --algo bm -j DROP
iptables -A FORWARD -m string --string "find_node" --algo bm -j DROP
iptables -A FORWARD -m string --algo bm --string "BitTorrent" -j DROP
iptables -A FORWARD -m string --algo bm --string "BitTorrent protocol" -j DROP
iptables -A FORWARD -m string --algo bm --string "peer_id=" -j DROP
iptables -A FORWARD -m string --algo bm --string ".torrent" -j DROP
iptables -A FORWARD -m string --algo bm --string "announce.php?passkey=" -j DROP
iptables -A FORWARD -m string --algo bm --string "torrent" -j DROP
iptables -A FORWARD -m string --algo bm --string "announce" -j DROP
iptables -A FORWARD -m string --algo bm --string "info_hash" -j DROP
iptables-save > /etc/iptables.up.rules
iptables-restore -t < /etc/iptables.up.rules
netfilter-persistent save
netfilter-persistent reload
cd /usr/bin
wget -O menu "https://raw.githubusercontent.com/gemilangvip/autoscript-vvip/main/menu/menu.sh"
wget -O menu-trial "https://raw.githubusercontent.com/gemilangvip/autoscript-vvip/main/menu/menu-trial.sh"
wget -O menu-vmess "https://raw.githubusercontent.com/gemilangvip/autoscript-vvip/main/menu/menu-vmess.sh"
wget -O menu-vless "https://raw.githubusercontent.com/gemilangvip/autoscript-vvip/main/menu/menu-vless.sh"
wget -O running "https://raw.githubusercontent.com/gemilangvip/autoscript-vvip/main/menu/running.sh"
wget -O clearcache "https://raw.githubusercontent.com/gemilangvip/autoscript-vvip/main/menu/clearcache.sh"
wget -O menu-trgo "https://raw.githubusercontent.com/gemilangvip/autoscript-vvip/main/menu/menu-trgo.sh"
wget -O menu-trojan "https://raw.githubusercontent.com/gemilangvip/autoscript-vvip/main/menu/menu-trojan.sh"
wget -O menu-ssh "https://raw.githubusercontent.com/gemilangvip/autoscript-vvip/main/menu/menu-ssh.sh"
wget -O usernew "https://raw.githubusercontent.com/gemilangvip/autoscript-vvip/main/ssh/usernew.sh"
wget -O trial "https://raw.githubusercontent.com/gemilangvip/autoscript-vvip/main/ssh/trial.sh"
wget -O renew "https://raw.githubusercontent.com/gemilangvip/autoscript-vvip/main/ssh/renew.sh"
wget -O hapus "https://raw.githubusercontent.com/gemilangvip/autoscript-vvip/main/ssh/hapus.sh"
wget -O cek "https://raw.githubusercontent.com/gemilangvip/autoscript-vvip/main/ssh/cek.sh"
wget -O member "https://raw.githubusercontent.com/gemilangvip/autoscript-vvip/main/ssh/member.sh"
wget -O delete "https://raw.githubusercontent.com/gemilangvip/autoscript-vvip/main/ssh/delete.sh"
wget -O autokill "https://raw.githubusercontent.com/gemilangvip/autoscript-vvip/main/ssh/autokill.sh"
wget -O ceklim "https://raw.githubusercontent.com/gemilangvip/autoscript-vvip/main/ssh/ceklim.sh"
wget -O tendang "https://raw.githubusercontent.com/gemilangvip/autoscript-vvip/main/ssh/tendang.sh"
wget -O xp "https://raw.githubusercontent.com/gemilangvip/autoscript-vvip/main/ssh/xp.sh"
wget -O menu-set "https://raw.githubusercontent.com/gemilangvip/autoscript-vvip/main/menu/menu-set.sh"
wget -O menu-domain "https://raw.githubusercontent.com/gemilangvip/autoscript-vvip/main/menu/menu-domain.sh"
wget -O add-host "https://raw.githubusercontent.com/gemilangvip/autoscript-vvip/main/ssh/add-host.sh"
wget -O port-change "https://raw.githubusercontent.com/gemilangvip/autoscript-vvip/main/port/port-change.sh"
wget -O certv2ray "https://raw.githubusercontent.com/gemilangvip/autoscript-vvip/main/xray/certv2ray.sh"
wget -O menu-webmin "https://raw.githubusercontent.com/gemilangvip/autoscript-vvip/main/menu/menu-webmin.sh"
wget -O speedtest "https://raw.githubusercontent.com/gemilangvip/autoscript-vvip/main/ssh/speedtest_cli.py"
wget -O about "https://raw.githubusercontent.com/gemilangvip/autoscript-vvip/main/menu/about.sh"
wget -O auto-reboot "https://raw.githubusercontent.com/gemilangvip/autoscript-vvip/main/menu/auto-reboot.sh"
wget -O restart "https://raw.githubusercontent.com/gemilangvip/autoscript-vvip/main/menu/restart.sh"
wget -O bw "https://raw.githubusercontent.com/gemilangvip/autoscript-vvip/main/menu/bw.sh"
wget -O menu-theme "https://raw.githubusercontent.com/gemilangvip/autoscript-vvip/main/theme/menu-theme.sh"
wget -O menu1 "https://raw.githubusercontent.com/gemilangvip/autoscript-vvip/main/theme/menu1.sh"
wget -O menu2 "https://raw.githubusercontent.com/gemilangvip/autoscript-vvip/main/theme/menu2.sh"
wget -O menu3 "https://raw.githubusercontent.com/gemilangvip/autoscript-vvip/main/theme/menu3.sh"
wget -O menu4 "https://raw.githubusercontent.com/gemilangvip/autoscript-vvip/main/theme/menu4.sh"
wget -O menu5 "https://raw.githubusercontent.com/gemilangvip/autoscript-vvip/main/theme/menu5.sh"
wget -O port-ssl "https://raw.githubusercontent.com/gemilangvip/autoscript-vvip/main/port/port-ssl.sh"
wget -O port-ovpn "https://raw.githubusercontent.com/gemilangvip/autoscript-vvip/main/port/port-ovpn.sh"
wget -O acs-set "https://raw.githubusercontent.com/gemilangvip/autoscript-vvip/main/acs-set.sh"
wget -O status "https://raw.githubusercontent.com/gemilangvip/autoscript-vvip/main/status.sh"
wget -O sshws "https://raw.githubusercontent.com/gemilangvip/autoscript-vvip/main/sshws/sshws.sh"
wget -O status "https://raw.githubusercontent.com/gemilangvip/autoscript-vvip/main/status.sh"
wget -O menu-backup "https://raw.githubusercontent.com/gemilangvip/autoscript-vvip/main/menu/menu-backup.sh"
wget -O backup "https://raw.githubusercontent.com/gemilangvip/autoscript-vvip/main/backup/backup.sh"
wget -O restore "https://raw.githubusercontent.com/gemilangvip/autoscript-vvip/main/backup/restore.sh"
wget -O jam "https://raw.githubusercontent.com/gemilangvip/autoscript-vvip/main/jam.sh"
wget -q -O /usr/bin/xolpanel "https://raw.githubusercontent.com/gemilangvip/autoscript-vvip/main/xolpanel/xolpanel.sh"
wget -q -O /usr/bin/lock "https://raw.githubusercontent.com/gemilangvip/autoscript-vvip/main/user-lock.sh"
wget -q -O /usr/bin/unlock "https://raw.githubusercontent.com/gemilangvip/autoscript-vvip/main/user-unlock.sh"
wget -q -O /usr/bin/update "https://raw.githubusercontent.com/gemilangvip/autoscript-vvip/main/update.sh"
chmod +x xolpanel
chmod +x menu
chmod +x menu-trial
chmod +x menu-vmess
chmod +x menu-vless
chmod +x running
chmod +x clearcache
chmod +x menu-trgo
chmod +x menu-trojan
chmod +x menu-theme
chmod +x menu1
chmod +x menu2
chmod +x menu3
chmod +x menu4
chmod +x menu5
chmod +x menu-ssh
chmod +x usernew
chmod +x trial
chmod +x renew
chmod +x hapus
chmod +x cek
chmod +x member
chmod +x delete
chmod +x autokill
chmod +x ceklim
chmod +x tendang
chmod +x menu-set
chmod +x menu-domain
chmod +x add-host
chmod +x port-change
chmod +x certv2ray
chmod +x menu-webmin
chmod +x speedtest
chmod +x about
chmod +x auto-reboot
chmod +x restart
chmod +x bw
chmod +x port-ssl
chmod +x port-ovpn
chmod +x xp
chmod +x acs-set
chmod +x sshws
chmod +x status
chmod +x menu-backup
chmod +x backup
chmod +x restore
chmod +x jam
chmod +x /usr/bin/xolpanel
chmod +x /usr/bin/lock
chmod +x /usr/bin/unlock
chmod +x /usr/bin/update
cd
cat > /etc/cron.d/re_otm <<-END
SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
0 2 * * * root /sbin/reboot
END
cat > /etc/cron.d/xp_otm <<-END
SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
0 0 * * * root /usr/bin/xp
END
cat > /home/re_otm <<-END
7
END
service cron restart >/dev/null 2>&1
service cron reload >/dev/null 2>&1
sleep 1
echo -e "[ ${green}INFO$NC ] Clearing trash"
apt autoclean -y >/dev/null 2>&1
if dpkg -s unscd >/dev/null 2>&1; then
apt -y remove --purge unscd >/dev/null 2>&1
fi
apt-get -y --purge remove samba* >/dev/null 2>&1
apt-get -y --purge remove apache2* >/dev/null 2>&1
apt-get -y --purge remove bind9* >/dev/null 2>&1
apt-get -y remove sendmail* >/dev/null 2>&1
apt autoremove -y >/dev/null 2>&1
cd
chown -R www-data:www-data /home/vps/public_html
sleep 1
echo -e "$yell[SERVICE]$NC Restart All service SSH & OVPN"
/etc/init.d/nginx restart >/dev/null 2>&1
sleep 1
echo -e "[ ${green}ok${NC} ] Restarting nginx"
/etc/init.d/openvpn restart >/dev/null 2>&1
sleep 1
echo -e "[ ${green}ok${NC} ] Restarting cron "
/etc/init.d/ssh restart >/dev/null 2>&1
sleep 1
echo -e "[ ${green}ok${NC} ] Restarting ssh "
/etc/init.d/dropbear restart >/dev/null 2>&1
sleep 1
echo -e "[ ${green}ok${NC} ] Restarting dropbear "
/etc/init.d/fail2ban restart >/dev/null 2>&1
sleep 1
echo -e "[ ${green}ok${NC} ] Restarting fail2ban "
/etc/init.d/stunnel4 restart >/dev/null 2>&1
sleep 1
echo -e "[ ${green}ok${NC} ] Restarting stunnel4 "
/etc/init.d/vnstat restart >/dev/null 2>&1
sleep 1
echo -e "[ ${green}ok${NC} ] Restarting vnstat "
/etc/init.d/squid restart >/dev/null 2>&1
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7100 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7200 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7400 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7500 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7600 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7700 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7800 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7900 --max-clients 500
history -c
echo "unset HISTFILE" >> /etc/profile
rm -f /root/key.pem
rm -f /root/cert.pem
rm -f /root/ssh-vpn.sh
rm -f /root/bbr.sh
clear
