#!/bin/bash

export PATH=$PATH:/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin

#Obtain ROLE and MASTER from gugent workitem.xml sent by vRA
ROLE=$(cat /usr/share/gugent/site/workitem.xml | grep puppet_role | cut -d\" -f4)
echo "ROLE: ${ROLE}" &>> /tmp/puppet_install.log
MASTER=$(cat /usr/share/gugent/site/workitem.xml | grep puppet_master | cut -d\" -f4)
echo "MASTER: ${MASTER}" &>> /tmp/puppet_install.log

#Lay down trusted fact during agent install
mkdir -p /etc/puppetlabs/puppet &>> /tmp/puppet_install.log
cat << EOF > /etc/puppetlabs/puppet/csr_attributes.yaml
---
extension_requests:
  #pp_role
  1.3.6.1.4.1.34380.1.1.13: '${ROLE}'
EOF

curl -k "https://${MASTER}:8140/packages/current/install.bash" | bash &>> /tmp/puppet_install.log
