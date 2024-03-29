#!/bin/bash

# This script is used to download the model file and generate the init script.

set -e

[ -z "$1" ] && echo "Usage: $0 <model_name>" && exit 1

# Lowercase the model name
MODEL_NAME=$(echo "$1" | tr '[:upper:]' '[:lower:]')

# Prepare the arguments
case $MODEL_NAME in
    gemma-2b-it)
        MODEL_URL='https://huggingface.co/second-state/Gemma-2b-it-GGUF/resolve/main/gemma-2b-it-Q5_K_M.gguf'
        MODEL_FILE=$(basename $MODEL_URL)
        PROMPT_FORMAT='gemma-instruct'
    ;;
    llama-2-7b-chat)
        MODEL_URL='https://huggingface.co/second-state/Llama-2-7B-Chat-GGUF/resolve/main/Llama-2-7b-chat-hf-Q5_K_M.gguf'
        MODEL_FILE=$(basename $MODEL_URL)
        PROMPT_FORMAT='llama-2-chat'
    ;;
    mixtral-8x7b-instruct)
        MODEL_URL='https://huggingface.co/second-state/Mixtral-8x7B-Instruct-v0.1-GGUF/resolve/main/Mixtral-8x7B-Instruct-v0.1-Q5_K_M.gguf'
        MODEL_FILE=$(basename $MODEL_URL)
        PROMPT_FORMAT='mistral-instruct'
    ;;
    *)
        echo "Unknown model: $MODEL_NAME"
        exit 1
    ;;
esac

# Download the model file
curl -L -o "$MODEL_FILE" "$MODEL_URL"

cat >init.sh <<EOF
#!/bin/bash

set -e

wasmedge \\
	--dir .:. \\
	--nn-preload default:GGML:AUTO:$MODEL_FILE \\
	llama-api-server.wasm \\
	-p $PROMPT_FORMAT \\
	-c 4096 \\
	--model-name $MODEL_NAME \\
	--socket-addr 0.0.0.0:8080 \\
	--log-prompts --log-stat
EOF
chmod +x init.sh
