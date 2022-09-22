FROM node:16-bullseye

LABEL maintainer="Picter <developers@picter.com>"

RUN apt-get update && apt-get install -y \
  # docker dependencies
  ca-certificates \
  curl \
  gnupg \
  lsb-release \
  # other tools
  git \
  gzip \
  openssh-client \
  tar \
  bash \
  zip \
  jq

# Install docker (https://docs.docker.com/engine/install/debian/)
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
RUN  echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
RUN apt-get update && apt-get install -y \
  docker-ce \
  docker-ce-cli \
  containerd.io \
  && rm -rf /var/lib/apt/lists/*

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
  && unzip awscliv2.zip \
  && ./aws/install \
  && rm -rf awscliv2.zip
