#!/bin/bash

wasmedge \
	--dir .:. \
	--nn-preload default:GGML:AUTO:Mixtral-8x7B-Instruct-v0.1-Q5_K_M.gguf \
	llama-api-server.wasm \
	-p mistral-instruct \
	-c 4096 \
	--model-name mixtral-8x7b-inst-v0.1 \
	--socket-addr 0.0.0.0:8080 \
	--log-prompts --log-stat
