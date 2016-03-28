
FROM frolvlad/alpine-oraclejdk8
MAINTAINER youske miyakoshi <youske@gmail.com>

ENV PACKAGE="bash wget" \
    GOSU=https://github.com/tianon/gosu/releases/download/1.7/gosu-amd64 \
    KEYBOX_VERSION=2.85_01 \
    KEYBOX_BASE=/keybox \
    KEYBOX_PORT=8443

RUN adduser -D -h /home/admin -s /bin/bash admin admin && \
    apk upgrade --no-cache && apk add  ${PACKAGE} --no-cache

RUN wget -q --no-check-certificate -O /usr/local/bin/gosu ${GOSU} && \
    chmod +x /usr/local/bin/gosu

RUN wget -q "https://github.com/skavanagh/KeyBox/releases/download/v2.85.01/keybox-jetty-v2.85_01.tar.gz" --no-check-certificate -O- | tar zx && \
    mv /KeyBox-jetty ${KEYBOX_BASE}

COPY entrypoint.sh /docker-entrypoint.sh

WORKDIR ${KEYBOX_BASE}
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["keybox"]

EXPOSE ${KEYBOX_PORT}
