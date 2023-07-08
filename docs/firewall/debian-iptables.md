# Debian iptables configuration
🚨 This documentation has to be used with [Proxmox firewall](proxmox-firewall.md)

## Installation
```sh
apt install iptables
```

## la table NAT : translation de ports et d'IP
2 localisations : 
  - PREROUTING (amont parefeu)
  - POSTROUTING (aval parefeu)
3 targets :
  - DNAT > destination
  - SNAT > source
  - MASQUERADE > simule une gateway

la table Filter : translation de ports et d'IP
- 3 chaines
  - INPUT > entrants
  - OUTPUT > sortants
  - FORWARD > passants
- 4 targets
  - DROP : refus brut des paquets sans retour
  - ACCEPT : accept les paquets
  - REJECT : DROP avec retour à l'expéditeur
  - DENY : refus pur
  - (LOG : lister les paquets)

la table `Mangle` : modification des paquets
- 5 targets :
  - TOS > type de service
  - TTL > durée de vie
  - MARK > marquer les paquets
  - SECMARK > marquage de sécurité
  - CONNSECMARK > copie d'un cas de sécurité

## iptables options

Lister les règles
```sh
iptables -L --line-number
```

```sh
iptables [OPTIONS]
```
Options :
- -A > ajout
- -D > delete (ex: -D INPUT 1)
- -R > replace (ex: -I INPUT 1)
- -I > insert (ex: -I INPUT > au début /  -D INPUT 1)
- -F > flush règle pour une chaine (ex: -F IPNUT)
- -N > creation de chaine
- -X > suppression de chaine
- -P > définit la policy d'une chaine (ex: -P INPUT DROP)

- -p > protocole (ex: -p tcp)
- -s > source (ip, reseau)
- -j > action à faire (DROP/ ACCEPT)
- -d > destination (ip, réseau)
- -i > interface d'entrée (eth0, vmbr0, ...)
- -o > interface de sortie
- --sport > port de sortie
- -m (multiport) --sport 80,443
- -t > type (NAT,...)

## Préparer une machine
### Tout rejeter
```sh
iptables -t filter -P INPUT DROP
iptables -t filter -P FORWARD DROP
iptables -t filter -P OUTPUT DROP
```
### 👍 si une machine établie une connexion, on laisser passer la communication
	```sh
	iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
	iptables -A OUTPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
	```
### ping : allow full access
	```sh
	iptables -t filter -A INPUT -p icmp -j ACCEPT
	iptables -t filter -A OUTPUT -p icmp -j ACCEPT
	```
### SSH
- allow full access
	```sh
	iptables -t filter -A INPUT -p tcp --dport 2222 -j ACCEPT
	iptables -t filter -A OUTPUT -p tcp --dport 2222 -j ACCEPT
	```
- restreindre l'accès à un réseau
	```sh
	iptables -I INPUT -s 10.10.200.219 -p tcp --dport 22 -j ACCEPT
	```