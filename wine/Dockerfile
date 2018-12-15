FROM ubuntu:latest

RUN dpkg --add-architecture i386 
RUN apt-get update
RUN apt-get -yq upgrade

ENV LANG en_US.UTF-8
ENV XMODIFIERS @im=ibus

RUN apt-get install -y locales
RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen && locale-gen

RUN apt-get install -yq wget ibus-anthy dbus-x11 x11-xkb-utils
RUN apt-get install -yq gnupg
RUN apt-get install -yq software-properties-common

RUN wget -nc https://dl.winehq.org/wine-builds/Release.key
RUN apt-key add Release.key
RUN rm Release.key
RUN apt-add-repository https://dl.winehq.org/wine-builds/ubuntu/
RUN apt update

RUN apt-get install -yq --install-recommends winehq-stable

RUN apt-get install -yq apulse ca-certificates

RUN apt-get install -yq winbind

RUN apt-get install -yq cabextract p7zip unzip zenity

RUN wget https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks -O /usr/bin/winetricks
RUN chmod +rx /usr/bin/winetricks

RUN mkdir -p /usr/share/wine/gecko /usr/share/wine/mono
ENV WINE_MONO_VERSION 4.7.3
ENV WINE_GECKO_VERSION 2.47
RUN wget "http://dl.winehq.org/wine/wine-gecko/${WINE_GECKO_VERSION}/wine_gecko-${WINE_GECKO_VERSION}-x86.msi" \
    -O /usr/share/wine/gecko/wine_gecko-${WINE_GECKO_VERSION}-x86.msi
RUN chmod +x /usr/share/wine/gecko/wine_gecko-${WINE_GECKO_VERSION}-x86.msi
RUN wget "http://dl.winehq.org/wine/wine-gecko/${WINE_GECKO_VERSION}/wine_gecko-${WINE_GECKO_VERSION}-x86_64.msi" \
    -O /usr/share/wine/gecko/wine_gecko-${WINE_GECKO_VERSION}-x86_64.msi
RUN chmod +x /usr/share/wine/gecko/wine_gecko-${WINE_GECKO_VERSION}-x86_64.msi
RUN wget "http://dl.winehq.org/wine/wine-mono/${WINE_MONO_VERSION}/wine-mono-${WINE_MONO_VERSION}.msi" \
    -O /usr/share/wine/mono/wine-mono-${WINE_MONO_VERSION}.msi
RUN chmod +x /usr/share/wine/mono/wine-mono-${WINE_MONO_VERSION}.msi


ENTRYPOINT ["apulse", "wine"]
