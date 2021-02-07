---
title: "Working with Go Modules and Docker"
linkTitle: "Working with Go Modules and Docker"
weight: 609
description: >-
     Working with Go Modules and Docker
---



Let’s look at a more complex example which features imported modules. In this instance, we will need to add a step within our Dockerfile which does the job of downloading our dependencies prior to the go build command executing:

{{< codenew file="/Golang/simple-app/Dockerfile.module" >}}


# Goapp - Building Images Faster and Better With Multi-Stage Builds

Docker provides a set of [standard practices](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/) to follow in order to keep your image size small - also covers multi-stage builds in brief.

Let’s start without using multi-stage builds.

```
Dockerfile
FROM golang
ADD . /app
WORKDIR /app
RUN go build # This will create a binary file named app
ENTRYPOINT /app/app

```

Build and run the image


```
docker build -t goapp .
~/g/helloworld ❯❯❯ docker run -it --rm goapp
Hello World!!


```

Now let us check the image size

```
 ❯❯❯ docker images | grep goapp
goapp                                          latest              b4221e45dfa0        18 seconds ago      805MB

```

New Dockerfile

{{< codenew file="/Golang/go-app/Dockerfile" >}}


Re-build and run the image


```
❯❯❯ docker run -it --rm goapp
Hello World!!

```
Let us check the image again

```

❯❯❯ docker images | grep goapp
goapp                                          latest              100f92d756da        8 seconds ago       8.15MB

```

# What’s happening here?


We are building the image in two stages. First, we are using a Golang base image, copying our code inside it and building our executable file App. Now in the next stage, we are using a new Alpine base image and copying the binary which we built earlier to our new stage. Important point to note here is that the image built at each stage is entirely independent.


- Stage 0

```

# Build executable stage
FROM golang
ADD . /app
WORKDIR /app
RUN go build
ENTRYPOINT /app/app

```
- Stage 1

```
# Build final image
FROM alpine:latest
RUN apk --no-cache add ca-certificates
WORKDIR /root/
COPY --from=0 /app/app .
CMD ["./app”]

```
Note the line COPY —from=0 /app/app  -> this lets you access data from inside the image built in previous image.
