#!/bin/bash

[ -f /proxy/proxy.env ] && source /proxy/proxy.env $1

DATE=`date +%Y-%m-%d:%H:%M:%S`


wget https://dl.fedoraproject.org/pub/epel/epel-release-latest-6.noarch.rpm
rpm -ivh epel-release-latest-6.noarch.rpm
yum install /vagrant/software/python-jinja2-2.7.2-1.el6.noarch.rpm -y

# Confirm software is install epel-release git python python-devel python-pip ansible
yum install git python python-devel python-pip ansible sshpass -y

# Add web1 and web2 to /etc/ansible/hosts
mv /etc/ansible/hosts /etc/ansible/hosts.bkp_{DATE}
echo "[web]
web1
web2" > /etc/ansible/hosts


# Add web1 and web2 to /etc/hosts
grep web1 /etc/hosts > /dev/null || echo "192.168.33.25 web1">>/etc/hosts
grep web2 /etc/hosts > /dev/null || echo "192.168.33.26 web2">>/etc/hosts


# Add ansible
useradd ansible
echo ansible | passwd --stdin ansible

# Check permissions for /etc/ansible/hosts
chown ansible /etc/ansible/hosts

# Add using visudo
echo "ansible ALL=(ALL)       NOPASSWD:ALL"| sudo EDITOR='tee -a' visudo

sudo -E -H -u ansible /vagrant/copy_keys.sh