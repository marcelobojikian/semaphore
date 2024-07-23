#!/usr/bin/env bash

SSH_PATH=/tmp/security
KEYS_PATH=${SSH_PATH:="/var/security"}

for check in 'ssh-keygen' ; do
    if ! which "$check" &> /dev/null
        then echo "Must have $check installed" && exit 1
    fi
done

echo Generate ssh ansible key at $KEYS_PATH

ssh-keygen -q -t ed25519 -f "$KEYS_PATH/ansible-key" -N ""