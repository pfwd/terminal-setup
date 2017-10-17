#!/bin/bash

while getopts :c: option
do
    case "${option}" in
        c)
            CLIENT=${OPTARG}
        ;;
        \?)
            echo "Invalid option -c is required"
            exit 1
        ;;
        :)
            echo "Option -$OPTARG requires a client name." >&2
            exit 1
        ;;
    esac
done

if [ -z "$CLIENT" ]
then
    echo "-c is required this must be set to a client name" >&2
    exit 1
fi

if [ -f "${HOME}/.client_aliases/.${CLIENT}_aliases" ]; then

    if [ -f "${HOME}/.current_client_aliases" ]; then
        rm "${HOME}/.current_client_aliases"
    fi
    ln -s "${HOME}/.client_aliases/.${CLIENT}_aliases" "${HOME}/.current_client_aliases"


    echo "Reloaded ${CLIENT} aliases from  ${HOME}/.client_aliases/.${CLIENT}_aliases"

else
    echo "Cannot load ${HOME}/.client_aliases/.${CLIENT}_aliases"
    exit 1
fi
