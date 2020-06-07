#!/bin/bash

vagrant plugin install vagrant-hosts

vagrant up

ssh-add $(vagrant ssh-config | grep IdentityFile | awk '{print $2}')
