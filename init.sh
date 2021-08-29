#!/usr/bin/env bash

# This script assumes you already have ansible installed
ansible-galaxy collection install community.general

# The dconf module (used by the gnome role) requires this python library to be present
pip install psutil --upgrade

ansible-playbook 'local.yaml'
