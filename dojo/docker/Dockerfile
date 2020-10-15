FROM hadolint/hadolint:latest-alpine

ENTRYPOINT ["/sbin/tini", "-g", "--", "/usr/bin/entrypoint.sh"]

# Install common Dojo scripts
ENV DOJO_VERSION=0.10.0
ENV RUNTIME_DEPS="tini bash fish shadow sudo git docker ca-certificates wget docker-compose curl httpie tar make"
RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories \
    && apk add --no-cache  $RUNTIME_DEPS \
    && git clone --depth 1 -b ${DOJO_VERSION} https://github.com/kudulab/dojo.git /tmp/dojo_git \
    && /tmp/dojo_git/image_scripts/src/install.sh \
    && rm -r /tmp/dojo_git

COPY etc_dojo.d/scripts/* /etc/dojo.d/scripts/

# Set Work-DIR
WORKDIR /dojo/work
CMD ["/usr/bin/fish"]
