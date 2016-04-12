#!/usr/bin/env bash

# Getting latest stable version of Nodejs
NODE_STABLE=$(curl -s https://nodejs.org/en/download/stable/| grep "Current stable version"| awk -F "v|</strong>" '{print $3}')

# Updating Dockerfile with latest version
sed -i "s/[0-9]*\.[0-9]*\.[0-9]*$/$NODE_STABLE/g" Dockerfile

# Building docker image
docker build --rm=true --force-rm -t $(id -un)/node:$NODE_STABLE .
