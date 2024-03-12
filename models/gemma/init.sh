#!/bin/bash

wasmedge \
	--dir .:. \
	--nn-preload default:GGML:AUTO:gemma-2b-it-Q5_K_M.gguf \
	llama-api-server.wasm \
	-p gemma-instruct \
	-c 4096 \
	--model-name gemma-2b-it \
	--socket-addr 0.0.0.0:8080 \
	--log-prompts --log-stat
