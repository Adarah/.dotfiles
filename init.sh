#!/usr/bin/env bash

# This script assumes you already have ansible installed
ansible-galaxy collection install community.general

# dconf requires this python library to be present
pip install psutil

ansible-playbook 'local.yaml'
