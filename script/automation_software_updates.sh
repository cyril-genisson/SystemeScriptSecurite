#!/usr/bin/bash

# Fonction pour rechercher les mises à jour disponibles
search_updates() {
  echo "Recherche des mises à jour disponibles..."
  sudo apt update
}

# Fonction pour mettre à jour les logiciels
update_software() {
  echo "Mise à jour des logiciels en cours..."
  sudo apt upgrade -y
}

# Fonction Principale
main() {
  # Affichage du menu
  while true; do
    echo "Menu :"
    echo "1. Rechercher les mises à jour disponibles"
    echo "2. Mettre à jour les logiciels"
    echo "3. Quitter"

    
    read -r "Choisissez une option : " choix

    case $choix in
    1)
      search_updates
      ;;
    2)
      update_software
      ;;
    3)
      echo "Au revoir !"
      exit
      ;;
    *)
      echo "Option invalide. Veuillez entrer un numéro valide."
      ;;
    esac
  done
}

# Appel de la fonction principale
main