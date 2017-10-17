if [ -f ~/.aliases ]; then
  . ~/.aliases
else
    echo "${HOME}/.aliases"
    echo "Cannot load aliases"
fi

if [ -f ${HOME}/.current_client_aliases ]; then
    . ${HOME}/.current_client_aliases
else
    echo "${HOME}/.current_client_aliases"
    echo "Cannot load client aliases"
fi
