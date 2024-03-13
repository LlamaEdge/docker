#!/bin/bash

wasmedge \
	--dir .:. \
	--nn-preload default:GGML:AUTO:Llama-2-7b-chat-hf-Q5_K_M.gguf \
	llama-api-server.wasm \
	-p llama-2-chat \
	-c 4096 \
	--model-name llama2-7b-chat-hf \
	--socket-addr 0.0.0.0:8080 \
	--log-prompts --log-stat
