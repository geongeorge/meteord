#!/bin/bash
set -x

: ${NODE_VERSION?"NODE_VERSION has not been set."}

docker build --build-arg "NODE_VERSION=${NODE_VERSION}" -t "uncleiroh/meteord-puppeteer:node-${NODE_VERSION}-base" ../base && \
  docker tag "uncleiroh/meteord-puppeteer:node-${NODE_VERSION}-base" uncleiroh/meteord-puppeteer:base
docker build --build-arg "NODE_VERSION=${NODE_VERSION}" -t "uncleiroh/meteord-puppeteer:node-${NODE_VERSION}-onbuild" ../onbuild && \
  docker tag "uncleiroh/meteord-puppeteer:node-${NODE_VERSION}-onbuild" uncleiroh/meteord-puppeteer:onbuild
docker build --build-arg "NODE_VERSION=${NODE_VERSION}" -t "uncleiroh/meteord-puppeteer:node-${NODE_VERSION}-devbuild" ../devbuild && \
  docker tag "uncleiroh/meteord-puppeteer:node-${NODE_VERSION}-devbuild" uncleiroh/meteord-puppeteer:devbuild
docker build --build-arg "NODE_VERSION=${NODE_VERSION}" -t "uncleiroh/meteord-puppeteer:node-${NODE_VERSION}-binbuild" ../binbuild && \
  docker tag "uncleiroh/meteord-puppeteer:node-${NODE_VERSION}-binbuild" uncleiroh/meteord-puppeteer:binbuild
