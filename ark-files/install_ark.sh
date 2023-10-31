#!/bin/bash
# Créer les répertoires nécessaires
mkdir -p /home/steam/steamcmd
mkdir -p /home/ark/ARK

# Installer SteamCMD
cd /home/steam/steamcmd
wget https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz || { echo "Échec du téléchargement de SteamCMD"; exit 1; }
tar -xzvf steamcmd_linux.tar.gz || { echo "Échec de l'extraction de SteamCMD"; exit 1; }

# Télécharger et installer le serveur ARK
./steamcmd.sh +login anonymous +force_install_dir /home/ark/ARK +app_update 376030 validate +quit || { echo "Échec de l'installation du serveur ARK"; exit 1; }
