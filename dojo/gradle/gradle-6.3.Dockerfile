FROM hauer/dojo:jdk

ENV GRADLE_HOME /opt/gradle
ENV GRADLE_VERSION 6.6.1

RUN set -o errexit -o nounset \
    && echo "Downloading gradle" \
    && wget --no-verbose --output-document=gradle.zip "https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip" \
    && echo "Installing gradle" \
    && unzip gradle.zip \
    && rm gradle.zip \
    && mv "gradle-${GRADLE_VERSION}" "${GRADLE_HOME}/" \
    && ln -s "${GRADLE_HOME}/bin/gradle" /usr/bin/gradle \
    && echo "Testing GRADLE installation" \
    && gradle --version