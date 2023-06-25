# Configure Proxmox firwall

## Proxmox used ports
- Web interface: `8006` (TCP, HTTP/1.1 over TLS)
- VNC Web console: `5900-5999` (TCP, WebSocket)
- SPICE proxy: `3128` (TCP)
- sshd (used for cluster actions): `22` (TCP)
- rpcbind: `111` (UDP)
- sendmail: `25` (TCP, outgoing)
- corosync cluster traffic: `5405-5412` UDP
- live migration (VM memory and local-disk data): `60000-60050` (TCP)

## Rules
| Type | Action | Macro | Interface | Protocol | Source | S.Port | Destination | D.Port | Log Level | Comment |
| - | - | - | - | - | - | - | - | - | - | - |
| in | ACCEPT | - | vmbr0 | tcp | - | - | - | `8006` | info | Access to web GUI |

### Rules for SSH
| Type | Action | Macro | Interface | Protocol | Source | Log Level | Comment |
| - | - | - | - | - | - | - | - |
| In | ACCEPT | SSH | vmbr0 | | `10.10.200.1/24` | notice | allow SSH connections for all local network |
| In | DROP | SSH | vmbr0 | | `0.0.0.0/32` | alert | drops SSH connections for all ipv4 adresses |


### Rules for PING
| Type | Action | Macro | Interface | Protocol | Source | Log Level | Comment |
| - | - | - | - | - | - | - | - |
| In | ACCEPT |  | vmbr0 | icmp | `10.10.200.1/24` |notice | allow PING for all local network |
| In | DROP |  | vmbr0 | icmp | `0.0.0.0/32` | alert | drops PING for all local network |


## pve commands :
```sh
pve-firewall status
pve-firewall stop
pve-firewall start
pve-firewall restart
```



## Tips
If block outside by the firewall, connect to the pve console, and edit firewall config file
```sh
nano /etc/pve/firewall/cluster.fw
```
set `enable` to `0`
```
[OPTIONS]

enable: 0
```