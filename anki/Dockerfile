FROM ubuntu:latest

ENV LANG en_US.UTF-8
ENV XMODIFIERS @im=ibus

RUN apt-get update

RUN apt-get install -y locales
RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen && locale-gen

RUN apt install -yq anki wget mplayer fonts-vlgothic ibus-anthy dbus-x11 x11-xkb-utils

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir /data

VOLUME ["/data"]

ENTRYPOINT ["bash", "-c"]

CMD ["/usr/bin/ibus-daemon -xd && /usr/bin/anki -b /data"]
