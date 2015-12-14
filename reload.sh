#!/usr/bin/env bash

source core.sh

unmount_stack
vagrant reload
mount_stack
rejoin_stack
