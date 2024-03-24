#!/bin/bash

# Vérifier si inotify-tools est installé
if ! command -v inotifywait &> /dev/null; then
  echo "Installation de inotify-tools..."
  sudo apt-get update
  sudo apt-get install -y inotify-tools
  echo "Installation terminée."
fi

source_dir="$HOME/Documents/Plateforme"
backup_dir="$HOME/Plateforme_Backups_Save"
backup_log_file="$backup_dir/backup_log_$(date +'%m-%d-%Y_%H:%M:%S').txt"

# Créer le répertoire de sauvegarde s'il n'existe pas
mkdir -p "$backup_dir"

# Fonction pour lancer la sauvegarde
perform_backup() {
  backup_save_file="$backup_dir/backup_$(date +'%m-%d-%Y_%H:%M:%S').tar.gz"

  echo -e "\n----- SAVE PLATEFORME -----"
  echo -e "$(date +'%m-%d-%Y_%H:%M:%S') : Début de la sauvegarde de $source_dir.." 
  echo "$(date +'%m-%d-%Y_%H:%M:%S') : Début de la sauvegarde de $source_dir..." >> "$backup_log_file"
  tar -czf "$backup_save_file" -C "$source_dir" . >> "$backup_log_file" 2>&1
  echo -e "$(date +'%m-%d-%Y %H:%M:%S') : Sauvegarde terminée.."
  echo "$(date +'%m-%d-%Y %H:%M:%S') : Sauvegarde terminée..." >> "$backup_log_file"
  echo "$(date +'%m-%d-%Y %H:%M:%S') : $backup_save_file" >> "$backup_dir/backup_history.txt"
  echo -e "Sauvegarde effectuée avec succès : $backup_save_file\n"
}

# Lancer une sauvegarde initiale
perform_backup
echo "$(date +'%m-%d-%Y %H:%M:%S'): Surveillance des modifications dans le répertoire source ($source_dir)..."
echo "$(date +'%m-%d-%Y %H:%M:%S'): Surveillance des modifications dans le répertoire source ($source_dir)..." >> "$backup_log_file"

# Surveillance des modifications dans le répertoire source
while event=$(inotifywait -q -r -e create,modify,delete "$source_dir"); do
  case $event in
      CREATE)
          action="Création de fichier"
          ;;
      MODIFY)
          action="Modification de fichier"
          ;;
      DELETE)
          action="Suppression du fichier"
          ;;
      *)
          # shellcheck disable=SC2034
          action="Action inconnue"
          ;;
  esac
  echo "$(date +'%m-%d-%Y %H:%M:%S'): $(printf '\033[1;31m%s\033[0m' "$event") DÉTÉCTÉ !" 
  echo -e "\nsauvegarde..\n"
  echo "$(date +'%m-%d-%Y %H:%M:%S'): $event détecté dans le répertoire source. Lancement de la sauvegarde..." >> "$backup_log_file"
  perform_backup
done
