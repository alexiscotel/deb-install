# ⭐ init-fail2ban ⭐

## 👀 Overview
this script will copy fail2ban configuration from `scripts/files_to_copy/etc/fail2ban` to `/etc/fail2ban` directory.

- Edit main configuration in `scripts/files_to_copy/etc/fail2ban/jail.local`
- Define jails by creating `*.conf` file in `scripts/files_to_copy/etc/fail2ban/jail.d`
- Define custom filters by creating `*.conf` file in `scripts/files_to_copy/etc/fail2ban/filter.d`

To get more info about Fail2ban functionnalities and configuration, go to [fail2ban.md](../fail2ban.md)

## 📚 How to use ?

```sh
bash init-fail2ban
```

## 🚦 Parameters
No parameters can be provided