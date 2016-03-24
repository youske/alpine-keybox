
FROM frolvlad/alpine-oraclejdk8

ENV PACKAGE="bash wget" \
    KEYBOX_VERSION=2.85_01 \
    KEYBOX_BASE=/keybox \
    KEYBOX_PORT=8443

RUN apk add ${PACKAGE} --no-cache
RUN wget -q "https://github.com/skavanagh/KeyBox/releases/download/v2.85.01/keybox-jetty-v2.85_01.tar.gz" --no-check-certificate -O- | tar zx && \
    mv /KeyBox-jetty ${KEYBOX_BASE}

WORKDIR /keybox
CMD ["bash"]
#CMD ["./startKeyBox.sh"]

EXPOSE ${KEYBOX_PORT}
