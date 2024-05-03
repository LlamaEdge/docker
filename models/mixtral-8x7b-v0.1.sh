export MODEL_URL="https://huggingface.co/second-state/Mixtral-8x7B-Instruct-v0.1-GGUF/resolve/main/Mixtral-8x7B-Instruct-v0.1-Q5_K_M.gguf"
export PROMPT_FORMAT=mistral-instruct
export CONTEXT_SIZE=4096
docker buildx \
	build --no-cache --push \
	--build-arg BASE_IMAGE=llamaedge/api-server:latest \
	--build-arg MODEL_URL=$MODEL_URL \
	--build-arg PROMPT_FORMAT=$PROMPT_FORMAT \
	--build-arg CONTEXT_SIZE=$CONTEXT_SIZE \
	--platform linux/amd64,linux/arm64 \
	-t llamaedge/mixtral-8x7b:latest \
	-f models.dockerfile .

docker buildx \
	build --no-cache --push \
	--build-arg BASE_IMAGE=llamaedge/api-server-cuda:latest \
	--build-arg MODEL_URL=$MODEL_URL \
	--build-arg PROMPT_FORMAT=$PROMPT_FORMAT \
	--build-arg CONTEXT_SIZE=$CONTEXT_SIZE \
	--platform linux/amd64,linux/arm64 \
	-t llamaedge/mixtral-8x7b-cuda:latest \
	-f models.dockerfile .
