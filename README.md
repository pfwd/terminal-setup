# Terminal Setup
This allows switching between client bash profiles.

Each client and have their own SSH and bash aliases

### Clients
Each client should be structured like so

```
/clients/<client>/.aliases
/clients/<client>/.ssh/keys/
/clients/<client>/.ssh/config
```
Both bash aliases and ssh folders are optional

### Installation
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
Each time you switch between clients you must reload the bash profile to pick up any changes
```
$ reload
```
When the profile is reloaded the [default aliases]() are also included

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