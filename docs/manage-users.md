# Manage Proxmox users and groups

## 1. Create an `admins` group

![Proxmox add group GUI](img/proxmox-add-group.png "Proxmox add group GUI")

## 2. Add permission to `admins` group
- Go to `Datacenter` > `Permissions` > `add` > `Group Permission`
	
- add **`Administrator`** role to the path **`/`** for the `admins` group
![Proxmox add group permission GUI](img/proxmox-add-group-permission.png "Proxmox add group permissionGUI")

## 3. Create users
### Create a PAM user
  - on linux system, create a user and set his password
	```sh
	adduser [options] <username>
	```
  - In proxmox GUI, create a PAM user, add had him to the `admins` group
	![Proxmox add user GUI](img/proxmox-add-user.png "Proxmox add user GUI")


## Usefull commands
- list users :
	```sh
	cat /etc/passwd
	```
- list groups :
	```sh
	cat /etc/group
	```

- add user
  - with prompt
	```sh
	adduser [options] <username>
	```
  - without prompt. Use -m / --create-home to create home dir as `/home/username`
	```sh
	useradd -m <username>
	passwd <username>
	```

- delete user :
	```sh
	userdel [options] <username>
	```
