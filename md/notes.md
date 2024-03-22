# Système, Scripts et Sécurité !

CRÉER SERVEUR LAMP : 
> `https://tutos-info.fr/wp-content/uploads/2023/08/TUTORIEL-INSTALLER-LAMP-SUR-DEBIAN-12.1.pdf`

---

## Les Commandes Utiles au Projet :

| Actions                                     | Commande                                                    |
|:-------------------------------------------:|:-----------------------------------------------------------:|
| Ajouter l'utilisateur dans les `sudoers` :  | `su`<br>ou<br>`sudo usermod -aG sudo <nom_utilisateur>`     |
| Liste de tous les utilisateurs :            | `cut -d: -f1 /etc/passwd`                                   |
| Changer le nom d'utilisateur :              | `sudo usermod -l <newname> <oldname>`                       |
| Changer les droits d'éxécution du fichier : | `chmod +x <namefile>`                                       |
| Renommer le Fichier / Dossier :             | `mv ancien.txt nouveau.txt`                                 |
| Connecter son PC à la VM :                  | `ssh <nom_d'utilisateur@addresse_ip`                        |

<br>

---

<br>

## SCP :

🚨 TOUT DEPUIS LE TERMINAL DU PC ET NON DE LA VM ! 🚨
| Actions                                     | Commandes                                                   |
|:-------------------------------------------:|:-----------------------------------------------------------:|
| PC --> VM                                   | `scp "/chemin/du/fichier/a/envoyer(exemple.txt)" utilisateur@addr_ip::/chemin/du/fichier/a/placerer/`    |
| VM --> PC                                   | `scp utilisateur@addr_ip:/chemin/du/ficher/a/récupérer(exemple.txt) "/chemin/du/ficher/a/placerer"`    |

<br>

---

<br>

## SOURCE.LIST

| Liens à Ajouter                                                                           |
|:-----------------------------------------------------------------------------------------:|
| `deb http://deb.debian.org/debian bookworm main non-free-firmware`                        |
| `deb-src http://deb.debian.org/debian bookworm main non-free-firmware`                    |
| `deb http://deb.debian.org/debian-security/ bookworm-security main non-free-firmware`     |
| `deb-src http://deb.debian.org/debian-security/ bookworm-security main non-free-firmware` |
| `deb http://deb.debian.org/debian bookworm-updates main non-free-firmware`                |
| `deb-src http://deb.debian.org/debian bookworm-updates main non-free-firmware`            |
