# How to secure a ssh server

`/etc/ssh/sshd_config`
```sh
Protocol 2
Port 5922
PermitRootLogin no 
PermitEmptyPasswords no
AllowUsers: username sshuser@ip:port
AllowGroups: groupname
DenyUsers: username1 username2 sshuser@ip:port
DenyGroups: groupname
ClientAliveInterval 120
MaxAuthTries 3
X11Forwarding no 
AllowTcpForwarding no
MACs hmac-sha1,hmac-sha2-256,hmac-sha2-512
# Banner /path/to/banner/banner.txt
LogLevel INFO
```
`/etc/hosts.allow`
```sh
sshd: 10.10.200.0/24 : ALLOW
```

## Docs
Install with `apt install openssh-server`

Disable Root User Logins
```sh
useradd -m username
passwd username
usermod -aG sudo username
```
```sh
PermitRootLogin no 
```
Selectively Allow Acess to Users and Groups
```sh
AllowUsers: username sshuser@ip:port
AllowGroups: groupname
DenyUsers: username1 username2 sshuser@ip:port
DenyGroups: groupname
```
Changing the Default SSH Port
```sh
Port 5922
```
Block Access for Users With Blank Passwords
```sh
PermitEmptyPasswords no
```
Limit Login/Access Attempts
```sh
MaxAuthTries 3
```
Using SSH Version 2
```sh
Protocol 2
	```
Turning Off TCP Port Forwarding and X11 Forwarding
```sh
X11Forwarding no 
AllowTcpForwarding no
```
Connecting With an SSH Key
```sh
ssh-keygen
```
IP Restrictions for SSH Connections
```sh
sshd: 10.10.200.0/24 : ALLOW
```
Set Idle Timeout Interval
```sh
ClientAliveInterval 120
```
Add a Warning Banner
```sh
Banner /path/to/banner/banner.txt
```
Enforce Strong MAC Algorithms
```sh
MACs hmac-sha1,hmac-sha2-256,hmac-sha2-512
```
Set LogLevel to Monitor SSH Activity
```sh
LogLevel INFO
```

## usefull commands
```sh
sudo systemctl restart ssh
sudo systemctl status ssh
```