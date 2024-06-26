#!/bin/bash

# Nom du fichier CSV de sortie
file_system_monitoring_csv="file_system_monitoring.csv"

# En-tête du fichier CSV
echo "Timestamp,CPU(used)(%),CPU(not used)(%), Memory(%), Disk(%)" > $file_system_monitoring_csv

# Boucle infinie pour surveiller en temps réel
while true; do
  # Récupérer l'heure actuelle
  timestamp=$(date "+%d-%m-%Y %H:%M:%S")

  # Récupérer l'utilisation du CPU détaillée
  cpu_used=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print $1}')
  cpu_not_used=$(awk "BEGIN { print 100 - $cpu_used }")

  # Récupérer l'utilisation de la mémoire
  memory_used=$(free | grep Mem | awk '{printf "%.0f", $3/$2 * 100}')

  # Récupérer l'utilisation du disque
  disk=$(df | awk '$NF=="/"{print $5}')

  echo -e "DateTime : $timestamp, CPU (used) : $cpu_used%, CPU (not used) : $cpu_not_used%, Memory : $memory_used%, Disk : $disk"
  echo -e "$timestamp, $cpu_used%, $cpu_not_used%, $memory_used%, $disk" >> $file_system_monitoring_csv

  # Attendre quelques secondes avant de répéter
  sleep 1
done
