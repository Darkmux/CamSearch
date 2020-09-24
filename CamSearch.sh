#!/bin/bash
#
# Created by: Informatic_in_Termux
#
# VARIABLES
#
PWD=$(pwd)
source ${PWD}/Colors.sh
#
# FUNCIONES
#
function CamSearch {
	sleep 0.5
	clear
echo -e "${verde}
  ▄▄            ▗▄▖                     ▗▖
 █▀▀▌          ▗▛▀▜                     ▐▌
▐▛    ▟██▖▐█▙█▖▐▙    ▟█▙  ▟██▖ █▟█▌ ▟██▖▐▙██▖
▐▌    ▘▄▟▌▐▌█▐▌ ▜█▙ ▐▙▄▟▌ ▘▄▟▌ █▘  ▐▛  ▘▐▛ ▐▌
▐▙   ▗█▀▜▌▐▌█▐▌   ▜▌▐▛▀▀▘▗█▀▜▌ █   ▐▌   ▐▌ ▐▌
 █▄▄▌▐▙▄█▌▐▌█▐▌▐▄▄▟▘▝█▄▄▌▐▙▄█▌ █   ▝█▄▄▌▐▌ ▐▌
  ▀▀  ▀▀▝▘▝▘▀▝▘ ▀▀▘  ▝▀▀  ▀▀▝▘ ▀    ▝▀▀ ▝▘ ▝▘"${blanco}
}
function requirements {
if [ -x ${PREFIX}/bin/shodan ]
then
echo -e -n "${verde}
┌══════════════┐
█ ${blanco}SHODAN TOKEN ${verde}█
└══════════════┘
┃
└═>>> "${blanco}
read -r shodan_token
sleep 0.5
else
echo -e "${verde}
┌══════════════════════┐
█ ${blanco}Instalando shodan... ${verde}█
└══════════════════════┘
"${blanco}
pkg install -y python
pip install --upgrade pip
easy_install shodan
pip install shodan requests
echo -e -n "${verde}
┌══════════════┐
█ ${blanco}SHODAN TOKEN ${verde}█
└══════════════┘
┃
└═>>> "${blanco}
read -r shodan_token
shodan init ${shodan_token}
fi
if [ -x ${PREFIX}/bin/msfconsole ]
then
sleep 0.1
else
echo -e "${verde}
┌══════════════════════════┐
█ ${blanco}Instalando metasploit... ${verde}█
└══════════════════════════┘
"${blanco}
pkg install -y ruby
pkg install -y unstable-repo
pkg install -y metasploit
fi
}
function shodanexploit {
	CamSearch
echo -e "${verde}
┌═════════════════════════════════════┐
█ ${blanco}Buscando Cámaras Web Vulnerables... ${verde}█
└═════════════════════════════════════┘
"${blanco}
msfconsole -q -x "use auxiliary/gather/shodan_search;set SHODAN_APIKEY ${shodan_token};set QUERY 'Digital watchdog';exploit"
}
#
# CÓDIGO
#
requirements
shodanexploit
