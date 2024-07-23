#!/usr/bin/env bash

KEYS_PATH=${SSH_PATH:="files/security/ssh"}

for check in 'ssh-keygen' ; do
    if ! which "$check" &> /dev/null
        then echo "Must have $check installed" && exit 1
    fi
done

echo Generate ssh ansible key at $KEYS_PATH

ssh-keygen -q -t ed25519 -f "$KEYS_PATH/ansible-key" -N ""