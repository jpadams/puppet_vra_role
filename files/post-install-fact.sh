#!/bin/bash

export PATH=$PATH:/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin

#Obtain ROLE and MASTER from gugent workitem.xml sent by vRA
ROLE=$(cat /usr/share/gugent/site/workitem.xml | grep puppet_role | cut -d\" -f4)
echo "ROLE: ${ROLE}" &>> /tmp/puppet_install.log
MASTER=$(cat /usr/share/gugent/site/workitem.xml | grep puppet_master | cut -d\" -f4)
echo "MASTER: ${MASTER}" &>> /tmp/puppet_install.log

mkdir -p /etc/puppetlabs/facter/facts.d &>> /tmp/puppet_install.log
echo "puppet_role: ${ROLE}" > /etc/puppetlabs/facter/facts.d/role.yaml

curl -k "https://${MASTER}:8140/packages/current/install.bash" | bash &>> /tmp/puppet_install.log
