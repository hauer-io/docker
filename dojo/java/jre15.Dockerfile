FROM hauer/dojo:0.10

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
    && apk add openjdk15-jre \
    && echo "Testing java" \
    && java --version