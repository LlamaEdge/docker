# API Server image

Inherit from the `llamaedge/ubuntu-base`

Download the latest llamaedge api seerver

## Build

```console
docker buildx build --push --platform linux/amd64,linux/arm64 -t llamaedge/api-server:latest -f api-server.dockerfile .
```

## Supported platforms

* linux/amd64
* linux/arm64
