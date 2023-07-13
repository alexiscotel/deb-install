# Proxmox

## 📚 Docs

- [Manage Users in Proxmox GUI](docs/manage-proxmox-users.md)
- [SSH](docs/ssh.md)
- Firewalls :
  - [Proxmox Firewall](docs/firewall/proxmox-firewall.md)
  - [Debian iptables](docs/firewall/debian-iptables.md)
- [Backup](docs/protection.md)
- Scripts :
  - [deb-install](scripts/deb-install)
  - [init-users](scripts/init-users)
  - [init-ssh](scripts/init-ssh)
  - [update-config](scripts/update-config)
  - [init-iptables](scripts/init-iptables)


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