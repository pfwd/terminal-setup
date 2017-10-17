# Terminal Setup
This allows switching between client bash profiles.

Each client can have their own SSH config and bash aliases

When switching between clients a symlink named .current_client_aliases is added to the home directory.  This is linked to the active client aliases and changed when the client is switched

### Clients
Each client should be structured like so

```
/clients/<client>/.aliases
/clients/<client>/.ssh/keys/
/clients/<client>/.ssh/config
```
Both bash aliases and ssh folders are optional

### Installation
Clone the repository into your home directory
```
git clone git@github.com:pfwd/terminal-setup.git ~/terminal-setup.git
```
Please check the following [install](bin/install.sh) and [uninstall](bin/uninstall.sh) scripts to ensure this won't wipe out existing bash profiles

To install the new clients or updates run the following:
```
$ ./bin/install.sh
```

### Switch between clients
To switch between clients run the following:
```
$ ./bin/client_switch.sh -c <client> && reload
```

### Reloading the bash profile
This only applies if you didn't add the `reload` command when switching between clients
Each time you switch between clients you must reload the bash profile to pick up any changes
```
$ reload
```
When the profile is reloaded the [default aliases](.aliases) are also included

### Tips and tricks
In each client add aliases that match to the clients SSH config
```
# clients/foo/.aliases
alias ssh-dev-site="ssh -F ~/.ssh/foo/config dev-site"
  
# clients/foo/.ssh/config
Host dev-site
   HostName <IP_ADDRESS>
   User <USERNAME>
   IdentityFile ~/.ssh/foo/keys/id_rsa
       
# clients/bar/.aliases
alias ssh-dev-site="ssh -F ~/.ssh/bar/config dev-site"
   
# clients/bar/.ssh/config
Host dev-site
   HostName <IP_ADDRESS>
   User <USERNAME>
   IdentityFile ~/.ssh/bar/keys/id_rsa
   
$ ./bin/client_switch.sh -c foo && reload
$ ssh-dev-site # This will access foo server
   
$ ./bin/client_switch.sh -c bar && reload
$ ssh-dev-site # This will access bar server
```

Create an alias in each client that echos the current active client
```
# clients/foo/.aliases
alias whichclient="echo Client Foo is loaded"
  
# clients/bar/.aliases
alias whichclient="echo Client Bar is loaded"
  
$ ./bin/client_switch.sh -c foo && reload
$ whichclient # Client Foo is loaded
  
$ ./bin/client_switch.sh -c bar && reload
$ whichclient # Client Bar is loaded
```