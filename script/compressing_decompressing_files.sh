#!/bin/bash

# Chemin complet du fichier "mon_texte.txt"
source_file="$HOME/Documents/mon_texte.txt"

# Vérification de l'existence du fichier source
if [ ! -f "$source_file" ]; then
  echo "Le fichier mon_texte.txt n'existe pas dans le répertoire ~/Documents."
  exit 1
fi

# Création du répertoire "Plateforme" dans le dossier "Documents"
mkdir -p "$HOME/Documents/Plateforme"

# Copie du fichier mon_texte.txt dans le répertoire "Plateforme"
cp "$source_file" "$HOME/Documents/Plateforme/"

# Duplication du fichier quatre fois dans le répertoire "Plateforme"
for i in {1..4}; do
  cp "$source_file" "$HOME/Documents/Plateforme/mon_texte_copy_$i.txt"
done

# Déplacement vers le répertoire "Plateforme"
cd "$HOME/Documents/Plateforme" || exit

# Compression du répertoire "Plateforme" avec tar et gzip
tar -czvf Plateforme.tar.gz

# Affichage du contenu du répertoire après la compression
echo -e "\nContenu du répertoire après la compression :"
ls

# Retour au répertoire précédent
cd - || exit

# Décompression de l'archive Plateforme.tar.gz
tar -xzvf "$HOME/Documents/Plateforme/Plateforme.tar.gz" -C "$HOME/Documents/Plateforme"

# Affichage du contenu du répertoire après la décompression
echo -e "\nContenu du répertoire après la décompression :"
ls "$HOME/Documents/Plateforme"
