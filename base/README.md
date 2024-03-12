# Ubuntu base image

Use Ubuntu 22.04 as the base image.

Install the wasmedge toolchain.

## Build

```console
docker buildx build --push --platform linux/amd64,linux/arm64 -t llamaedge/ubuntu-base:latest -f ubuntu.dockerfile .
```

## Supported platforms

* linux/amd64
* linux/arm64
