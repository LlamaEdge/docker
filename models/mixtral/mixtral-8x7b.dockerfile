FROM llamaedge/api-server:latest
MAINTAINER hydai hydai@secondstate.io
ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /app

# Download the model
RUN curl -LO https://huggingface.co/second-state/Mixtral-8x7B-Instruct-v0.1-GGUF/resolve/main/Mixtral-8x7B-Instruct-v0.1-Q5_K_M.gguf

COPY ./init.sh /app

# Execute api server
ENTRYPOINT ["nohup", "/app/init.sh"]
