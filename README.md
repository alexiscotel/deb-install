# Proxmox

## 📚 Docs

- [Installation guide](installation.md)
- [Manage Users](docs/manage-users.md)
- Firewalls :
  - [Proxmox Firewall](docs/firewall/proxmox-firewall.md)
  - [Debian iptables](docs/firewall/debian-iptables.md)
- [Backup](docs/protection.md)
- [protection](docs/protection.md)
- Scripts :
  - [install-proxmox](scripts/install-proxmox)
  - [init-users](scripts/init-users)
  - [secure-ssh](scripts/secure-ssh)
  - [update-ssh-config](scripts/update-ssh-config)
  - [iptables-proxmox](scripts/iptables-proxmox)
  - [iptables-vm](scripts/iptables-vm)


## Overview
proxmox debian IP : `10.10.200.219`
### VMs
- **webmox-debian** : `10.10.200.201`. web server using docker to serve :
    - traefik, a reverse proxy (like nginx)
    - portfolio, php website
    - looking4flat, php website
    - calzonerecords, node API and Angular Application
- **ubuntu-server** : `10.10.200.206`
- **windows servers**

### Users
- root
- alex (pam user) in group **`admins`**
### Groups
- proxmox UI :
  - admins > alex
  - user-admin
- system :
  - sudo > alex
  - adm > alex
  - ssh > alex
### Firewall
- allow input ping
- serve SSH on port `10022` only inside local network

### Network interface
- enp0s25
- vmbr0 

### VM IDs Range
- `100 - 200` : test
- `300 - 400` : integration
- `500 - 600` : production

## Usefull commands
```sh
nmap -PM <ip_machine>
```