clear
red='\033[0;31m'
green='\033[0;32m'
yellow='\033[0;33m'
plain='\033[0m'
blue='\033[0;34m'
ungu='\033[0;35m'
Green="\033[32m"
Red="\033[31m"
WhiteB="\e[5;37m"
BlueCyan="\e[5;36m"
Green_background="\033[42;37m"
Red_background="\033[41;37m"
Suffix="\033[0m"
echo ""
echo -e "${ungu}++++++++++++++++++++++++++++++++++++++++++++"
echo -e
echo -e "${BlueCyan}              Menu Theme                   "
echo -e "${BlueCyan}          pilih tampilan menu yang ada "
echo -e
echo -e "${ungu}++++++++++++++++++++++++++++++++++++++++++++"
echo
echo
echo -e "${BlueCyan}Pilih Nomor: "
echo
echo "1).Tampilan Menu ke 1"
echo "2).Tampilan Menu ke 2"
echo "3).Tampilan Menu ke 3"
echo "4).Tampilan Menu ke 4"
echo "5).Tampilan Menu ke 5"
echo
echo -e "${ungu}++++++++++++++++++++++++++++++++++++++++++++"
echo
echo -e "${BlueCyan}"
read -p    "Pilih nomor └╼>>>    " bro
if [ $bro = 1 ] || [ $bro = 1 ]
then
figlet "theme-1" | lolcat
menu1
echo "--------------------------------------------------------"
echo
echo "Gemilangkinasih࿐"
echo
echo "--------------------------------------------------------"
fi
if [ $bro = 2 ] || [ $bro = 2 ]
then
figlet "Theme-2" | lolcat
menu2
echo "--------------------------------------------------------"
echo
echo "Gemilangkinasih࿐"
echo
echo "--------------------------------------------------------"
fi
if [ $bro = 3 ] || [ $bro = 3 ]
then
figlet "Theme-3"
menu3
echo "--------------------------------------------------------"
echo
echo "Gemilangkinasih࿐"
echo
echo "--------------------------------------------------------"
fi
if [ $bro = 4 ] || [ $bro = 4 ]
then
figlet "Theme-4"
menu4
echo "--------------------------------------------------------"
echo
echo "Gemilangkinasih࿐"
echo
echo "--------------------------------------------------------"
fi
if [ $bro = 5 ] || [ $bro = 5 ]
then
figlet "Theme-5"
menu5
echo "--------------------------------------------------------"
echo
echo "Gemilangkinasih࿐"
echo
echo "--------------------------------------------------------"
fi
