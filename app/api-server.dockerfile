ARG BASE_IMAGE=llamaedge/ubuntu-base:latest
FROM $BASE_IMAGE
MAINTAINER hydai hydai@secondstate.io
ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /app

# Download the latest llamaedge api server
RUN curl -LO https://github.com/second-state/llama-utils/releases/latest/download/llama-api-server.wasm
