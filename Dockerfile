FROM ubuntu:latest

MAINTAINER Biojout Quentin <nuzolx@gmail.com>

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y software-properties-common 

RUN add-apt-repository -y ppa:transmissionbt/ppa && \
    apt-get update && \
    apt-get install -y transmission-daemon

RUN mkdir -p /mnt/data/final && \
    mkdir -p /mnt/data/tmp && \
    mkdir /etc/transmission

ADD files/settings.json /etc/transmission/settings.json
ADD files/start /start

EXPOSE 12345
EXPOSE 9091

RUN chown -R daemon /etc/transmission

USER daemon

VOLUME ["/mnt/data/final"]

CMD ["/start"]
