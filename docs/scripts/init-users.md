# ⭐ init-users ⭐

## 👀 Overview

This script create system users and groups

## 📚 How to use ?

```sh
bash init-users --create -g group1:username1,sshuser@ip:port/group2:username3,username
```

## 🚦 Parameters

```
	-u  --users  : users to create (separated by a comma)
	-g  --groups : groups to create (separated by a comma)
	-a  --add    : formated string to set users in groups
				format: group1=username1,username2;group2=username3,username1
```

- for `users` parameter, add usernames you want to create, separate by a comma
- for `groups` parameter, add group names you want to create, separate by a comma
- `add` parameter is made to associate users with group. Separate groups with a semicolon, and separate usernames or groups with a comma