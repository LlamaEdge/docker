docker buildx build --push --no-cache --platform linux/amd64,linux/arm64 -t llamaedge/api-server:latest -f api-server.dockerfile .
docker buildx build --push --no-cache --build-arg BASE_IMAGE=llamaedge/ubuntu-cuda:latest --platform linux/amd64,linux/arm64 -t llamaedge/api-server-cuda:latest -f api-server.dockerfile .
