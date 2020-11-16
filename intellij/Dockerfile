ARG JVM_VERSION=8u222
ARG SBT_VERSION=1.3.4
ARG SCALA_VERSION=2.12.10

# FROM hseeberger/scala-sbt:${JVM_VERSION}_${SBT_VERSION}_${SCALA_VERSION}
FROM openjdk:${JVM_VERSION}

# https://download.jetbrains.com/idea/ideaIC-2020.2.2.tar.gz
ARG BUILD=2020.2.2

ARG source=https://download.jetbrains.com/idea/ideaIC-${BUILD}.tar.gz

WORKDIR /opt/intellij

RUN curl -fsSL $source -o /opt/intellij/installer.tgz \
  && tar --strip-components=1 -xzf installer.tgz \
  && rm installer.tgz

RUN  \
  apt-get update && apt-get install --no-install-recommends -y \
  curl ca-certificates \
  gcc git openssh-client less make bash-completion \
  libxtst-dev libxext-dev libxrender-dev libfreetype6-dev \
  libfontconfig1 libgtk2.0-0 libxslt1.1 libxxf86vm1 \
  && rm -rf /var/lib/apt/lists/*

CMD [ "/opt/intellij/bin/idea.sh" ]
