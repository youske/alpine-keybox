
FROM frolvlad/alpine-oraclejdk8
MAINTAINER youske miyakoshi <youske@gmail.com>

ENV PACKAGE="" \
    KEYBOX_VERSION=2.85_01 \
    KEYBOX_BASE=/keybox \
    KEYBOX_PORT=8443

RUN apk upgrade --no-cache && apk add ${PACKAGE} --no-cache
RUN wget -q "https://github.com/skavanagh/KeyBox/releases/download/v2.85.01/keybox-jetty-v2.85_01.tar.gz" --no-check-certificate -O- | tar zx && \
    mv /KeyBox-jetty ${KEYBOX_BASE}

EXPOSE ${KEYBOX_PORT}

WORKDIR ${KEYBOX_BASE}
ENTRYPOINT ["switch","shell=/bin/bash","--","./startKeyBox.sh"]
