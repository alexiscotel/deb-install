# protection PROXMOX

## Done

1. Mise en place du parefeu proxmox en suivant ces 2 tutos :
   - https://artheodoc.files.wordpress.com/2023/03/le_pare-feu_integre_de_proxmox.pdf
   - https://doc.ataxya.net/books/proxmox-ve/page/securisation-basique-de-son-proxmox

2. Instalation de fail2ban :
	- Configuration de 2 tentatives avant d'être banni lors de l'echec de la 3eme
3. Désactivation de la connexion ssh avec l'utilisateur root

## TODO
1. Automatiser script d'export des logs **`fail2ban`**