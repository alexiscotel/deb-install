# Debian post-install configuration

## ⚡ Scripts

- [deb-install](docs/scripts/deb-install.md)
- [init-users](docs/scripts/init-users.md)
- [init-ssh](docs/scripts/init-ssh.md)
- [update-config](docs/scripts/update-config.md)
- [init-iptables](docs/scripts/init-iptables.md)
- [init-fail2ban](docs/scripts/init-fail2ban.md)
- [init-swaks](docs/scripts/init-swaks.md)


## 📚 Docs

- [Manage Users in Proxmox GUI](docs/manage-proxmox-users.md)
- [SSH](docs/ssh.md)
- Firewalls :
  - [Proxmox Firewall](docs/firewall/proxmox-firewall.md)
  - [Debian iptables](docs/firewall/debian-iptables.md)
- [Backup](docs/backup.md)

## 🚧 TODO

- Integrate notify system (Create doc repository)
- backup :
  - [ ] Learn how to
  - [ ] Sync backup with NAS
  - [ ] Create script
  - [ ] Edit docs
- Create a deploy package that contains :
  - deb-install
  - prettier-shell
  - prettier-motd
- Tests :
  - [ ] in simple debian VM
  - [ ] in a proxmox VM
  - [ ] in the proxmox system