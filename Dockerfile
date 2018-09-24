FROM alpine:latest
MAINTAINER Jens Schneider <murican87@gmail.com>

ENV VERSION 0.8.1

ENV LANG C.UTF-8
ENV JAVA_HOME /usr/lib/jvm/java-1.8-openjdk
ENV JAVA_VERSION 8u171
ENV JAVA_ALPINE_VERSION 8.171.11-r0
ENV PATH $PATH:/usr/lib/jvm/java-1.8-openjdk/jre/bin:/usr/lib/jvm/java-1.8-openjdk/bin

RUN echo 'http://dl-cdn.alpinelinux.org/alpine/edge/community' >> /etc/apk/repositories
RUN apk add --no-cache wget unzip gzip bash

RUN { \
    echo '#!/bin/sh'; \
    echo 'set -e'; \
    echo; \
    echo 'dirname "$(dirname "$(readlink -f "$(which javac || which java)")")"'; \
  } > /usr/local/bin/docker-java-home \
  && chmod +x /usr/local/bin/docker-java-home

RUN set -x \
  && apk add --no-cache \
    openjdk8="$JAVA_ALPINE_VERSION" \
  && [ "$JAVA_HOME" = "$(docker-java-home)" ]

RUN mkdir /usr/local/share/cerebro
RUN wget -qO /tmp/cerebro.tgz  https://github.com/lmenezes/cerebro/releases/download/v${VERSION}/cerebro-${VERSION}.tgz && \
  tar xvzf /tmp/cerebro.tgz -C /usr/local/share/cerebro/
RUN rm -f /tmp/cerebro.tgz

EXPOSE 9000
COPY run.sh /run.sh

CMD ["/bin/sh", "/run.sh"]
