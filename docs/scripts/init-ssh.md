# ⭐ init-ssh ⭐

## 👀 Overview

This script is made to init ssh configuration :
- It will update **ssh** port
- It will update **network** configuration
- It will **allow** users and groups to connect
- It will **deny** users and groups to connect

## 📚 How to use ?

```sh
bash init-ssh -p 2222 -n 192.168.0.1/24 -u username1,sshuser@ip:port -g group1,group2 -U username3,sshuser@ip:port -G group4
```

## 🚦 Parameters

```
    -p  --ssh-port     : SSH port
    -n  --network-host : Network host

    -u  --allow-users  : Allowed users to connect through SSH
    -g  --allow-groups : Allowed groups to connect through SSH
    -U  --deny-users   : Denied users to connect through SSH
    -G  --deny-groups  : Denied groups to connect through SSH

	-f  --file         : SSH config file (default : "/etc/ssh/sshd_config")
```

- `ssh-port` : define the SSH port used for the system
- `network-host` : define the network host that serve the machine
  
- `allow-users` : list of users allowed to connect through SSH
- `allow-groups` : list of groups allowed to connect through SSH
- `deny-users` : list of users NOT allowed to connect through SSH
- `deny-groups` : list of groups NOT allowed to connect throught SSH

- `file` :  path to ssh configuration file (often in `/etc/ssh/sshd_config`)