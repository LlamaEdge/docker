# Gemma 2b it model image

Inherit from the `llamaedge/api-server`

Download the gemma-2b-it q5\_k\_m model

## Build

```console
docker buildx build --push --platform linux/amd64,linux/arm64 -t llamaedge/gemma-2b:latest -f gemma-2b.dockerfile .
```

## Use

```console
# docker run --rm -p host_port:8080 --name gemma2b llamaedge/gemma-2b:latest
docker run --rm -p 28080:8080 --name gemma2b llamaedge/gemma-2b:latest
```

In another terminal,

```console
# Call the API server. Please refer to llamaedge docs for the details
$ curl -X POST http://localhost:28080/v1/models -H 'accept:application/json'
{"object":"list","data":[{"id":"gemma-2b-it","created":1710229116,"object":"model","owned_by":"Not specified"}]}

$ curl -X POST http://localhost:28080/v1/chat/completions -H 'accept:application/json' -H 'Content-Type: application/json' -d '{"messages":[{"role":"system", "content": "You are a helpful assistant."}, {"role":"user", "content": "Who is Robert Oppenheimer?"}], "model":"llama-2-chat"}'
{"id":"d6c6acec-f3f3-43eb-b19e-bf80dcd635db","object":"chat.completion","created":1710229153,"model":"llama-2-chat","choices":[{"index":0,"message":{"role":"assistant","content":"Robert Oppenheimer was a theoretical physicist who played a pivotal role in the development of the atomic bomb during World War II. He was born in New York City in 1904 and earned his bachelor's degree from Columbia University in 1925. He went on to pursue his doctorate at the University of Göttingen in Germany, where he worked with Max Born. Oppenheimer returned to the United States in 1935 and became a professor of physics at the University of California, Berkeley.\n\nIn 1942, Oppenheimer was recruited by the Manhattan Project, the government agency responsible for developing the atomic bomb. He became the project's director in 1943 and played a leading role in the development of the first atomic bombs. Oppenheimer was involved in the testing of the first atomic bomb, \"Little Boy,\" in New Mexico in 1945. He was also involved in the development of the hydrogen bomb, which was tested in the atmosphere over the Pacific Ocean in 1946.\n\nAfter the war, Oppenheimer continued to work on nuclear physics and served as a consultant for the Atomic Energy Commission. He died in 1967 at the age of 63."},"finish_reason":"stop"}],"usage":{"prompt_tokens":13,"completion_tokens":249,"total_tokens":262}}
```

## Stop the container

Ctrl-C may take no effects, use `docker stop` to halt the container.

```console
docker stop gemma2b
```

## Supported platforms

* linux/amd64
* linux/arm64
