# Bind Server pour Docker (Ubuntu 16.04 + Bind)
## Introduction
Ce build permet de mettre en place un serveur bind sur une base Ubuntu 16.04. 

Disponible sur la plateforme :
* DockerHub : https://hub.docker.com/r/jouz/docker-bind/
* Github : https://github.com/Tosta-Mixta/docker-bind

## Installation
Les builds des images sont automatisé et disponible sur dockerhub.
```
docker pull jouz/docker-bind 
```

Vous pouvez également "build" l'image par vous même.
```
docker build -t jouz/docker-bind github.com/Tosta-Mixta/docker-bind 
```

## Utilisation
Pour lancer le container :
```
docker run --name MyBind -d \ 
--restart=always --publish 53:53/tcp --publish 53:53/udp \
--volume /srv/docker/bind:/data jouz/docker-bind:latest
```

Grace au arguments publish vous pouvez définir sur quel interface vous souhaitez que le service ecoute :
```
--publish 53:53         # Ecoute sur toutes les interfaces (equivalent a 0.0.0.0:53)
--publish 172.17.0.1    # Ecoute sur l'interface docker0 
--publish 192.168.1.4   # Ecoute sur une interface mise à disposition sur le host (adaptez l'ip en fonction de votre config)
```

Pour mapper un volume vous pouvez utilisez l'argument "--volume" :
```
--volume /docker_folder:/host_folder
``` 

## Shell Access
Pour le debogue et la maintenance vous pouvez acceder au container avec la commande suivante :
``` 
docker exec -it MyBind bash 
```
