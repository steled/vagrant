#!/bin/bash -ex

if (( $EUID != 0 )); then
  echo "Please run as root"
  exit
fi

kubeadm init --pod-network-cidr=10.244.0.0/16 &

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