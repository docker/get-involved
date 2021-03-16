---
title: "Building and Running a Docker Container"
linkTitle: "Building and Running a Docker Container"
weight: 808
description: >-
     Learn how to build and run a Docker Container
---

- [Build a Docker Image](#build-a-docker-image)
- [Create a dotnet application](#create-a-dotnet-application)
 
## Build a Docker Image

This section explains how to create a Docker image.

## Dockerfile

Docker build images by reading instructions from a _Dockerfile_. A _Dockerfile_ is a text document that contains all the commands a user could call on the command line to assemble an image. `docker image build` command uses this file and executes all the commands in succession to create an image.

`build` command is also passed a context that is used during image creation. This context can be a path on your local filesystem or a URL to a Git repository.

Dockerfile is usually called Dockerfile. The complete list of commands that can be specified in this file are explained at https://docs.docker.com/reference/builder/. The common commands are listed below:

## Common commands for Dockerfile

| Command | Purpose | Example |
:------------ | :-------------| :-------------|
| FROM | First non-comment instruction in _Dockerfile_ | `FROM ubuntu`
| COPY | Copies mulitple source files from the context to the file system of the container at the specified path | `COPY .bash_profile /home`
| ENV | Sets the environment variable | `ENV HOSTNAME=test`
| RUN | Executes a command | `RUN apt-get update`
| CMD | Defaults for an executing container | `CMD ["/bin/echo", "hello world"]`
| EXPOSE | Informs the network ports that the container will listen on | `EXPOSE 8093`
|==================

## Create your first image

Create a new directory `hellodocker`.

In that directory, create a new text file `Dockerfile`. Use the following contents:

```
FROM ubuntu:latest

CMD ["/bin/echo", "hello world"]
```

This image uses `ubuntu` as the base image. `CMD` command defines the command that needs to run. It provides a different entry point of `/bin/echo` and an argument "`hello world`".

## Build the image

```
  docker image build . -t helloworld
```

`.` in this command is the context for the command `docker image build`. `-t` adds a tag to the image.

The following output is shown:

```
Sending build context to Docker daemon  2.048kB
Step 1/2 : FROM ubuntu:latest
latest: Pulling from library/ubuntu
9fb6c798fa41: Pull complete 
3b61febd4aef: Pull complete 
9d99b9777eb0: Pull complete 
d010c8cf75d7: Pull complete 
7fac07fb303e: Pull complete 
Digest: sha256:31371c117d65387be2640b8254464102c36c4e23d2abe1f6f4667e47716483f1
Status: Downloaded newer image for ubuntu:latest
 ---> 2d696327ab2e
Step 2/2 : CMD /bin/echo hello world
 ---> Running in 9356a508590c
 ---> e61f88f3a0f7
Removing intermediate container 9356a508590c
Successfully built e61f88f3a0f7
Successfully tagged helloworld:latest
```

## List the images 

You can list the images available using `docker image ls`:

```
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
helloworld          latest              e61f88f3a0f7        3 minutes ago       122MB
ubuntu              latest              2d696327ab2e        4 days ago          122MB
```

Other images may be shown as well but we are interested in these two images for now.

Run the container using the command:

```
docker container run helloworld
```

to see the output:

```
hello world
```

If you do not see the expected output, check your Dockerfile that the content exactly matches as shown above. Build the image again and now run it.

Change the base image from `ubuntu` to `busybox` in `Dockerfile`. Build the image again:

```  
docker image build -t helloworld:2 .
```

and view the images using `docker image ls` command:

```
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
helloworld          2                   7fbedda27c66        3 seconds ago       1.13MB
helloworld          latest              e61f88f3a0f7        5 minutes ago       122MB
ubuntu              latest              2d696327ab2e        4 days ago          122MB
busybox             latest              54511612f1c4        9 days ago          1.13MB
```

`helloworld:2` is the format that allows to specify the image name and assign a tag/version to it separated by `:`.

## Create a dotnet application

1. In your terminal, type the following command

```
dotnet new console -o myApp
```
You should see the output in terminal

```
# dotnet new console -o myApp
Getting ready...
The template "Console Application" was created successfully.

Processing post-creation actions...
Running 'dotnet restore' on myApp/myApp.csproj...
  Determining projects to restore...
  Restored /myApp/myApp.csproj (in 90 ms).
Restore succeeded.
```

this will bootstrap a new console application from template shipped with dotnet sdk. The -o parameter creates a directory named myApp where your app is stored.


2. Navigate to the application directory

```
cd myApp
```
you will have a Program.cs file

```
using System;

namespace myApp
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Hello World!");
        }
    }
}
```

3. In your terminal, type the following command to run your application

```
dotnet run
```
you would expect the "Hello World" will be printed out in terminal

4. Put the application in the container

Create Dockerfile with following content:

```
FROM mcr.microsoft.com/dotnet/sdk as build
COPY . ./src
WORKDIR /src
RUN dotnet build -o /app

FROM mcr.microsoft.com/dotnet/runtime as base
COPY --from=build  /app /app
WORKDIR /app
CMD ["./myApp"]

```

Now that we have defined everything we need to run in our Dockerfile we can now build an image using this file. In order to do that, we’ll need to run the following command:

```
$ docker build -t myapp .
[+] Building 8.4s (13/13) FINISHED
 => [internal] load build definition from Dockerfile                       0.0s
 => => transferring dockerfile: 37B                                        0.0s
 => [internal] load .dockerignore                                          0.0s
 => => transferring context: 2B                                            0.0s
 => [internal] load metadata for mcr.microsoft.com/dotnet/runtime:latest   4.2s
 => [internal] load metadata for mcr.microsoft.com/dotnet/sdk:latest       0.0s
 => [internal] load build context                                          0.0s
 => => transferring context: 359B                                          0.0s
 => CACHED [build 1/4] FROM mcr.microsoft.com/dotnet/sdk                   0.0s
 => CACHED [base 1/3] FROM mcr.microsoft.com/dotnet/runtime@sha256:8fbb07  0.0s
 => [build 2/4] COPY . ./src                                               0.0s
 => [build 3/4] WORKDIR /src                                               0.0s
 => [build 4/4] RUN dotnet build -o /app                                   3.6s
 => [base 2/3] COPY --from=build  /app /app                                0.0s
 => [base 3/3] WORKDIR /app                                                0.0s
 => exporting to image                                                     0.0s
 => => exporting layers                                                    0.0s
 => => writing image sha256:51886aa5cafd278e6cd2b2ea3ed586dac675b4aaae606  0.0s
 => => naming to docker.io/library/myapp                                   0.0s

```

We can now verify that our image exists on our machine by using `docker images` command:

```
$ docker images
REPOSITORY                                                 TAG       IMAGE ID       CREATED          SIZE
myapp                                                      latest    51886aa5cafd   31 seconds ago   186MB
```

In order to run this newly created image, we can use the docker run command and pass in the ports we want to map to and the image we wish to run.

```
$ docker run --rm myapp
Hello World
```


- `-it` - This flag specifies that we want to run this image in interactive mode with a tty for this container process.
- `--rm` - This flag will clean the container after it runs
- `myapp ` - This is the name of the image that we want to run in a container.

Now we have a dockerized dotnet application.