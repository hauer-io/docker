FROM hauer/dojo:jdk

ENV MAVEN_HOME /opt/maven
ENV MAVEN_VERSION 3.6.3

RUN set -o errexit -o nounset \
    && echo "Downloading maven" \
    && wget --no-verbose --output-document=maven.tgz "ftp://ftp.halifax.rwth-aachen.de/apache/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz" \
    && echo "Installing maven" \
    && tar -xf maven.tgz \
    && rm maven.tgz \
    && mv "apache-maven-${MAVEN_VERSION}" "${MAVEN_HOME}/" \
    && ln -s "${MAVEN_HOME}/bin/mvn" /usr/bin/mvn \
    && echo "Testing maven installation" \
    && mvn --version