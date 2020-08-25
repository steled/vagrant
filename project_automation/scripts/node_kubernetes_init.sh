#!/bin/bash -ex

MASTER_IP="172.100.17.11"
TOKEN=$1
HASH=$2


if (( $EUID != 0 )); then
  echo "Please run as root"
  exit
fi

kubeadm join $MASTER_IP:6443 --token $TOKEN --discovery-token-ca-cert-hash sha256:$HASH &

bg_pid=$!
trap "kill -2 $bg_pid" 2

while [ ! -f /var/lib/kubelet/config.yaml ]
do
  sleep 2
done

sh -c "echo 'cgroupDriver: systemd' >> /var/lib/kubelet/config.yaml"
systemctl daemon-reload
systemctl restart kubelet

wait $bg_pid