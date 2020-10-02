FROM hauer/dojo:0.10

RUN apk add openjdk11 \
    && ln -s /usr/lib/jvm/default-jvm/bin/javac /usr/bin/javac \
    && echo "Testing java" \
    && javac --version