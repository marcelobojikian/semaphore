#!/usr/bin/env bash

VAULT_FILE_PATH=${VAULT_PATH:="files/security/ansible"}

mkdir -p $VAULT_FILE_PATH

read -p "Enter your vault password: " Vault
printf "$Vault" > "$VAULT_FILE_PATH/vault.key"

echo Generated Vault file at $VAULT_FILE_PATH