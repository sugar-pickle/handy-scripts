#!/bin/bash
#
# Installs and configures the zabbix agent on a linux host
#
# To run, call as root:
# bash <(curl -sL https://github.com/sugar-pickle/handy-scripts/raw/master/install-zabbix-agent2.sh)
#

function InstallZabbix() {
  wget https://repo.zabbix.com/zabbix/6.4/debian/pool/main/z/zabbix-release/zabbix-release_6.4-1+debian11_all.deb
  dpkg -i zabbix-release_6.4-1+debian11_all.deb
  rm zabbix-release_6.4-1+debian11_all.deb
  apt update
  apt remove zabbix-agent -y
  apt install -y zabbix-agent2

  sed -i -e "s/# EnableRemoteCommands=0/EnableRemoteCommands=1/g" /etc/zabbix/zabbix_agent2.conf
  sed -i -e "s/Server=127.0.0.1/Server=10.88.7.10/g" /etc/zabbix/zabbix_agent2.conf
  sed -i -e "s/ServerActive=127.0.0.1/ServerActive=10.88.7.10/g" /etc/zabbix/zabbix_agent2.conf
  systemctl restart zabbix-agent2
  systemctl enable zabbix-agent2
}


if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

InstallZabbix

exit
