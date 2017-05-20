FROM jouz/docker-ubuntu:latest
MAINTAINER jose.goncalves@dlcproduction.ch

ENV BIND_USER=bind \
    #BIND_VERSION="NotUsed..." \
    DATA_DIR=/data

RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y bind9 bind9-host \
 && rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /sbin/entrypoint.sh
RUN chmod 755 /sbin/entrypoint.sh

EXPOSE 53/udp 53/tcp
VOLUME ["${DATA_DIR}"]
ENTRYPOINT ["/sbin/entrypoint.sh"]
CMD ["/usr/sbin/named"]
