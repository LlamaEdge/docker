ARG BASE_IMAGE=llamaedge/api-server:latest
FROM $BASE_IMAGE
ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /app

ARG MODEL_URL='https://huggingface.co/second-state/Gemma-2b-it-GGUF/resolve/main/gemma-2b-it-Q5_K_M.gguf'
ARG PROMPT_FORMAT='gemma-instruct'
ARG CONTEXT_SIZE=4096

# Download the model file.
RUN curl -L -o $(basename $MODEL_URL) $MODEL_URL

# Generate the init script.
RUN cat > /app/init.sh <<EOF
#!/bin/bash
set -e
MODEL_FILE=$(basename $MODEL_URL)
wasmedge \\
	--dir .:. \\
	--nn-preload "default:GGML:AUTO:\$MODEL_FILE" \\
	llama-api-server.wasm \\
	-p "$PROMPT_FORMAT" \\
	-c "$CONTEXT_SIZE" \\
	--model-name "\$MODEL_FILE" \\
	--socket-addr 0.0.0.0:8080 \\
	--log-prompts --log-stat
EOF
RUN chmod +x /app/init.sh

# Execute the API server
ENTRYPOINT ["/bin/bash"]
CMD ["/app/init.sh"]
