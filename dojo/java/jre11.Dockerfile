FROM hauer/dojo:0.10

RUN apk add openjdk11-jre \
     && echo "Testing java" \
     && java --version