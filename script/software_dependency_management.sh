#!/usr/bin/bash

update_upgrade_package() {
  update_command="apt update"
  upgrade_command="apt upgrade -y"
  eval "$update_command && $upgrade_command"
}

# Fonction pour l'installation d'Apache ou Nginx
apache_install() {
  if ! dpkg -l | grep -q apache2; then
    apt install apache2 -y
  else
    echo "Apache est déjà installé."
  fi
}

nginx_install() {
  if ! dpkg -l | grep -q nginx; then
    apt install nginx -y
  else
    echo "Nginx est déjà installé."
  fi
}

apache_status() {
  if dpkg -l | grep -q apache2; then
    status=$(systemctl status apache2)
    is_active=$(systemctl is-active apache2)

    echo "Menu :"
    echo "1. Afficher le statut complet d'Apache"
    echo "2. Afficher seulement l'état d'Apache"
    read -r "Choisissez une option : " choix

    case $choix in
    1)
      echo -e "\n$status"
      ;;
    2)
      echo -e "\n$is_active"
      ;;
    *)
      echo "Option invalide. Veuillez entrer un numéro valide."
      ;;
    esac
  else
    echo "Apache n'est pas installé."
  fi
}

nginx_status() {
  if dpkg -l | grep -q nginx; then
    status=$(systemctl status nginx)
    is_active=$(systemctl is-active nginx)

    echo "Menu :"
    echo "1. Afficher le statut complet de Nginx"
    echo "2. Afficher seulement l'état de Nginx"
    read -r "Choisissez une option : " choix

    case $choix in
    1)
      echo -e "\n$status"
      ;;
    2)
      echo -e "\n$is_active"
      ;;
    *)
      echo "Option invalide. Veuillez entrer un numéro valide."
      ;;
    esac
  else
    echo "Nginx n'est pas installé."
  fi
}

install_web_server() {
  echo "Installation du serveur web..."
  read -r "Veuillez choisir le serveur web (1. Apache / 2. Nginx) : " server_choice

  case $server_choice in
  1)
    apache_install
    ;;
  2)
    nginx_install
    ;;
  3)
    apache_status
    ;;
  4)
    nginx_status
    ;;
  *)
    echo "Choix invalide. Veuillez choisir 1 pour Apache ou 2 pour Nginx."
    install_web_server
    ;;
  esac
}



mariaDB_install() {
  if ! dpkg -l | grep -q mariadb-server; then
    apt install mariadb-server -y
  else
    echo "MariaDB est déjà installé."
  fi
}

mariaDB_status() {
  if dpkg -l | grep -q mariadb-server; then
    status=$(systemctl status mariadb)
    is_active=$(systemctl is-active mariadb)

    echo "Menu :"
    echo "1. Afficher le statut complet de MariaDB"
    echo "2. Afficher seulement l'état de MariaDB"
    read -r "Choisissez une option : " choix

    case $choix in
    1)
      echo -e "\n$status"
      ;;
    2)
      echo -e "\n$is_active"
      ;;
    *)
      echo "Option invalide. Veuillez entrer un numéro valide."
      ;;
    esac
  else
    echo "MariaDB n'est pas installé."
  fi
}

php_install() {
  if ! dpkg -l | grep -q php; then
    apt install php -y
  else
    echo "PHP est déjà installé."
  fi
}

main() {
  echo -e "\n----- Logiciel de gestion des dépendances -----\n"
  echo "Vous allez passer en mode root pour effectuer la mise à jour des paquets."
  echo -e "Veuillez entrer le mot de passe root lorsque vous y êtes invité."

  # `id -u` : renvoie l'identifiant de l'utilisateur sous forme de chaîne de caractères.
  # `"0"` : C'est l'identifiant de l'utilisateur root.
  # `sudo su -c` : vous demandez essentiellement à sudo de basculer vers l'utilisateur root temporairement et d'exécuter une commande spécifique en tant que root.
  # $(declare -f update_upgrade_package) : Cela exécute la commande declare -f update_upgrade_package, qui renvoie la définition de la fonction update_upgrade_package. La sortie de cette commande est insérée dans la commande globale.
  if [ "$(id -u)" != "0" ]; then
    sudo "$(declare -f update_upgrade_package); update_upgrade_package"
    install_web_server
    mariaDB_install
    php_install
  else
    update_upgrade_package
    install_web_server
    mariaDB_install
    php_install
  fi

  echo "Menu :"
  echo "1. Afficher le statut d'Apache"
  echo "2. Afficher le statut de MariaDB"
  echo "3. Quitter"

  read -r "Choisissez une option : " choix

  case $choix in
  1)
    apache_status
    ;;
  2)
    mariaDB_status
    ;;
  3)
    echo "Au revoir !"
    ;;
  *)
    echo "Option invalide. Veuillez entrer un numéro valide."
    ;;
  esac
}

main