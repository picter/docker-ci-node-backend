FROM node:8.11.1-alpine

LABEL maintainer="Picter <developers@picter.com>"

RUN apk add -Uuv \
  ca-certificates \
  git \
  gzip \
  docker \
  openssh-client \
  python \
  py-pip \
  tar \
  bash \
  zip \
  jq \
  && rm -rf /var/cache/apk/*
RUN pip install awscli
