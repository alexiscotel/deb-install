# ⭐ update-config ⭐

## 👀 Overview

Made for updating configuration in desire file.

## 📚 How to use ?
Enter parameter name with `-k` and his value with `-v`, then file to edit with `-f`

```sh
bash update-config -k <key> -v <value> -f "/path/to/file"
```

## 🚦 Parameters

```
-k --key   : parameter key
-v --value : parameter value
-f --file  : file to update
```

- `key` : define the paremeter to update
- `value` : define the value to update
  
- `file` :  path to configuration file (mandatory)