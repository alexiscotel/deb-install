# ⭐ init-swaks ⭐

## 👀 Overview

the script will configure an smtp client on a machine from the parameters provided.
It create a conf file then editing the hosts file to create DNS redirection

Once installed and configured, it can be used with this command :
```sh
swaks -t test@domain.net --body "contenu du message" --h-subject "Sujet du message"
```
or, with content in a file
```sh
swaks -t test@domain.net --body ~/message.txt --h-subject "Message de test"
```


## 📚 How to use ?
```sh
bash init-swaks --smtp-port "587" --smtp-ip "10.10.200.231" --smtp-name "mail.domain.net" --username "noreply@domain.net" --password "password" --verbose --silent
```

## 🚦 Parameters
```
--smtp-port   : SMTP port to use (25 or 587)
--smtp-ip     : IP of mail server
--smtp-name   : mail server associated domain name
--username   : username (email address) used to send messages
--password   : password used with username

--verbose     : show logs
--silent      : hide logs

-h  --help   : show this message
```

## .swaksrc

**Template**
```bash
# ~/.swaksrc
-s mail.domain.net:587
-tls
-au user@domain.net
-ap password
-f user@domain.net
```
```sh
# /etc/hosts
10.10.200.231 mail.domain.net
```
**Cas d'usage**
```bash
# ~/.swaksrc
-s mail.homux.me:587
-tls
-au noreply@homux.me
-ap tE2v53Qu]f
-f noreply@homux.me
```
```sh
# /etc/hosts
10.10.200.231 mail.homux.me
```