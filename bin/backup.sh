#!/bin/bash

BACKUP_DIR=~/backups/bash
mkdir -p ${BACKUP_DIR}

DATE=$(date +%Y-%m-%d.%H.%M.%S)

echo " "
echo "================================"
echo "Running backups"


if [ -f "~/.bash_profile" ]; then
    cp ~/.bash_profile ${BACKUP_DIR}/${DATE}/.bash_profile

    echo "--- Backed up ~/.bash_profile to ${BACKUP_DIR}/${DATE}"
fi

if [ -f "~/.aliases" ]; then
    cp ~/.aliases ${BACKUP_DIR}/${DATE}/.aliases

    echo "--- Backed up ~/.aliases to ${BACKUP_DIR}/${DATE}"
fi

if [ -d "~/.ssh" ]; then
    cp -r ~/.shh ${BACKUP_DIR}/${DATE}/.ssh

    echo "--- Backed up ~/.ssh to ${BACKUP_DIR}/${DATE}"
fi

echo "Finished"
echo "================================"
echo " "