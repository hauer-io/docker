FROM openjdk:15-jdk-buster

ENTRYPOINT ["/sbin/tini", "-g", "--", "/usr/bin/entrypoint.sh"]


ENV TINI_VERSION v0.18.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /sbin/tini
RUN chmod +x /sbin/tini

# Install common Dojo scripts
ENV DOJO_VERSION=0.10.0
ENV RUNTIME_DEPS="fish sudo git ca-certificates wget make python3"
RUN apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends $RUNTIME_DEPS && \
  git clone --depth 1 -b ${DOJO_VERSION} https://github.com/kudulab/dojo.git /tmp/dojo_git &&\
  /tmp/dojo_git/image_scripts/src/install.sh && \
  rm -r /tmp/dojo_git

# Install yamllint
COPY yaml.config /home/dojo/.config/yamllint/config
ENV YAMLLINT_VERSION 1.23.0
ENV BUILD_DEPS="python3-setuptools python3-pip python3-wheel"
RUN apt-get install -y --no-install-recommends $BUILD_DEPS && \
    pip3 install yamllint==$YAMLLINT_VERSION && \
    apt-get remove -y $BUILD_DEPS

# Install gradle
ENV GRADLE_VERSION 6.7
ENV GRADLE_HOME /usr/lib/gradle/gradle-${GRADLE_VERSION}
RUN cd /tmp &&\
  wget https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip &&\
  unzip gradle-${GRADLE_VERSION}-bin.zip && mv gradle-${GRADLE_VERSION}/ /usr/lib/ &&\
  rm gradle-${GRADLE_VERSION}-bin.zip &&\
  ln -s /usr/lib/gradle-${GRADLE_VERSION}/bin/gradle /usr/bin/gradle

# Install maven
ENV MAVEN_VERSION 3.6.3
RUN cd /tmp/ &&\
  wget --quiet http://archive.apache.org/dist/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.zip &&\
  unzip apache-maven-${MAVEN_VERSION}-bin.zip &&\
  mv apache-maven-${MAVEN_VERSION} /usr/lib/ &&\
  rm apache-maven-${MAVEN_VERSION}-bin.zip &&\
  ln -s /usr/lib/apache-maven-${MAVEN_VERSION}/bin/mvn /usr/bin/mvn

COPY etc_dojo.d/scripts/* /etc/dojo.d/scripts/
COPY config.fish /etc/fish/config.fish

# Set Work-DIR
WORKDIR /dojo/work
CMD ["/usr/bin/fish"]