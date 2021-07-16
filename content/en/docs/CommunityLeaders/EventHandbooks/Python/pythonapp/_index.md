---
title: "Dockerize Your First Python Application"
linkTitle: "Dockerize Your First Python Application"
weight: 609
description: >-
     How to containerize your first Python Application
---



Create the app.py file with the following content:
{{< codenew file="/Python/pythonapp/app.py" >}}

Now that we have our server, let’s set about writing our Dockerfile and constructing the container in which our newly born Go application will live.

create dockerfile with following content:
{{< codenew file="/Python/pythonapp/Dockerfile" >}}


Now that we have defined everything we need for our Python application to run in our Dockerfile we can now build an image using this file. In order to do that, we’ll need to run the following command:

```
$ docker build -t my-python-app .
Sending build context to Docker daemon   5.12kB
Step 1/6 : FROM python:3.8-alpine
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
Removing intermediate container 15805f4f7685
 ---> 31828faf8ae4
Step 5/6 : CMD ["python", "app.py"]
 ---> Running in 9d54463b7e84
Removing intermediate container 9d54463b7e84
 ---> 3f9244a1a240
Successfully built 3f9244a1a240
Successfully tagged my-python-app:latest

```
We can now verify that our image exists on our machine by typing docker images:

```
$ docker images
REPOSITORY                                 TAG                 IMAGE ID            CREATED             SIZE
my-python-app                             latest              3f9244a1a240        2 minutes ago       355MB$ docker images


```
In order to run this newly created image, we can use the docker run command and pass in the ports we want to map to and the image we wish to run.

```
$ docker run -p 8000:5000 -it my-python-app

```

- `-p 8000:5000` - This exposes our application which is running on port 8081 within our container on http://localhost:8000 on our local machine.
- `-it` - This flag specifies that we want to run this image in interactive mode with a tty for this container process.
- `my-python-app ` - This is the name of the image that we want to run in a container.


Awesome, if we open up http://localhost:8000 within our browser, we should see that our application is successfully responding with `Hello, "/".`

# Running our Container In the Background

You’ll notice that if we `ctrl-c` this within the terminal, it will kill the container. If we want to have it run permanently in the background, you can replace -it with `-d ` to run this container in detached mode.

In order to view the list of containers running in the background you can use docker ps which should output something like this:

```
$ docker ps
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                    NAMES
70fcc9195865        my-python-app    "python app.py"           5 seconds ago       Up 3 seconds        0.0.0.0:8080->8081/tcp   silly_swirles

```
