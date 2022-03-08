#!/bin/bash
#
# Installs k8s on a linux host
#
# To run, call as root:
# bash <(curl -sL https://github.com/carterx86/handy-scripts/raw/master/install-k8s.sh)
#

function InstallK8s() {
    apt update
    apt-get install -y apt-transport-https ca-certificates curl
    curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
    echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | tee /etc/apt/sources.list.d/kubernetes.list
    apt update
    apt-get install -y kubelet kubeadm kubectl
    apt-mark hold kubelet kubeadm kubectl
}


if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

InstallK8s

exit
