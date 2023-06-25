# Proxmox

## TODO: 
- allow ssh only for specific ssh group members
- create both user, one with PAM, one with PVE, to separate system and GUI access

## Overview

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


## 📚 Docs

- [Installation guide](installation.md)
- [Manage Users](docs/manage-users.md)
- [Firewall](docs/firewall.md)
- [protection](docs/protection.md)
