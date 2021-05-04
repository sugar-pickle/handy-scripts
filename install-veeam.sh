#!/bin/bash
#
# To run, call as root:
# bash <(curl -sL https://github.com/sugar-pickle/handy-scripts/raw/master/install-veeam.sh)
#


function InstallVeeam {
    wget -O /tmp/veeamrepo.deb https://download2.veeam.com/veeam-release-deb_1.0.7_amd64.deb
    dpkg -i /tmp/veeamrepo.deb
    apt update
    apt install -y veeam nfs-common
}

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

InstallVeeam

exit
