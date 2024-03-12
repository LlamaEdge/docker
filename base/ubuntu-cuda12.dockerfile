FROM ubuntu:22.04
MAINTAINER hydai hydai@secondstate.io
ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /app

RUN apt-get update && apt-get install -y curl git python3 wget
COPY ./install_cuda.sh /app
RUN /app/install_cuda.sh
RUN curl -sSf https://raw.githubusercontent.com/WasmEdge/WasmEdge/master/utils/install.sh | bash -s -- --version 0.13.5 --plugins wasi_nn-ggml wasmedge_rustls -p /usr/local
RUN rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["/bin/bash"]
