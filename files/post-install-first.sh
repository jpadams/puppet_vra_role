#!/bin/bash

export PATH=$PATH:/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin
#Wait for networking
echo "Waiting for networking (sleeping 120)" &>> /tmp/puppet_install.log
sleep 120
#Obtain url of NEXT_SCRIPT to run from gugent workitem.xml sent by vRA
NEXT_SCRIPT_URL=$(cat /usr/share/gugent/site/workitem.xml | grep next_script_url | cut -d\" -f4)
echo "NEXT_SCRIPT_URL: ${NEXT_SCRIPT_URL}" &>> /tmp/puppet_install.log
curl -k "${NEXT_SCRIPT_URL}" | bash &>> /tmp/puppet_install.log
