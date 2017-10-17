#!/bin/bash

mkdir -p ~/code/sites
mkdir -p ~/code/clients
mkdir -p ~/code/libs
mkdir -p ~/.ssh/clients
mkdir -p ~/.client_aliases
mkdir -p ~/backups

DATE=$(date +%Y-%m-%d.%H.%M.%S)

echo "Backing things up"

if [ -f "~/.aliases" ]; then
    cp .aliases "~/backups/aliases/.aliases_${DATE}"
    echo "--- Old alias = ~/backups/aliases/.aliases_${DATE}"
fi
echo "Backed up"

cp .aliases ~/.aliases
cp .bash_profile ~/.bash_profile

for dir in clients/*
do
    client=${dir#*/}
    echo "Dealing with ${client}"

    if [ -d "clients/${client}/.ssh" ]; then
        cp -R clients/${client}/.ssh ~/.ssh/clients/${client}
        echo "--- Updated SSH"
    fi

    if [ -f "clients/${client}/.aliases" ]; then
        cp clients/${client}/.aliases ~/.client_aliases/.${client}_aliases
        echo "--- Updated aliases"
    fi

    echo "Finished with ${client}"

done
