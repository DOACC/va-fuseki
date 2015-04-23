#!/bin/sh
DOACC=`pwd`
ansible-playbook \
    ${DOACC}/provisioning/doacc.yml \
    --inventory-file="${DOACC}/provisioning/hosts" \
    --private-key="~/.ssh/insecure_private_key" \
    -u vagrant \
    --limit @/home/gjh/doacc.retry
