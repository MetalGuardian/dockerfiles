FROM ubuntu:latest

RUN dpkg --add-architecture i386
RUN apt-get update
RUN apt-get -yq upgrade

ENV LANG en_US.UTF-8
ENV XMODIFIERS @im=ibus

ENV WINE_MONO_VERSION 5.1.0
ENV WINE_GECKO_VERSION 2.47.1
ENV WINEBRANCH stable
ENV WINE_VER 5.11

RUN apt-get install -y locales
RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen && locale-gen

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Berlin

RUN apt-get install -yq \
    wget \
    ibus-anthy \
    dbus-x11 \
    x11-xkb-utils \
    gnupg \
    software-properties-common \
    apulse \
    pulseaudio-utils \
    ca-certificates \
    winbind \
    cabextract \
    p7zip \
    unzip \
    zenity

ENV WINEBRANCH staging
ENV WINE_VER 5.11~focal

RUN wget https://dl.winehq.org/wine-builds/winehq.key \
    && apt-key add winehq.key \
    && apt-add-repository "deb https://dl.winehq.org/wine-builds/ubuntu/ focal main" \
    && apt-get update \
    && apt-get install -y --install-recommends winehq-${WINEBRANCH}="${WINE_VER}" \
    && rm -rf /var/lib/apt/lists/* \
    && rm winehq.key

RUN wget https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks -O /usr/bin/winetricks
RUN chmod +rx /usr/bin/winetricks

RUN mkdir -p /usr/share/wine/mono /usr/share/wine/gecko \
    && wget https://dl.winehq.org/wine/wine-mono/${WINE_MONO_VERSION}/wine-mono-${WINE_MONO_VERSION}-x86.msi \
        -O /usr/share/wine/mono/wine-mono-${WINE_MONO_VERSION}-x86.msi \
    && wget https://dl.winehq.org/wine/wine-gecko/${WINE_GECKO_VERSION}/wine-gecko-${WINE_GECKO_VERSION}-x86.msi \
        -O /usr/share/wine/gecko/wine-gecko-${WINE_GECKO_VERSION}-x86.msi \
    && wget https://dl.winehq.org/wine/wine-gecko/${WINE_GECKO_VERSION}/wine-gecko-${WINE_GECKO_VERSION}-x86_64.msi \
        -O /usr/share/wine/gecko/wine-gecko-${WINE_GECKO_VERSION}-x86_64.msi

# RUN wget http://repo.steampowered.com/steam/archive/precise/steam_latest.deb
# RUN apt-get update
# RUN apt-get install -yq curl python-apt
# RUN apt-get install -yq xterm
# RUN dpkg -i steam_latest.deb \
#     && rm steam_latest.deb

# pciutils
# libgl1-mesa-glx

RUN apt-get install -yq \
    libglu1-mesa \
    libvulkan1 \
    mesa-vulkan-drivers \
    libgl1-mesa-dri \
    libva2 \
    va-driver-all

ENTRYPOINT ["wine"]
