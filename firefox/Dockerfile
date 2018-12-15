FROM ubuntu:latest

ENV LANG en_US.UTF-8
ENV XMODIFIERS @im=ibus

RUN apt-get update

RUN apt-get install -y locales
RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen && locale-gen

RUN apt install -yq wget ibus-anthy dbus-x11 x11-xkb-utils

RUN apt install -yq gnupg

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 0AB215679C571D1C8325275B9BDB3D89CE49EC21 \
    && echo "deb http://ppa.launchpad.net/mozillateam/firefox-next/ubuntu xenial main" >> /etc/apt/sources.list.d/firefox.list

RUN apt-get update && apt-get -y install firefox

RUN apt-get install -yq ca-certificates ffmpeg hicolor-icon-theme libasound2 libgl1-mesa-dri libgl1-mesa-glx libpulse0

RUN apt-get install -yq apulse

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN echo 'pref("browser.tabs.remote.autostart", false);' >> /etc/firefox/syspref.js

RUN mkdir /data
RUN chmod 777 /data

ENTRYPOINT [ "apulse", "firefox" ]
