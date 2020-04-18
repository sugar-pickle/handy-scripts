#!/bin/bash

function InstallVeeam {
    wget -O /tmp/veeamrepo.deb https://download2.veeam.com/veeam-release-deb_1.0.7_amd64.deb
    dpkg -i /tmp/veeamrepo.deb
    apt update
    apt install -y veeam nfs-common
}



if (whoami != root)
  then echo "Please run as root"

  else (InstallVeeam)
fi

exit