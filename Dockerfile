FROM node:8.10.0-alpine

LABEL maintainer="Picter <developers@picter.com>"

RUN apk add -Uuv \
  ca-certificates \
  git \
  gzip \
  openssh-client \
  python \
  py-pip \
  tar \
  bash \
  zip \
  jq \
  && rm -rf /var/cache/apk/*
RUN pip install awscli
