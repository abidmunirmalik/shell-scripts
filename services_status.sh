#!/usr/bin/env bash
#
# Find status of services
#
clear tput
echo "======================================"
echo -e "Host:\t\033[1;33m$(hostname)\033[0m" 
echo -e "Uptime:\t\033[1;33m$(uptime | xargs | cut -d " " -f 2-4 | tr -d ",")\033[0m"
echo "======================================"

Services="salt-minion mysqld sssd telegraf nrpe puppet httpd nginx  pmm-agent collectd docker"
for Service in $Services; do
 File=/usr/lib/systemd/system/$Service.service
 if [[ -f "$File" ]]; then
  Status=$(systemctl status $Service | awk '/Active:/' | xargs | cut -d " " -f 2-)
  if [[ $(echo $Status | awk '{print $1}') == 'active' ]]; then
   echo -e "[$Service]:\t\033[1;32m$Status\033[0m"
  fi
  if [[ $(echo $Status | awk '{print $1}') == 'inactive' ]]; then
   echo -e "[$Service]:\t\033[1;36m$Status\033[0m"
  fi
 else
  echo -e "[$Service]:\t\033[1;31mnot found\033[0m"
 fi
done
