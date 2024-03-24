#!/bin/bash

true <<COMMENT
  Pour recenser tous les processus actifs sur votre système :
    Commande : 'ps aux'

  Pour fermer un processus spécifique avec la commande kill, en fournissant le PID du processus que vous souhaitez terminer :
    exemple : Pour tuer un processus avec le PID 1234
      'kill 1234'

  Forcer sa fermeture en utilisant la commande kill avec l'option -9 (SIGKILL). 
  Cette option envoie un signal au processus pour le terminer immédiatement, sans lui donner la possibilité de se terminer proprement. 
    Par exemple :
      'kill -9 1234'
COMMENT
