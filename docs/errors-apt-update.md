
# 🚨 Errors with `apt update`

### If `apt update` command exits with theses errors :
```sh
root@pve:~# apt update
Hit:1 http://ftp.fr.debian.org/debian bookworm InRelease
Hit:2 http://security.debian.org bookworm-security InRelease
Get:3 http://ftp.fr.debian.org/debian bookworm-updates InRelease [52.1 kB]
Err:4 https://enterprise.proxmox.com/debian/ceph-quincy bookworm InRelease
  401  Unauthorized [IP: 51.91.38.34 443]
Err:5 https://enterprise.proxmox.com/debian/pve bookworm InRelease
  401  Unauthorized [IP: 51.91.38.34 443]
Reading package lists... Done
E: Failed to fetch https://enterprise.proxmox.com/debian/ceph-quincy/dists/bookworm/InRelease  401  Unauthorized [IP: 51.91.38.34 443]
E: The repository 'https://enterprise.proxmox.com/debian/ceph-quincy bookworm InRelease' is not signed.
N: Updating from such a repository can't be done securely, and is therefore disabled by default.
N: See apt-secure(8) manpage for repository creation and user configuration details.
E: Failed to fetch https://enterprise.proxmox.com/debian/pve/dists/bookworm/InRelease  401  Unauthorized [IP: 51.91.38.34 443]
E: The repository 'https://enterprise.proxmox.com/debian/pve bookworm InRelease' is not signed.
N: Updating from such a repository can't be done securely, and is therefore disabled by default.
N: See apt-secure(8) manpage for repository creation and user configuration details.
```
### According to this [documentation](https://pve.proxmox.com/wiki/Package_Repositories), in `/etc/apt`, edit somes files :
- `/etc/apt/sources.list.d/pve-entreprise.list` : comment content
	```
	# deb https://enterprise.proxmox.com/debian/pve bookworm pve-enterprise
	```
- `/etc/apt/sources.list.d/ceph.list` : replace content with the following :
	```
	## Ceph Quincy Enterprise Repository
	#deb https://enterprise.proxmox.com/debian/ceph-quincy bookworm enterprise

	## Ceph Quincy No-Subscription Repository
	deb http://download.proxmox.com/debian/ceph-quincy bookworm no-subscription
	```
- `/etc/apt/sources.list` : replace content with the following :
	```
	#deb http://ftp.fr.debian.org/debian bookworm main contrib
	#deb http://ftp.fr.debian.org/debian bookworm-updates main contrib
	# security updates
	#deb http://security.debian.org bookworm-security main contrib


	## Proxmox VE No-Subscription Repository
	deb http://ftp.debian.org/debian bookworm main contrib
	deb http://ftp.debian.org/debian bookworm-updates main contrib

	# Proxmox VE pve-no-subscription repository provided by proxmox.com,
	# NOT recommended for production use
	deb http://download.proxmox.com/debian/pve bookworm pve-no-subscription

	# security updates
	deb http://security.debian.org/debian-security bookworm-security main contrib
	```
### then, use `apt update` again, and it works !
```sh
apt update
```

### 🚨 Be careful with this 🚨 
If there is a connection error, change `nameserver` in **/etc/resolv.conf** with `8.8.8.8`