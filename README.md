vagrant-devstack
================

Vagrantfile and scripts for managing kvm virtual machine with
[Devstack](http://docs.openstack.org/developer/devstack/). They provide VM
and SSFHS connection with */opt/stack* dir.

To run them, you need vagrant, libvirt, kvm, fuse-sshfs and
[vagrant-libvirt](https://github.com/pradels/vagrant-libvirt) plugin.

## Usage

Firstly, prepare the local.conf file. You have to define all passwords here,
because otherwise Devstack will bring up the password prompt - we don't want
it.

```
cp local.conf.example local.conf
```

You can edit this config according to
[this manual](http://docs.openstack.org/developer/devstack/configuration.html).

Then you can use scripts to manage VM with Devstack:

- `./up.sh` - starts VM (creates and provisions it if doesn't exist)
- `./reload.sh` - reboots VM
- `./halt.sh` - stops VM
- `./rejoin.sh` - shows screen with running OpenStack services if VM is turned
on

## System requirements

CentOS

```
sudo yum install @virtualization fuse-sshfs libvirt-devel

curl -O https://releases.hashicorp.com/vagrant/1.7.4/vagrant_1.7.4_x86_64.rpm

sudo yum localinstall vagrant_1.7.4_x86_64.rpm

vagrant plugin install vagrant-libvirt
```
