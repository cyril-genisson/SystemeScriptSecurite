#!/bin/bash

# URL de l'API à utiliser
API_URL="https://jsonplaceholder.typicode.com/todos?_limit=10"

# Chemin vers le fichier de logs
LOG_FILE="./logs/api_logs.txt"

# Chemin vers le fichier JSON
JSON_FILE="./logs/api_response.json"

# Fonction pour enregistrer les logs
log() {
  echo "$(date +'%m-%d-%Y %H:%M:%S') - $1" >> "$LOG_FILE"
}

# Fonction pour enregistrer la réponse au format JSON
save_json_response() {
  echo "$1" > "$JSON_FILE"
  log "Réponse JSON enregistrée dans $JSON_FILE :"
  cat "$JSON_FILE" >> "$LOG_FILE"
  echo "" >> "$LOG_FILE" 
}

# Fonction pour gérer les erreurs
handle_error() {
  local error_message="Erreur: $1"
  echo "$error_message"
  log "$error_message"
  exit 1
}

# Vérification de l'existence du répertoire logs
if [ ! -d "./logs" ]; then
  mkdir -p "./logs" || handle_error "Impossible de créer le répertoire de logs"
fi

# Vérification de l'existence du fichier de logs
if [ ! -f "$LOG_FILE" ]; then
  touch "$LOG_FILE" || handle_error "Impossible de créer le fichier de logs"
fi

# Vérification de l'existence du fichier JSON
if [ ! -f "$JSON_FILE" ]; then
  touch "$JSON_FILE" || handle_error "Impossible de créer le fichier JSON"
fi

# Vérification de l'installation de curl
if ! command -v curl &> /dev/null; then
  handle_error "curl n'est pas installé. Veuillez l'installer pour exécuter ce script."
fi

# Fonction pour effectuer une requête à l'API
make_api_request() {
  local response
  response=$(curl -sS "$API_URL")
  
  echo "Response: $response"

  # Vérifiez si la réponse est vide ou non
  if [ -z "$response" ]; then
    handle_error "La réponse de l'API est vide."
  fi

  # Enregistrez la réponse dans le fichier JSON
  save_json_response "$response"
}

# Exécuter la requête à l'API
make_api_request