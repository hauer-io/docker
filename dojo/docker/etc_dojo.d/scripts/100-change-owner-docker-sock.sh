#!/bin/bash -e

if [ -f "/var/run/docker.sock" ]; then
   chown dojo:dojo "/var/run/docker.sock"
fi