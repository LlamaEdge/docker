# llama2 7b model image

Inherit from the `llamaedge/api-server`

Download the Llama-2-7b-chat-hf-Q5\_K\_M.gguf model

## Build

```console
docker buildx build --push --platform linux/amd64,linux/arm64 -t llamaedge/llama2-7b:latest -f llama2-7b.dockerfile .
```

## Use

```console
# docker run --rm -p host_port:8080 --name llama27b llamaedge/llama2-7b:latest
docker run --rm -p 28080:8080 --name llama27b llamaedge/llama2-7b:latest
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
docker stop llama27b
```

## Supported platforms

* linux/amd64
* linux/arm64
