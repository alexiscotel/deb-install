# Proxmox CE - Guide d'installation


Follow instructions at [pve.proxmox.com/pve-docs](https://pve.proxmox.com/pve-docs/chapter-pve-installation.html) to install the *proxmox* OS

## 1. Update/Upgrade packages
```sh
apt update
apt upgrade
apt dist-upgrade
```
if problems with `apt update`, refer to this [documentation](docs/errors-apt-update.md)

## 2. Create users and manage persmissions
refer to this [documentation](docs/manage-users.md)


## 3. Firewall
refer to this [documentation](docs/firewall.md)
---

## Tips
**deactivate proxmox web UI connexion message** (*to be tested)*
```sh
sed -i.bak "s/data.status !== 'Active'/false/g" /usr/share/javascript/proxmox-widget-toolkit/proxmoxlib.js && systemctl restart preproxy.service
```


