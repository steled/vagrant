# Ansible Role: docker

This role installs docker and all of its dependencies.

## Usage
`ansible-playbook /tmp/ansible/docker.yml -b`

## Description
- add docker gpg key and repository 
- install docker, docker-cli, containerd.io
- ensure that docker is started and enabled at boot
- install docker-compose if wanted
- configure user for docker if wanted

## Source
- https://github.com/geerlingguy/ansible-role-docker
- https://docs.docker.com/install/linux/docker-ce/centos/
- https://docs.docker.com/compose/install/
- https://docs.docker.com/install/linux/linux-postinstall/