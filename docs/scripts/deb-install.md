# ⭐ deb-install ⭐

## 👀 Overview

`deb-install` script will read content of `prox.conf` file to launch configuration scripts for :
- **system**, with `apt-get` updates and upgrade
- **users**, create groups and users from conf file
- **ssh**, allow / deny users or groups from conf file
- **iptables**, add SSH and ICMP rules for ips present if conf file
- **fail2ban**, copy basic protection files from [files_to_copy](../../scripts/files_to_copy) directory
- **swaks**, create a smtp client to allow system send emails
- If system is a **proxmox** system, disable enterprise messages

## 📚 How to use ?
without speficy a configuration file, the script will use the default conf file present at script root
```sh
bash deb-install 
```
OR, with a specific conf file
```sh
bash deb-install -f "path/to/file/prox.conf"
```

## prox.conf

**prox.conf** file must exists in order to execute the main script `deb-install`. Here is an explanation of the parameters it contains

### [GLOBAL]

set flag to `true` to activate configuration for corresponding script
```sh
proxmox=false
init_users=false
init_ssh=false
init_iptables=false
init_fail2ban=false
init_swaks=false
```


### [USERS]
This part configure `init-users` script parameters

- for `users` parameter, add usernames you want to create, separate by a comma
- for `groups` parameter, add group names you want to create, separate by a comma
- `users_in_groups` parameter is made to associate users with group. Separate groups with a semicolon, and separate usernames with a comma

```sh
# [USERS]
users="username1,username2,username3,username4"
groups="group1,group2"
users_in_groups="group1=username1,usernam2;group2=username3"
```



### [SSH]
This part configure `init-ssh` script parameters

- `ssh_config_file` :  path to ssh configuration file (often in `/etc/ssh/sshd_config`)
- `ssh_port` : define the SSH port used for the system
- `ssh_allowed_users` : list of users allowed to connect through SSH
- `ssh_allowed_groups` : list of groups allowed to connect through SSH
- `ssh_denied_users` : list of users NOT allowed to connect through SSH
- `ssh_denied_groups` : list of groups NOT allowed to connect throught SSH

```sh
# [SSH]
ssh_config_file="/etc/ssh/sshd_config"
ssh_port="22"

ssh_allowed_users="root,username3"
ssh_allowed_groups="group1-ssh"
ssh_denied_users="username5,username6"
ssh_denied_groups="group3,group4"
```



### [NETWORK]
This part configure networks IPs
- `network_host` : IP address of the network in which the machine is located
- `bastion_ip` : If set, entry point for SSH connections

```sh
# [NETWORK]
network_host="10.10.200.0/24"
bastion_ip="10.10.200.203"
```



### [IPTABLES]
This part configure `init-iptables` script parameters

🚨 IPs must be formated with valid CIDR notation. ex: `192.168.1.0/24`
the script will concat `network_host` and `bastion_ip` into `ssh_allowed_ips` array

- `ssh_allowed_ips` : list of IPs allowed to connect
- `ssh_denied_ips` : list of IPs NOT allowed to connect
- `active_icmp` : flag to activate **ping** requests
- `drop_ssh` : **Drop ALL** SSH packets ( 🚨 used with at least one of allowed IPs, to avoid lockout)

```sh
# [IPTABLES]
ssh_allowed_ips="10.10.200.203/32,10.10.200.204/32"
ssh_denied_ips="11.11.11.11/32"

active_icmp=true
drop_ssh=true
```



### [SWAKS]
This part configure `init-swaks` script parameters

🚨 IP must be formated without CIDR notation. ex: `192.168.1.10`

- `smtp_port` : insert the SSH port used by the iRedMail configuration (25 or 587)
- `smtp_ip` : IP that represent the mail server on the network
- `smtp_name` : domain name used in iRedMail configuration ("mail.domain.net")
- `smtp_username` : mail address for the swaks user (demending on your FAI)
- `smtp_password` : password for the swaks user

```sh
# [SWAKS]
smtp_port="587"
smtp_ip="10.10.200.231"
smtp_name="mail.domain.net"
smtp_username="noreply@domain.net"
smtp_password="password"
```