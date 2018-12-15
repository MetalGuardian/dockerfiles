FROM ubuntu:latest

ENV LANG en_US.UTF-8
ENV XMODIFIERS @im=ibus

RUN apt-get update

RUN apt-get install -y locales
RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen && locale-gen

RUN apt install -yq wget ibus-anthy dbus-x11 x11-xkb-utils

RUN apt install -yq gnupg

RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list

RUN apt-get update && apt-get -y install google-chrome-stable

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir /data
RUN chmod 777 /data

ENTRYPOINT [ "google-chrome" ]
CMD ["--no-sandbox"]
