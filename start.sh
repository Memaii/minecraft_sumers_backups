#!/bin/bash

echo "=== Démarrage du Watchdog Minecraft ==="

while true; do
  echo ">> Lancement du serveur Minecraft à $(date)"
  /start
  exit_code=$?
  echo ">> Le serveur s'est arrêté avec le code $exit_code"

  if [[ $exit_code -eq 0 ]]; then
    echo "Arrêt propre détecté (commande 'stop'). Fin du script."
    break
  fi

  echo "Redémarrage dans 5 secondes..."
  sleep 5
done
