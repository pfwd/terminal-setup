#!/bin/bash

mkdir -p ~/code/sites
mkdir -p ~/code/clients
mkdir -p ~/code/libs
mkdir -p ~/.ssh/clients
mkdir -p ~/.client_aliases
mkdir -p ~/backups

source ./bin/backup.sh

cp .aliases ~/.aliases
cp .bash_profile ~/.bash_profile

function buildClients {
    echo " "
    echo "================================"
    echo "Working through clients"


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

    echo "Finished"
    echo "================================"
    echo " "
}

ls clients/*/ >/dev/null 2>&1 ;
if [ $? == 0 ];
then
  buildClients
else
  echo "No clients found"
fi


