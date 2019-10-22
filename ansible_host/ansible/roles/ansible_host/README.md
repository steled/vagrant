# Ansible Role: ansible_host

This role configures the ansible host.

## Usage
- is applied at `vagrant up`

## Description
- copy inventory file
- update the `ansible.cfg` file
    - set inventory file
    - set roles path
    - disable SSH key host checking
    - set private key path