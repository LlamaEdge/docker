docker buildx build --push --no-cache --platform linux/amd64,linux/arm64 -t llamaedge/ubuntu-base:latest -f ubuntu.dockerfile .
docker buildx build --push --no-cache --platform linux/amd64,linux/arm64 -t llamaedge/ubuntu-cuda:latest -f ubuntu-cuda.dockerfile .
