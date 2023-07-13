# How to init fail2ban

> Il est vivement déconseillé de modifier les fichiers de configuration /etc/fail2ban/fail2ban.conf et /etc/fail2ban/jail.conf (notamment car ils peuvent être écrasés par une mise à jour). Ces fichiers contiennent les configurations de base qu'on peut surcharger au moyen d'un ou plusieurs fichiers enregistrés dans /etc/fail2ban/jail.d
Le fichier /etc/fail2ban/jail.conf doit servir uniquement de référence et de documentation.

## Files
- `/etc/fail2ban/fail2ban.conf`, is the global configuration file
- `/etc/fail2ban/jail.conf`, contains default jails (DO NOT EDIT)

DO NOT edit files in `/etc/fail2ban/` directory, prefer create files in `/etc/fail2ban/jail.d/` :
- `/etc/fail2ban/jail.d/defaults-debian.conf` : Default jails
```sh
[DEFAULT]
destemail = mon-email@mail.fr
sender = root@domaine.fr
# add local ip to avoid to be locked out


[sshd]
enabled = true
# 10 requêtes en 2 min -> Ban pour 20 minutes
maxretry = 10
findtime = 120
bantime = 1200

[sshd-ddos]
enabled = true

[recidive]
enabled = true
```

## Basic Jail configuration
```sh
[ssh-iptables]
#enabled  = false
enabled  = true
filter   = sshd
action   = iptables[name=SSH, port=ssh, protocol=tcp]
#          mail-whois[name=SSH, dest=yourmail@mail.com]
#logpath  = /var/log/sshd.log
logpath  = /var/log/auth.log
maxretry = 5
```
