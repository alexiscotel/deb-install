# ⭐ init-iptables ⭐

## 👀 Overview

🚨 IPs must be formated with valid CIDR notation. ex: `192.168.1.0/24`
the script will concat `network_host` and `bastion_ip` into `ssh_allowed_ips` array

## 📚 How to use ?

```sh
bash init-iptables -p 22 -s "192.168.0.1/24,172.0.0.1/24" -S "10.10.10.1/24,10.10.72.0/16" --icmp --drop-ssh --verbose --silent
```

## 🚦 Parameters

```
-p  --ssh-port  : SSH port

-s  --ssh-allow : Array of allowed ips to connect throught SSH (CIDR must be present)
-S  --ssh-deny  : Array of denied ips to connect throught SSH (CIDR must be present)

--icmp          : Flag to add ICMP rules
--drop-ssh      : Flag to drop all ssh connections
```

- `ssh-port` : SSH port to use

- `ssh-allow` : list of IPs allowed to connect
- `ssh-deny` : list of IPs NOT allowed to connect

- `icmp` : flag to activate **ping** requests

- `drop-ssh` : **Drop ALL** SSH packets ( 🚨 used with at least one of allowed IPs, to avoid lockout)