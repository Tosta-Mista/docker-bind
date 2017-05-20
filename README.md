# Bind Server pour Docker

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
docker run --name MyBind -d --restart=always  --publish 53:53/tcp --publish 53:53/udp \
    --volume /srv/docker/bind:/data jouz/docker-bind:latest
```

## Shell Access
Pour le debogue et la maintenance vous pouvez acceder au container avec la commande suivante :
``` 
docker exec -it bind bash 
```
