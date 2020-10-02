FROM alpine:3.12

ENTRYPOINT ["/sbin/tini", "-g", "--", "/usr/bin/entrypoint.sh"]

# Install common Dojo scripts
ENV DOJO_VERSION=0.10.0
ENV RUNTIME_DEPS="tini bash fish shadow sudo git ca-certificates wget tar make"

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories \
    && apk add --no-cache  $RUNTIME_DEPS \
    && git clone --depth 1 -b ${DOJO_VERSION} https://github.com/kudulab/dojo.git /tmp/dojo_git \
    && /tmp/dojo_git/image_scripts/src/install.sh \
    && rm -r /tmp/dojo_git

WORKDIR /dojo/work
CMD ["/usr/bin/fish"]