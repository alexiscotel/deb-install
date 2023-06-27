# Proxmox - Installation guide


## Image Installation 
Follow instructions at [pve.proxmox.com/pve-docs](https://pve.proxmox.com/pve-docs/chapter-pve-installation.html) to install the *proxmox* OS

## Manage packages
Start by upgrading the system
```sh
pveupgrade
```
Then, packages
```sh
apt clean && apt update
apt upgrade
apt dist-upgrade
```
if problems with `apt update`, refer to this [documentation](docs/errors-apt-update.md)


## Users persmissions
- [Manage proxmox users](docs/manage-proxmox-users.md)

## Firewall
- [Proxmox firewall](docs/firewall/proxmox-firewall.md)
- [Debian iptables](docs/firewall/debian-iptables.md)

## SSH
- [Secure SSH](docs/secure-ssh.md)

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


## Backup

---

## Tips
**deactivate enterprise mode**
```sh
rm /etc/apt/sources.list.d/pve-enterprise.list
```

```sh
echo '# Proxmox community package repository' >> /etc/apt/sources.list
echo 'deb http://download.proxmox.com/debian/pve bullseye pve-no-subscription' >> /etc/apt/sources.list
```

**deactivate proxmox web UI connexion message** (*to be tested)*
```sh
sed -i.bak "s/data.status !== 'Active'/false/g" /usr/share/javascript/proxmox-widget-toolkit/proxmoxlib.js && systemctl restart preproxy.service
```


