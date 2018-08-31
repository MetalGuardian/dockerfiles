FROM alpine:3.8

RUN set -ex \
  && apk add --no-cache --virtual wget \
  && apk add --no-cache ca-certificates \
  && cd /tmp \
  && wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip \
  && unzip ngrok-stable-linux-amd64.zip \
  && mv ngrok /bin/ngrok \
  && rm -f ngrok-stable-linux-amd64.zip \
  && apk del wget

EXPOSE 4040

ENTRYPOINT ["ngrok"]
