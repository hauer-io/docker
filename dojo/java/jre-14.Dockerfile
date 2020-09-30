FROM adoptopenjdk:14-jre-hotspot

RUN ln -s /opt/java/openjdk/bin/java /usr/bin/

ENV TINI_VERSION v0.18.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN chmod +x /tini
ENTRYPOINT ["/tini", "-g", "--", "/usr/bin/entrypoint.sh"]

# Install common Dojo scripts
ENV DOJO_VERSION=0.10.0
ENV RUNTIME_DEPS="sudo git ca-certificates wget tar make fish"

RUN echo "Install runtime dependencies: $RUNTIME_DEPS" \
    && apt-get update \
    && apt-get install -y $RUNTIME_DEPS \
    && echo "Add dojo user to sudoers" \
    && echo 'dojo ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers \
    && echo "Install dojo" \
    && git clone --depth 1 -b ${DOJO_VERSION} https://github.com/kudulab/dojo.git /tmp/dojo_git \
    && /tmp/dojo_git/image_scripts/src/install.sh \
    && echo "Cleanup" \
    && rm -r /tmp/dojo_git \
    && apt-get clean

WORKDIR /dojo/work
CMD ["/usr/bin/fish"]