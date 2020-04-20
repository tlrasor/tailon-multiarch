# tailon-multiarch
Repository for multiarch docker builds containing tailon

[Tailon](https://github.com/gvalkov/tailon) is an insanely useful webapp for tailing and grepping log files. There's not a good multiarch build available from the project officially so this repo contains a basic tailon and multiarch build on dockerhub at `tlrasor/tailon`.


## How to use plz

`docker run --rm -v "$LOGSDIR:/tailon" tlrasor/tailon /tailon/*.log`

## But what about swarm mode?

```
version: "3.7"
 
services: 
  tailon: 
    image: "tlrasor/tailon:78e9813"
    volumes: 
      - "logging-shared:/tailon" 
    ports: 
      - 8888:8888
    command: "/tailon/*.log"
    deploy:
      resources:
        limits:
          memory: 64M
        reservations:
          memory: 16M

```
