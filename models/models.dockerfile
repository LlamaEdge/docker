ARG BASE_IMAGE=llamaedge/api-server:latest
FROM $BASE_IMAGE
ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /app

ARG MODEL
COPY ./config.sh /app
RUN ./config.sh $MODEL

# Execute api server
ENTRYPOINT ["/bin/bash"]
CMD ["/app/init.sh"]
