#!/usr/bin/env bash

pip3 install ansible

ansible-galaxy install cimon-io.asdf

ansible-playbook 'local.yaml'
