FROM alpine:latest
MAINTAINER Jens Schneider <murican87@gmail.com>

ARG CEREBRO_VERSION=0.9.4
ARG JAVA_ALPINE_VERSION=11.0.14_p9-r0

ENV LANG C.UTF-8
ENV JAVA_HOME /usr/lib/jvm/java-11-openjdk
ENV PATH $PATH:/usr/lib/jvm/java-11-openjdk/jre/bin:/usr/lib/jvm/java-11-openjdk/bin

RUN echo 'http://dl-cdn.alpinelinux.org/alpine/v3.15/community' >> /etc/apk/repositories
RUN apk update && apk add --no-cache wget unzip gzip bash

RUN { \
    echo '#!/bin/sh'; \
    echo 'set -e'; \
    echo; \
    echo 'dirname "$(dirname "$(readlink -f "$(which javac || which java)")")"'; \
  } > /usr/local/bin/docker-java-home \
  && chmod +x /usr/local/bin/docker-java-home

RUN set -x \
  && apk add --no-cache \
    openjdk11="$JAVA_ALPINE_VERSION" \
  && [ "$JAVA_HOME" = "$(docker-java-home)" ]

RUN mkdir /usr/local/share/cerebro \
  && wget -qO /tmp/cerebro.tgz  https://github.com/lmenezes/cerebro/releases/download/v${CEREBRO_VERSION}/cerebro-${CEREBRO_VERSION}.tgz \
  && tar xvzf /tmp/cerebro.tgz -C /usr/local/share/cerebro/ \
  && rm -f /tmp/cerebro.tgz

ENV CEREBRO_VERSION $CEREBRO_VERSION
EXPOSE 9000
CMD ["/bin/sh", "-c", "/usr/local/share/cerebro/cerebro-${CEREBRO_VERSION}/bin/cerebro"]
