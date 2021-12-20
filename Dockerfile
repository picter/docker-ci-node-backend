FROM node:12

LABEL maintainer="Picter <developers@picter.com>"

RUN apt-get update && apt-get install -y \
  ca-certificates \
  git \
  gzip \
  docker \
  openssh-client \
  tar \
  bash \
  zip \
  jq \
  && rm -rf /var/cache/apk/*
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
  && unzip awscliv2.zip \
  && ./aws/install
