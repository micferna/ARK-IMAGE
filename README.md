![Logo Discord](https://zupimages.net/up/23/26/rumo.png)
[Rejoignez le Discord !](https://discord.gg/rSfTxaW)

[![Utilisateurs en ligne](https://img.shields.io/discord/347412941630341121?style=flat-square&logo=discord&colorB=7289DA)](https://discord.gg/347412941630341121)


# ARK Server Docker Compose

## Description

Ce fichier `docker-compose.yml` est destiné à déployer un serveur de jeu ARK: Survival Evolved en utilisant Docker.

## Prérequis

- Docker
- Docker Compose

## Configuration

1. Clonez ce dépôt.
2. Configurez les fichiers `GameUserSettings.ini` et `Game.ini` selon vos besoins et placez-les dans le répertoire `./ark-files/config/`.
3. Si nécessaire, modifiez les variables d'environnement dans le fichier `docker-compose.yml`.

## Déploiement

Pour démarrer le serveur, exécutez la commande suivante :

```bash
docker-compose up -d
```

## Configuration des ports

Les ports suivants sont exposés et mappés vers l'hôte :

- 7777/udp
- 7778/udp
- 27015/udp
- 32330/tcp

## Variables d'environnement

- `PUID`: Identifiant de l'utilisateur
- `PGID`: Identifiant du groupe
- `MAP`: Carte du serveur
- `SESSION_NAME`: Nom de la session
- `SERVER_PASSWORD`: Mot de passe du serveur (laissez vide pour aucun mot de passe)
- `SERVER_ADMIN_PASSWORD`: Mot de passe administrateur

## Réseaux

- `iproxy`: Réseau Docker externe

## Volumes

- `./ark-files/config/GameUserSettings.ini`: Fichier de configuration des paramètres utilisateur
- `./ark-files/config/Game.ini`: Fichier de configuration du jeu
- `./ark-files/saves`: Sauvegardes du serveur



```bash
Map 	                Nom des serveurs ARK

The Island 	        TheIsland
The Center 	        TheCenter
Scorched Earth 	        ScorchedEarth_P
Ragnarok 	        Ragnarok
Aberration 	        Aberration_P
Extinction 	        Extinction
Valguero 	        Valguero_P
Fjordur 	        Fjordur

Genesis: Part 1 	Genesis
Crystal Isles 	        CrystalIsles

Genesis: Part 2 	Gen2
Lost Island 	        LostIsland
```