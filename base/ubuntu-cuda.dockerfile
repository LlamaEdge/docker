FROM ubuntu:22.04
MAINTAINER hydai hydai@secondstate.io
ARG TARGETARCH
ENV DEBIAN_FRONTEND=noninteractive
ENV NNARCH=$TARGETARCH

WORKDIR /app

RUN apt-get update && apt-get install -y curl git python3 wget
COPY ./install_cuda_amd64.sh /app
COPY ./install_cuda_arm64.sh /app
RUN /app/install_cuda_$NNARCH.sh
RUN curl -sSf https://raw.githubusercontent.com/WasmEdge/WasmEdge/master/utils/install.sh | bash -s -- --version 0.13.5 --plugins wasi_nn-ggml wasmedge_rustls -p /usr/local
RUN rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["/bin/bash"]
