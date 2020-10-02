FROM hauer/dojo:0.10

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
    && apk add --no-cache openjdk15 \
    && ln -s /usr/lib/jvm/default-jvm/bin/javac /usr/bin/javac \
    && echo "Testing java" \
    && javac --version