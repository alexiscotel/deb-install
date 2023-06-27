# Proxmox

## TODO: 
- allow ssh only for specific ssh group members
- create both user, one with PAM, one with PVE, to separate system and GUI access

## 📚 Docs

- [Installation guide](installation.md)
- [Manage Users](docs/manage-users.md)
- Firewalls :
  - [Proxmox Firewall](docs/firewall/proxmox-firewall.md)
  - [Debian iptables](docs/firewall/debian-iptables.md)
- [Backup](docs/protection.md)
- [protection](docs/protection.md)


## Overview
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