#!/usr/bin/bash

# Dossier principal de l'utilisateur
HOME_DIR=$HOME

# Nom du fichier avec extension
FILE='mon_texte.txt'

# Contenu du fichier texte
TEXT_CONTENT="Que la force soit avec toi."

# Déplacement dans le dossier principal 
cd "$HOME_DIR" || exit

# Boucle à travers une liste de répertoires spécifiques
for i in Bureau Documents Téléchargement Vidéos Images; do
  # Vérifie si le répertoire n'existe pas, puis le crée
  # (! -d signifie non répertoire)
  if [ ! -d $i ]; then
    mkdir $i
  fi
  # Crée un fichier texte vide dans le répertoire courant et écrit le contenu spécifié
  touch $i/$FILE
  echo "$TEXT_CONTENT" > $i/$FILE
done

# Recherche récursive de fichiers contenant le mot force dans le dossier principal et ses sous-répertoires
find "$HOME_DIR" -type f -name $FILE -exec grep -l "force" {} +

true <<COMMENT
  -type f : Cela spécifie que nous recherchons des fichiers réguliers. L'option -type est suivie de f qui signifie "fichier".
  -exec : Cette option permet d'exécuter une commande pour chaque fichier trouvé.

  grep -l "force" {} + : grep est une commande pour rechercher des motifs dans des fichiers. L'option -l de grep indique de ne pas afficher le contenu des lignes correspondantes, mais seulement les noms des fichiers contenant des correspondances. "{} +" est utilisé pour marquer l'emplacement où les noms de fichiers trouvés par find seront remplacés. Donc, cela exécute grep -l "force" pour chaque fichier trouvé.
COMMENT