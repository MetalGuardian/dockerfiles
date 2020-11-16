FROM alpine

ENV RIPME_VER 1.7.92

RUN set -xe \
    && apk add --no-cache ca-certificates \
        openjdk8-jre \
        wget \
        fontconfig \
        ttf-dejavu \
    && mkdir /app \
    && wget "https://github.com/RipMeApp/ripme/releases/download/$RIPME_VER/ripme.jar" -P /app

VOLUME /data
WORKDIR /data

CMD ["java", "-jar", "/app/ripme.jar"]
# CMD ["--help"]