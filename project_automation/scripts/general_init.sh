#!/bin/bash -ex

# create folder, partition and mount
sudo mkdir /ext
sudo sh -c 'echo "/dev/sdb1       /ext                            ext4    defaults,noatime        0       1" >> /etc/fstab'
(echo n; echo p; echo 1; echo ; echo ; echo w) | sudo fdisk /dev/sdb
sudo mkfs.ext4 /dev/sdb1
sudo mount -a
sudo mkdir /ext/repo