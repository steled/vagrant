# Vagrant project

This is a Vagrant project that deploys 2 Hyper-V VMs for working with ansible.

## Usage
`vagrant up --parallel`

## Description
- deploys one Hyper-V VM called `ansible` based on Centos 7
- deploys one Hyper-V VM called `worker` based on Centos 7

### ansible
- copy ansible folder
- copy private key and set permissions
- copy public key and append to authorized_keys
- install EPEL packages
- install ansible
- configuration for first ansible run
    - set path to ansible files
    - set ansible playbook
    - limit playbook run

### worker
- copy publickey and append to authorized_keys
- install EPEL packages