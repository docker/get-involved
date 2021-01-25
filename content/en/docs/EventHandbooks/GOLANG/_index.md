---
title: "GOLANG"
linkTitle: "GOLANG"
weight: 40
description: >-
     Docker Workshop for Golang Developers
---




# Download Golang ( latest version Golang 15.7 )

- [Windows](https://golang.org/dl/go1.15.7.windows-amd64.msi)
- [Apple Macos ](https://golang.org/dl/go1.15.7.darwin-amd64.pkg)
- [Linux](https://golang.org/dl/go1.15.7.linux-amd64.tar.gz)
- [github source](https://golang.org/dl/go1.15.7.src.tar.gz)


# Install Golang

Select the tab for your computer's operating system below, then follow its installation instructions.


{{< tabs name="Install Golang" >}}
{{% tab name="Linux" %}}
This is **some markdown.**

- 1. if you have a previous version of Go installed, be sure to [remove it]()https://golang.org/doc/manage-install before installing another.

Download the archive and extract it into `/usr/local`, creating a Go tree in `/usr/local/go`.
For example, run the following as root or through sudo:

```bash
tar -C /usr/local -xzf go1.15.7.linux-amd64.tar.gz

```
- 2. Add `/usr/local/go/bin` to the PATH environment variable.
You can do this by adding the following line to your $HOME/.profile or /etc/profile (for a system-wide installation):

```
export PATH=$PATH:/usr/local/go/bin

```
{{< note >}}
 Changes made to a profile file may not apply until the next time you log into your computer. To apply the changes immediately, just run the shell commands directly or execute them from the profile using a command such as source `$HOME/.profile`.
{{< /note >}}

- 3. Verify that you've installed Go by opening a command prompt and typing the following command:

```bash

$ go version

```
4. Confirm that the command prints the installed version of Go.

{{% /tab %}}

{{% tab name="Mac" %}}



1.Open the package file you downloaded and follow the prompts to install Go.

The package installs the Go distribution to /usr/local/go. The package should put the /usr/local/go/bin directory in your PATH environment variable. You may need to restart any open Terminal sessions for the change to take effect.

```bash

$ go version
```
3. Confirm that the command prints the installed version of Go.


{{% /tab %}}

{{% tab name="Windows" %}}



- 1. Open the MSI file you downloaded and follow the prompts to install Go.
     By default, the installer will install Go to C:\Go. You can change the location as needed. After installing, you will need to close and reopen any open command prompts so that changes to the environment made by the installer are reflected at the command prompt.
     
- 2. Verify that you've installed Go.

1.In Windows, click the Start menu. <br>
2.In the menu's search box, type cmd, then press the Enter key. <br>
3.In the Command Prompt window that appears, type the following command: <br>

```bash

$ go version

```
- 3. Confirm that the command prints the installed version of Go.

{{% /tab %}}

{{< /tabs >}}



# Dockerize your first Golang Application 


Create the main.go file with the following content:
{{< codenew file="/Golang/simple-app/main.go" >}}

Now that we have our server, let’s set about writing our Dockerfile and constructing the container in which our newly born Go application will live.

create dockerfile with following content:
{{< codenew file="/Golang/simple-app/Dockerfile" >}}


Now that we have defined everything we need for our Go application to run in our Dockerfile we can now build an image using this file. In order to do that, we’ll need to run the following command:

```
$ docker build -t my-go-app .
Sending build context to Docker daemon   5.12kB
Step 1/6 : FROM golang:1.12.0-alpine3.9
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
Step 5/6 : RUN go build -o main .
 ---> Running in 15805f4f7685
Removing intermediate container 15805f4f7685
 ---> 31828faf8ae4
Step 6/6 : CMD ["/app/main"]
 ---> Running in 9d54463b7e84
Removing intermediate container 9d54463b7e84
 ---> 3f9244a1a240
Successfully built 3f9244a1a240
Successfully tagged my-go-app:latest

```
We can now verify that our image exists on our machine by typing docker images:

```
$ docker images
REPOSITORY                                 TAG                 IMAGE ID            CREATED             SIZE
my-go-app                                  latest              3f9244a1a240        2 minutes ago       355MB$ docker images


```
In order to run this newly created image, we can use the docker run command and pass in the ports we want to map to and the image we wish to run.

```
$ docker run -p 8080:8081 -it my-go-app

```

- `-p 8080:8081` - This exposes our application which is running on port 8081 within our container on http://localhost:8080 on our local machine.
- `-it` - This flag specifies that we want to run this image in interactive mode with a tty for this container process.
- `my-go-app ` - This is the name of the image that we want to run in a container.


Awesome, if we open up http://localhost:8080 within our browser, we should see that our application is successfully responding with `Hello, "/".`

# Running our Container In the Background

You’ll notice that if we `ctrl-c` this within the terminal, it will kill the container. If we want to have it run permanently in the background, you can replace -it with `-d ` to run this container in detached mode.

In order to view the list of containers running in the background you can use docker ps which should output something like this:

```
$ docker ps
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                    NAMES
70fcc9195865        my-go-app           "/app/main"              5 seconds ago       Up 3 seconds        0.0.0.0:8080->8081/tcp   silly_swirles

```

# Working with Go Modules and Docker

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





