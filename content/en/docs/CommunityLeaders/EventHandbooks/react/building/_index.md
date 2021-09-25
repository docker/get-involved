---
title: "Building and Running a Docker Container"
linkTitle: "Building and Running a Docker Container"
weight: 1008
description: >-
  Learn how to build and run a Docker Container
---

- [Build a Docker Image](#build-a-docker-image)
- [Running a Docker Container](#run-a-docker-container)
- [Example Python Application](#example-python-application)

## Build a Docker Image

This section explains how to create a Docker image.

## Dockerfile

Docker build images by reading instructions from a _Dockerfile_. A _Dockerfile_ is a text document that contains all the commands a user could call on the command line to assemble an image. `docker image build` command uses this file and executes all the commands in succession to create an image.

`build` command is also passed a context that is used during image creation. This context can be a path on your local filesystem or a URL to a Git repository.

Dockerfile is usually called Dockerfile. The complete list of commands that can be specified in this file are explained at https://docs.docker.com/reference/builder/. The common commands are listed below:

## Common commands for Dockerfile

| Command | Purpose                                                                                                 | Example                            |
| :------ | :------------------------------------------------------------------------------------------------------ | :--------------------------------- |
| FROM    | First non-comment instruction in _Dockerfile_                                                           | `FROM ubuntu`                      |
| COPY    | Copies mulitple source files from the context to the file system of the container at the specified path | `COPY .bash_profile /home`         |
| ENV     | Sets the environment variable                                                                           | `ENV HOSTNAME=test`                |
| RUN     | Executes a command                                                                                      | `RUN apt-get update`               |
| CMD     | Defaults for an executing container                                                                     | `CMD ["/bin/echo", "hello world"]` |
| EXPOSE  | Informs the network ports that the container will listen on                                             | `EXPOSE 8093`                      |

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

## Example Python Application

Create a file `app.py` file with the following content:
{{< codenew file="/Python/simple-app/app.py" >}}

The above file needs python flask to run. Add flask to requirements.txt file

{{< codenew file="/Python/simple-app/requirements.txt" >}}

Now that we have our server, let’s set about writing our Dockerfile and construct a container in where our Python application will live.

Create Dockerfile with following content:
{{< codenew file="/Python/simple-app/Dockerfile" >}}

Now that we have defined everything we need for our Python application to run in our Dockerfile we can now build an image using this file. In order to do that, we’ll need to run the following command:

```
$ docker build -t my-python-app .
Sending build context to Docker daemon   5.12kB
Step 1/6 : FROM FROM python:3.8-alpine
 ---> d4953956cf1e
Step 2/6 : RUN mkdir /app
 ---> Using cache
 ---> be346f9ff24f
Step 3/6 : ADD . /app
 ---> eb420da7413c
Step 4/6 : WORKDIR /app
 ---> Running in d623a88e4a00
Removing intermediate container d623a88e4a00
 ---> ffc439c5bec5
Step 5/6 : RUN pip install -r requirements.txt
 ---> Running in 15805f4f7685
Removing intermediate container 15805f4f7685
 ---> 31828faf8ae4
Step 6/6 : CMD ["python", "./app.py"]
 ---> Running in 9d54463b7e84
Removing intermediate container 9d54463b7e84
 ---> 3f9244a1a240
Successfully built 3f9244a1a240
Successfully tagged my-python-app:latest
```

We can now verify that our image exists on our machine by using `docker images` command:

```
$ docker images
REPOSITORY                                 TAG                 IMAGE ID            CREATED             SIZE
my-python-app                             latest              3f9244a1a240        2 minutes ago       355MB$
```

In order to run this newly created image, we can use the docker run command and pass in the ports we want to map to and the image we wish to run.

```
$ docker run -p 8000:5000 -it my-python-app
```

- `-p 8000:5000` - This exposes our application which is running on port 5000 within our container on http://localhost:8000 on our local machine.
- `-it` - This flag specifies that we want to run this image in interactive mode with a tty for this container process.
- `my-python-app ` - This is the name of the image that we want to run in a container.

Awesome! Now if you go to [http://localhost:8000](http://localhost:8000) in your browser, you should see that the application is responds with `Hello World`

### Run Container in Background

You’ll notice that if we `ctrl-c` this within the terminal, it will kill the container. If we want to have it run permanently in the background, you can replace `-it` with `-d ` to run this container in detached mode.

In order to view the list of containers running in the background you can use docker ps which should output something like this:

```
$ docker ps
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                    NAMES
70fcc9195865        my-python-app      "python app.py"          5 seconds ago       Up 3 seconds        0.0.0.0:8080->8081/tcp   silly_swirles
```
