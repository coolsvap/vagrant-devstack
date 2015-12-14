#!/usr/bin/env bash

function vagrant_up {
    cp local.conf.example local.conf
    vagrant up --provider=libvirt
    rm local.conf
}

function mount_stack {
    if [ ! -d "stack" ]; then
        mkdir stack
    fi
    ip=$(vagrant ssh -c "ip address show eth0 | grep 'inet ' | sed -e 's/^.*inet //' -e 's/\/.*$//'")
    sshfs -o nonempty -o \
        IdentityFile=$HOME/.vagrant.d/insecure_private_key \
        vagrant@$ip:/opt/stack stack
}

function unmount_stack {
    fusermount -u stack
}

function rejoin_stack {
    vagrant ssh -c "cd devstack && ./rejoin-stack.sh"
}
