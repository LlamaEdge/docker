# API Service Image with Models

Inherit from the `llamaedge/api-server`

## Supported platforms

* linux/amd64
* linux/arm64

## Supported models

* gemma-2b-it
* llama-2-7b-chat
* mixtral-8x7b-instruct

## Build

The following example demonstrates how to build the `gemma-2b-it` model image and run it.

```bash
export MODEL=gemma-2b-it
docker buildx build --push \
  --platform linux/amd64,linux/arm64 \
  --build-arg MODEL=$MODEL \
  -t llamaedge/$MODEL \
  -f models.dockerfile .
```

## Use

```bash
export MODEL=gemma-2b-it
docker run -it --rm -p 28080:8080 --name $MODEL llamaedge/$MODEL
```

In another terminal,

```console
# Call the API server. Please refer to llamaedge docs for the details
$ curl -X POST http://localhost:28080/v1/models -H 'accept:application/json'

{"object":"list","data":[{"id":"gemma-2b-it","created":1711692329,"object":"model","owned_by":"Not specified"}]}

$ curl -X POST http://localhost:28080/v1/chat/completions -H 'accept:application/json' -H 'Content-Type: application/json' -d '{"messages":[{"role":"system", "content": "You are a helpful assistant."}, {"role":"user", "content": "Who is Robert Oppenheimer?"}], "model":"gemma-2b-it"}'

{"id":"chatcmpl-16747ad9-4d38-4e89-97e4-84029398103f","object":"chat.completion","created":1711692613,"model":"gemma-2b-it","choices":[{"index":0,"message":{"role":"assistant","content":"Robert Oppenheimer was a theoretical physicist who played a pivotal role in the development of the atomic bomb during World War II. He was born in New York City in 1904 and earned his bachelor's degree from Columbia University in 1925. He went on to pursue his doctorate at the University of Göttingen in Germany, where he worked with Max Born. Oppenheimer returned to the United States in 1935 and became a professor of physics at the University of California, Berkeley.\n\nIn 1942, Oppenheimer was recruited by the Manhattan Project, the government agency responsible for developing the atomic bomb. He became the project's director in 1943 and played a leading role in the development of the first atomic bombs. Oppenheimer was involved in the testing of the first atomic bomb, \"Little Boy,\" in New Mexico in 1945. He was also involved in the development of the hydrogen bomb, which was tested in the atmosphere over the Pacific Ocean in 1946.\n\nAfter the war, Oppenheimer continued to work on nuclear physics and served as a consultant for the Atomic Energy Commission. He died in 1967 at the age of 63."},"finish_reason":"stop"}],"usage":{"prompt_tokens":13,"completion_tokens":249,"total_tokens":262}}
```