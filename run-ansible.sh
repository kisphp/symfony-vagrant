#!/usr/bin/env bash

ansible-playbook -i vagrant.ini setup-vagrant.yml -u ubuntu $@
