#!/usr/bin/env bash

KEYS_PATH=${SSH_PATH:="files/security/ansible/ssh"}

for check in 'ssh-keygen' ; do
    if ! which "$check" &> /dev/null
        then echo "Must have $check installed" && exit 1
    fi
done

mkdir -p $KEYS_PATH

ssh-keygen -q -t ed25519 -f "$KEYS_PATH/ansible-key" -N ""

# Set readable key
# chwon semaphore:root
chmod o+r "$KEYS_PATH/ansible-key"

echo Generated ssh ansible key at $KEYS_PATH