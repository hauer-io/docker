#!/bin/bash -e

dojouid=$(ls -n -d "${dojo_home}" | awk '{ print $3 }')

chown dojo:dojo /var/run/docker.sock
