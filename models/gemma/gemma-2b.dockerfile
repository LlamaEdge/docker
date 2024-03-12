ARG BASE_IMAGE=llamaedge/api-server:latest
FROM $BASE_IMAGE
MAINTAINER hydai hydai@secondstate.io
ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /app

# Download the model
RUN curl -LO https://huggingface.co/second-state/Gemma-2b-it-GGUF/resolve/main/gemma-2b-it-Q5_K_M.gguf

COPY ./init.sh /app

# Execute api server
ENTRYPOINT ["nohup", "/app/init.sh"]
