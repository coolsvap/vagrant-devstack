#!/bin/bash

sudo yum update -y && \
    yum install git -y

sudo -u vagrant -i bash -c \
    "cd /home/vagrant && \
    git clone https://git.openstack.org/openstack-dev/devstack"

TAG_FILENAME="/vagrant/.tag"
BRANCH_FILENAME="/vagrant/.branch"
if [ -f $TAG_FILENAME ]; then
    sudo -u vagrant -i bash -c \
        "cd /home/vagrant/devstack && git checkout tags/`cat $TAG_FILENAME`"
fi
if [ -f $BRANCH_FILENAME ]; then
    sudo -u vagrant -i bash -c \
        "cd /home/vagrant/devstack && git checkout `cat $BRANCH_FILENAME`"
fi

LOCAL_CONF_DEVSTACK="/vagrant/local.conf"
if [ -f $LOCAL_CONF_DEVSTACK ]; then
    cp $LOCAL_CONF_DEVSTACK /home/vagrant/devstack/local.conf
fi

sudo -u vagrant -i bash -c "cd /home/vagrant/devstack && ./stack.sh"
