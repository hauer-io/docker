#!/bin/bash -e

# those are set by a base image, but when using dojo, user may have overwritten
# them, so set them again:
export JAVA_HOME=/usr/local/openjdk-15
export JAVA_VERSION=15
