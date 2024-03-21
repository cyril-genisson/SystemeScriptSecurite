#!/usr/bin/bash
# Programme de Gestion des dépendances logicielles
# Version 1.0

update_upgrade_package() {
  update_command="apt update"
  upgrade_command="apt upgrade -y"
  eval "$update_command && $upgrade_command"
} # OK

# Fonction pour l'installation d'Apache ou Nginx
apache_install() {
  if ! dpkg -l | grep -q apache2; then
    apt install apache2 -y
    echo -e "Installation Apache2...\n"
  else
    echo -e "\nApache est déjà installé.\n"
  fi
} # OK

nginx_install() {
  if ! dpkg -l | grep -q nginx; then
    apt install nginx -y
    echo -e "\nInstallation Nginx...\n"
  else
    echo -e "\nNginx est déjà installé.\n"
  fi
} # OK

apache_status() {
  if dpkg -l | grep -q apache2; then
    status=$(systemctl status apache2)
    is_active=$(systemctl is-active apache2)

    echo -e "\n----- APACHE STATUS -----\n"
    echo "Menu :"
    echo "1. Afficher le statut complet d'Apache"
    echo "2. Afficher seulement l'état d'Apache"
    echo "3. Quitter"
    read -rp "Choisissez une option : " choix

    case $choix in
    1)
      echo -e "\n$status"
      ;;
    2)
      echo -e "\nÉtat : $is_active\n"
      ;;
    3)
      echo "Programme Arrêté."
      exit 0
      ;;
    *)
      echo "Option invalide. Veuillez entrer un numéro valide."
      ;;
    esac
  else
    echo "Apache n'est pas installé."
  fi
} # OK

nginx_status() {
  if dpkg -l | grep -q nginx; then
    status=$(systemctl status nginx)
    is_active=$(systemctl is-active nginx)

    echo -e "----- NGINX STATUS -----\n"
    echo "Menu :"
    echo "1. Afficher le statut complet de Nginx"
    echo "2. Afficher seulement l'état de Nginx"
    echo "3. Quitter"
    read -rp "Choisissez une option : " choix

    case $choix in
    1)
      echo -e "\n$status"
      ;;
    2)
      echo -e "\nÉtat : $is_active\n"
      ;;
    3)
      echo "Programme arrêté."
      exit 0
      ;;
    *)
      echo "Option invalide. Veuillez entrer un numéro valide."
      ;;
    esac
  else
    echo "Nginx n'est pas installé."
  fi
} # OK

web_server_install() {
  echo -e "\n"

  cols=$(tput cols)
  printf '%*s\n' "${cols}" '' | tr ' ' '-'

  echo -e "\n"
  echo -e "----- WEB SERVER -----\n"
  echo "Menu d'installation :"
  echo "1. Installer Apache"
  echo "2. Installer Nginx"
  echo "3. Quitter"
  read -rp "Choisissez une option : " web_server

  case $web_server in
  1)
    apache_install
    ;;
  2)
    nginx_install
    ;;
  3)
    echo "Programme arrêté."
    exit 0
    ;;
  *)
    echo "Choix invalide. Veuillez choisir 1 pour Apache ou 2 pour Nginx."
    install_web_server
    ;;
  esac
} # OK

# Fonctions d'installation de PHP
phpMyAdmin_install() {
  if ! dpkg -l | grep -q phpmyadmin; then
    sudo apt install phpmyadmin -y
    echo -e "Installation phpMyAdmin...\n"
  else
    echo -e "phpMyAdmin est déjà installé.\n"
  fi
} # OK

php_install() {
  if ! dpkg -l | grep -q php; then
    sudo  apt install php -y
    echo -e "Installation PHP...\n"
  else
    echo -e "PHP est déjà installé.\n"
  fi
} # OK

# Fonctions d'installation de la Base de Données
mariaDB_install() {
  if ! dpkg -l | grep -q mariadb-server; then
    apt install mariadb-server -y
    echo -e "Installation mariadb-server...\n"
  else
    echo -e "\nMariaDB est déjà installé.\n"
  fi
} # OK

mariaDB_status() {
  if dpkg -l | grep -q mariadb-server; then
    status=$(systemctl status mariadb)
    is_active=$(systemctl is-active mariadb)

    echo -e "\n----- MARIA DB STATUS -----\n"
    echo "Menu :"
    echo "1. Afficher le statut complet de MariaDB"
    echo "2. Afficher seulement l'état de MariaDB"
    echo "3. Quitter"
    read -rp "Choisissez une option : " choix

    case $choix in
    1)
      echo -e "\n$status"
      ;;
    2)
      echo -e "\nÉtat : $is_active\n"
      ;;
    3)
      echo "Programme arrêté."
      exit 0
      ;;
    *)
      echo "Option invalide. Veuillez entrer un numéro valide."
      ;;
    esac
  else
    echo "MariaDB n'est pas installé."
  fi
} # OK

mysql_install() {
  if ! dpkg -l | grep -q mysql-server; then
    apt install mysql-server -y
    echo -e "Installation MySQL...\n"
  else
    echo -e "\nMySQL est déjà installé.\n"
  fi
} # OK

mysql_status() {
  if dpkg -l | grep -q mysql-server; then
    status=$(systemctl status mysql)
    is_active=$(systemctl is-active mysql)

    echo -e "----- MYSQL STATUS -----\n"
    echo "Menu :"
    echo "1. Afficher le statut complet de MySQL"
    echo "2. Afficher seulement l'état de MySQL"
    echo "3. Quitter"
    read -rp "Choisissez une option : " choix

    case $choix in
    1)
      echo -e "\n$status"
      ;;
    2)
      echo -e "\nÉtat : $is_active\n"
      ;;
    3)
      echo "Programme arrêté."
      exit 0
      ;;
    *)
      echo "Option invalide. Veuillez entrer un numéro valide."
      ;;
    esac
  else
    echo "MySQL n'est pas installé."
  fi
} # OK

bdd_install() {
  echo -e "----- BASE DE DONNÉES -----\n"
  echo "Menu d'installation :"
  echo "1. Installer MariaDB"
  echo "2. Installer MySQL"
  echo "3. Quitter"
  read -rp "Choisissez une option : " bdd_choice

  case $bdd_choice in
  1)
    mariaDB_install
    ;;
  2)
    mysql_install
    ;;
  3)
    echo "Programme arrêté."
    exit 0
    ;;
  *)
    echo "Choix invalide. Veuillez choisir 1 pour MariaDB ou 2 pour MySQL."
    bdd_install
    ;;
  esac
} # OK

nodeJS_install() {
  if ! dpkg -l | grep -q nodejs; then
    apt install nodejs -y
    echo -e "Installation de NodeJS...\n"
  else
    echo -e "NodeJS est déjà installé.\n"
  fi
} # OK

git_install() {
  if ! dpkg -l | grep -q git; then
    apt install git -y
    echo -e "Installation de Git...\n"
  else
    echo -e "Git est déjà installé.\n"
  fi
} # OK

# Fonction Principale
main() {
  echo -e "\n"

  cols=$(tput cols)
  title="Logiciel de gestion des dépendances"
  padding=$(( (cols - ${#title}) / 2 ))
  printf '%*s%s%*s\n' $padding "" "$title" $padding ""
  printf '%*s\n' "${cols}" '' | tr ' ' '-'

  echo -e "\n"
  echo "Vous allez passer en mode root pour effectuer la mise à jour des paquets."
  echo -e "Veuillez entrer le mot de passe root lorsque vous y êtes invité."

  # `id -u` : renvoie l'identifiant de l'utilisateur sous forme de chaîne de caractères.
  # `"0"` : C'est l'identifiant de l'utilisateur root.
  # `sudo su -c` : vous demandez essentiellement à sudo de basculer vers l'utilisateur root temporairement et d'exécuter une commande spécifique en tant que root.
  # $(declare -f update_upgrade_package) : Cela exécute la commande declare -f update_upgrade_package, qui renvoie la définition de la fonction update_upgrade_package. La sortie de cette commande est insérée dans la commande globale.
  if [ "$(id -u)" != "0" ]; then
    sudo su -c "$(declare -f update_upgrade_package); update_upgrade_package"
    web_server_install
    php_install
    bdd_install
    phpMyAdmin_install
    nodeJS_install
    git_install
  else
    sudo su -c "$(declare -f update_upgrade_package); update_upgrade_package"
    web_server_install
    php_install
    bdd_install
    phpMyAdmin_install
    nodeJS_install
    git_install
  fi

  echo "Menu :"
  echo "1. Afficher le statut de Apache"
  echo "2. Afficher le statut de Nginx"
  echo "3. Afficher le statut de MariaDB"
  echo "4. Afficher le statut de MySQL"
  echo "5. Quitter"

  read -p "Choisissez une option : " choix

  case $choix in
  1)
    apache_status
    ;;
  2)
    nginx_status
    ;;
  3)
    mariaDB_status
    ;;
  4)
    mysql_status
    ;;
  5)
    echo "Au revoir !"
    exit 0
    ;;
  *)
    echo "Option invalide. Veuillez entrer un numéro valide."
    ;;
  esac
}

# Appel de la fonction principale
main


