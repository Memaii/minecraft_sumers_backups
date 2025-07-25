#!/bin/bash

echo "=== Démarrage du Watchdog Minecraft ==="

JAVA_FLAGS="-Xms8G \
-Xmx8G \
-XX:+UseG1GC \
-XX:+ParallelRefProcEnabled \
-XX:+UnlockExperimentalVMOptions \
-XX:G1HeapRegionSize=8M \
-XX:G1NewSizePercent=30 \
-XX:G1MaxNewSizePercent=40 \
-XX:G1ReservePercent=20 \
-XX:InitiatingHeapOccupancyPercent=15 \
-XX:G1MixedGCCountTarget=4 \
-XX:G1MixedGCLiveThresholdPercent=90 \
-XX:G1RSetUpdatingPauseTimePercent=5 \
-XX:G1HeapWastePercent=5 \
-XX:SurvivorRatio=32 \
-XX:MaxTenuringThreshold=1 \
-XX:MaxGCPauseMillis=100 \
-XX:+DisableExplicitGC \
-XX:+AlwaysPreTouch \
-XX:+PerfDisableSharedMem"

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
