#!/bin/bash
#
# Installs docker on a linux host
#
# To run, call as root:
# bash <(curl -sL https://github.com/carterx86/handy-scripts/raw/master/install-docker.sh)
#

function InstallDocker() {
    apt update
    apt-get install -y ca-certificates curl gnupg lsb-release
    curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
    apt update
    apt-get install -y docker-ce docker-ce-cli containerd.io
}


if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

InstallDocker

exit
