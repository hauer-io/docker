FROM hauer/dojo:jre

ENV JMETER_HOME /opt/jmeter
ENV JMETER_VERSION 5.3

RUN set -o errexit -o nounset \
    && echo "Downloading jmeter" \
    && wget --no-verbose --output-document=jmeter.tgz "https://apache.mirror.digionline.de//jmeter/binaries/apache-jmeter-${JMETER_VERSION}.tgz" \
    && echo "Installing jmeter" \
    && tar -xf jmeter.tgz \
    && rm jmeter.tgz \
    && mv "apache-jmeter-${JMETER_VERSION}" "${JMETER_HOME}/" \
    && ln -s "${JMETER_HOME}/bin/jmeter" /usr/bin/jmeter \
    && echo "Testing jmeter installation" \
    && jmeter --version