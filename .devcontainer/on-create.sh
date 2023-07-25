#!/bin/bash

# Do things that take time and require the internet

sudo apt update -y
sudo apt install -y python3 python3-pip

git clone https://github.com/devcontainers/cli  /tmp/devcontainer-cli-src
cd /tmp/devcontainer-cli-src
yarn
yarn compile

LATEST_RELEASE=$(curl -L "https://api.github.com/repos/localstack/localstack-cli/tags" | jq -r '.[0].name' | tr -d 'v')
wget -q -O /tmp/localstack.tar.gz \
    https://github.com/localstack/localstack-cli/releases/download/v${LATEST_RELEASE}/localstack-cli-${LATEST_RELEASE}-linux-amd64-onefile.tar.gz  \
    localstack-cli-${LATEST_RELEASE}-linux-amd64-onefile.tar.gz
tar -xzf /tmp/localstack.tar.gz -C /tmp
sudo mv /tmp/localstack /usr/local/bin/localstack

pip install awscli-local[ver1]