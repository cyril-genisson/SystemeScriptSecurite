#!/bin/bash

CSV_PY='create_csv.py'

# Écrire le script Python dans un fichier temporaire
cat >$CSV_PY <<EOF
#!/usr/bin/env python3
import csv

# Données à ajouter dans le fichier CSV
donnees = [
  ["Jean", "25 ans", "Paris"],
  ["Marie", "30 ans", "Lyon"],
  ["Pierre", "22 ans", "Marseille"],
  ["Sophie", "35 ans", "Toulouse"]
]

# Chemin du fichier CSV à créer
fichier_csv = "personnes.csv"

# Écriture des données dans le fichier CSV
with open(fichier_csv, mode='w', newline='') as file:
  writer = csv.writer(file)
  writer.writerow(["Nom", "Âge", "Ville"])  # En-tête du fichier CSV
  writer.writerows(donnees)  # Ajout des données
EOF

# Exécuter le script Python pour créer le fichier CSV
python3 $CSV_PY

# Afficher les informations relatives aux villes en utilisant awk
awk -F',' 'NR > 1 {print "\n", $1, "-", $3, "\n"}' personnes.csv

# Supprimer le fichier temporaire
rm $CSV_PY
