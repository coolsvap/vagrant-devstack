#!/usr/bin/env bash

source core.sh

if [ -f .vagrant/machines/default/libvirt/action_provision ]; then
    vagrant_up
    mount_stack
    rejoin_stack
else
    vagrant_up
    mount_stack
fi
