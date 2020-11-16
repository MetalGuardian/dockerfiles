FROM debian

ENV GOBIN=/usr/local/go/bin
ENV GOROOT=/usr/local/go
ENV GOPATH=/root/go

ARG GO_VERSION=1.14.4
ARG GOLAND_BUILD=202.6397.65

ARG go_source=https://dl.google.com/go/go${GO_VERSION}.linux-amd64.tar.gz

RUN  \
  apt-get update && apt-get install --no-install-recommends -y \
  curl ca-certificates \
  gcc git openssh-client less \
  libxtst-dev libxext-dev libxrender-dev libfreetype6-dev \
  libfontconfig1 libgtk2.0-0 libxslt1.1 libxxf86vm1 \
  fuse \
  && rm -rf /var/lib/apt/lists/* \
  && curl -fsSL $go_source -o /tmp/golang.tar.gz \
  && tar -C /usr/local -xzf /tmp/golang.tar.gz \
  && rm /tmp/golang.tar.gz \
  && ln -s /usr/local/go/bin/go /usr/bin/go \
  && ln -s /usr/local/go/bin/gofmt /usr/bin/gofmt

ARG goland_source=https://download.jetbrains.com/go/goland-${GOLAND_BUILD}.tar.gz

WORKDIR /opt/goland

RUN curl -fsSL $goland_source -o /opt/goland/installer.tgz \
  && tar --strip-components=1 -xzf installer.tgz \
  && rm installer.tgz

CMD [ "/opt/goland/bin/goland.sh" ]
