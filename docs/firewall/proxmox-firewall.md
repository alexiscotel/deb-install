# Configure Proxmox firwall

## Overview
Proxmox UI firewall configuration are save in `/etc/pve/firewall/cluster.fw`

Host related configuration is read from `/etc/pve/nodes/<nodename>/host.fw`

## 🚨 Before activate
create a `http` rule to allow web UI access, to avoid lockout (refer to [Rules n°1](#rules))

## Steps in Proxmox UI :
1. In **`Datacenter`** :
   1. `Security Group` : create security groups
   2. `Firewall` : insert security group with interface
2. In **`pve`** node :
   1. `Firewall` : create rules using the Datacenter security group created before
3. On each VM :
   1. `Firewall` : 

## Security groups
- ping-local
  1. drop request for all non-local network machines
  2. allow requet for local network machines
- ssh-local
  1. drop request for all non-local network machines
  2. allow requet for local network machines


## Proxmox used ports
- Principal
  - `8006` : Web interface (TCP, HTTP/1.1 over TLS)
  - `22` : sshd (used for cluster actions) (TCP)
  - `25` : sendmail (TCP, outgoing)
  - `5900-5999` : VNC Web console (TCP, WebSocket)
- Others
  - ❓ `3128` : SPICE proxy (TCP)
  - ❓ `111` : rpcbind (UDP)
  - ❓ `5405-5412` : corosync cluster traffic (UDP)
  - ❓ `60000-60050` : live migration (VM memory and local-disk data) (TCP)

## <a id="rules"></a>Rules
| | Type | Action | Macro | Int. | Prot. | Sour. | S.Port | Dest | D.Port | Log | Comment |
| - | - | - | - | - | - | - | - | - | - | - | - |
| **1** | in | ACCEPT | | vmbr0 | tcp | | | | `8006` | info | Access to web UI |
| | | | | | | | | | | | |
| **2** | In | ACCEPT | SSH | vmbr0 | | `10.10.200.1/24` | | | | notice | allow SSH connections for all local network |
| **3** | In | DROP | SSH | vmbr0 | | `0.0.0.0/32` | | | | alert | drops SSH connections for all ipv4 adresses |
| | | | | | | | | | | | |
| **4** | In | ACCEPT | | vmbr0 | ICMP | `10.10.200.1/24` | | | | notice | allow SSH connections for all local network |
| **5** | In | DROP | | vmbr0 | ICMP | `0.0.0.0/32` | | | | alert | drops SSH connections for all ipv4 adresses |


## pve commands :
```sh
pve-firewall status
pve-firewall stop
pve-firewall start
pve-firewall restart
```



## Tips
- If block outside by the firewall, connect to the pve console, and edit firewall config file
	```sh
	nano /etc/pve/firewall/cluster.fw
	```
	```
	[OPTIONS]

	enable: 0
	```