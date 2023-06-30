# Scripts

## prox-install

## init-users
```sh
--create -g group1:username1,sshuser@ip:port/group2:username3,username
```

## init-ssh
Made for easily configure .bashrc
```sh
bash init-ssh -p 2222 -n 192.168.0.1/24 -u username1,sshuser@ip:port -g group1,group2 -U username3,sshuser@ip:port -G group4
```

Parameters :
```
    -p  --ssh-port     : SSH port
    -n  --network-host : Network host

    -u  --allow-users  : Allowed users to connect through SSH
    -g  --allow-groups : Allowed groups to connect through SSH
    -U  --deny-users   : Denied users to connect through SSH
    -G  --deny-groups  : Denied groups to connect through SSH

        --verbose          : Display logs
        --silent           : Don't display logs

    -h  --help         : show this message
```
## update-ssh-config
Made for updating SSH configuration.

Enter parameter name with `-k` and his value with `-v`
```sh
update-ssh-config -k <key> -v <value> --verbose
```

## init-iptables
## init-iptables-vm
