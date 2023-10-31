# Utilisez Ubuntu comme image de base
FROM ubuntu:latest

# Définir les variables d'environnement pour UID et GID
ARG PUID=1000
ARG PGID=1000

# Mettez à jour la liste des paquets et installez les dépendances nécessaires
RUN dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get install -y lib32gcc-s1 wget

# Créer un utilisateur pour exécuter le serveur ARK
RUN useradd -m ark

# Copier les fichiers du serveur ARK, les fichiers de configuration, les fichiers de sauvegarde et le script de démarrage dans l'image
COPY ark-files /home/ark/ARK

# Changer le propriétaire des fichiers et dossiers
RUN chown -R ${PUID}:${PGID} /home/ark/ARK

# Changer les permissions pour le script de démarrage
RUN chmod +x /home/ark/ARK/start_ark.sh

# Copier le script d'installation dans l'image
COPY /ark-files/install_ark.sh /home/ark/install_ark.sh

# Exécuter le script d'installation
RUN chmod +x /home/ark/install_ark.sh && /home/ark/install_ark.sh

# Changer à l'utilisateur ark pour le reste du processus
USER ark

# Exposer les ports nécessaires
EXPOSE 7777/udp 7778/udp 27015/udp 32330/tcp

# Définir le point d'entrée pour exécuter le script de démarrage
ENTRYPOINT ["/home/ark/ARK/start_ark.sh"]
