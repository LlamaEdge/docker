# Mixtral 8x7B Instruct v0.1 model image

Inherit from the `llamaedge/api-server`

Download the Mixtral-8x7B-Instruct-v0.1-Q5\_K\_M model

## Build

```console
docker buildx build --push --platform linux/amd64,linux/arm64 -t llamaedge/mixtral-8x7b:latest -f mixtral-8x7b.dockerfile .
```

## Use

```console
# docker run --rm -p host_port:8080 --name mixtral llamaedge/mixtral-8x7b:latest
docker run --rm -p 28080:8080 --name mixtral llamaedge/mixtral-8x7b:latest
```

In another terminal,

```console
# Call the API server. Please refer to llamaedge docs for the details
$ curl -X POST http://localhost:28080/v1/models -H 'accept:application/json'

$ curl -X POST http://localhost:28080/v1/chat/completions -H 'accept:application/json' -H 'Content-Type: application/json' -d '{"messages":[{"role":"system", "content": "You are a helpful assistant."}, {"role":"user", "content": "Who is Robert Oppenheimer?"}], "model":"llama-2-chat"}'
```

## Stop the container

Ctrl-C may take no effects, use `docker stop` to halt the container.

```console
docker stop mixtral
```

## Supported platforms

* linux/amd64
* linux/arm64
