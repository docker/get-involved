---
title: "Getting Started with Dockerfile"
linkTitle: "Getting Started with Dockerfile"
weight: 110
description: >-
     Getting Started with Dockerfile
---



- [What is a Dockerfile?](#what-is-a-dockerfile)
- [Understanding Layering Concept with Dockerfile](#understanding-image-layering-concept-with-dockerfile)
- Creating Docker Image 
   - [Installing GIT](#lab-1-create-an-image-with-git-installed)
   - [ADD instruction](#lab-2-create-an-image-with-add-instruction)
   - [COPY instruction](#lab-3-create-an-image-with-copy-instruction)
   - [CMD instruction](#lab-4-create-an-image-with-cmd-instruction-ENTRYPOINT.md)
   - [WORKDIR instruction](#lab-6-create-an-image-with-workdir-instruction)
   - [RUN instruction](#lab-7-create-an-image-with-run-instruction)
   - [ARG instruction](#lab-8-create-an-image-with-arg-instruction)
   - [ENV instruction](#lab-9-create-an-image-with-env-instruction)
   - [VOLUME instruction](#lab-10-create-an-image-with-volume-instruction)
   - [EXPOSE instruction](#lab-11-create-an-image-with-expose-instruction)
   - [LABEL instruction](#lab-12-create-an-image-with-label-instruction)
   - [ONBUILD instruction](#lab-13-create-an-image-with-onbuild-instruction)
   - [HEALTHCHECK instruction](#lab-14-create-an-image-with-healthcheck-instruction)
   - [SHELL instruction](#lab-15-create-an-image-with-shell-instruction)
   - [USER instruction](#lab-16-create-an-image-with-user-instruction)
- [ENTRYPOINT vs RUN](#how-is-entrypoint-different-from-the-run-instruction)
- [Writing Dockerfile with Hello Python Script Added](#writing-dockerfile-with-hello-python-script-added)
- [Test Your Knowledge](#test-your-knowledge-quiz2)

## What is a Dockerfile?

- A Dockerfile is a text file which contains a series of commands or instructions. 
- These instructions are executed in the order in which they are written.
- Execution of these instructions takes place on a base image. 
- On building the Dockerfile, the successive actions form a new image from the base parent image.


## Understanding Image Layering Concept with Dockerfile

Docker container is a runnable instance of an image, which is actually made by writing a readable/writable layer on top of some read-only layers. 

The parent image used to create another image from a Dockerfile is read-only. When we execute instructions on this parent image, new layers keep adding up.
These layers are created when we run docker build command. 

The instructions RUN, COPY, ADD mostly contribute to the addition of layers in a Docker build. 

Each layer is read-only except the last one - this is added to the image for generating a runnable container. This last layer is called "container layer". All changes made to the container, like making new files, installing applications, etc. are done in this thin layer.

Let's understand this layering using an example:

Consider the Dockerfile given below:

```
FROM ubuntu:latest
RUN mkdir -p /hello/hello
COPY hello.txt /hello/hello
RUN chmod 600 /hello/hello/hello.txt

```


### Layer ID
Each instruction the Dockerfile generates a layer. Each of this layer has a randomly generated unique ID. This ID can be seen at the time of build. See the image below:

![Docker layers during Build](https://raw.githubusercontent.com/Prashansa-K/Docker/master/Writing%20Dockerfiles/layering2.png)

To view all these layers once an image is built from a Dockerfile, we can use docker history command.

![Docker history](https://raw.githubusercontent.com/Prashansa-K/Docker/master/Writing%20Dockerfiles/layering3.png)


To see more information about the Docker image and the layers use 'docker inspect' command as such:

```
# docker inspect testimage:latest

[
    {
        "Id": "sha256:c5701e02ed095ae7cabaef9fcef009d1f272206ff707deca13a680e024db7f02",
        "RepoTags": [
            "testimage:latest"
        ],
        "RepoDigests": [],
        "Parent": "sha256:694569c6db07ecef432cee1a9a4a6d45f2fd1f6be16814bf59e101bed966e612",
        "Comment": "",
        "Created": "2019-06-03T23:47:01.026463541Z",
        "Container": "ac8873a003cb9ed972b4675f8d27181b99112e7530a5803ff89780e3ecc18b1c",
        "ContainerConfig": {
            "Hostname": "",
            "Domainname": "",
            "User": "",
            "AttachStdin": false,
            "AttachStdout": false,
            "AttachStderr": false,
            "Tty": false,
            "OpenStdin": false,
            "StdinOnce": false,
            "Env": [
                "PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
            ],
            "Cmd": [
                "/bin/sh",
                "-c",
                "chmod 600 /home/hello/hello.txt"
            ],
            "ArgsEscaped": true,
            "Image": "sha256:694569c6db07ecef432cee1a9a4a6d45f2fd1f6be16814bf59e101bed966e612",
            "Volumes": null,
            "WorkingDir": "",
            "Entrypoint": null,
            "OnBuild": null,
            "Labels": null
        },
        "DockerVersion": "18.03.1-ce",
        "Author": "",
        "Config": {
            "Hostname": "",
            "Domainname": "",
            "User": "",
            "AttachStdin": false,
            "AttachStdout": false,
            "AttachStderr": false,
            "Tty": false,
            "OpenStdin": false,
            "StdinOnce": false,
            "Env": [
                "PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
            ],
            "Cmd": [
                "/bin/bash"
            ],
            "ArgsEscaped": true,
            "Image": "sha256:694569c6db07ecef432cee1a9a4a6d45f2fd1f6be16814bf59e101bed966e612",
            "Volumes": null,
            "WorkingDir": "",
            "Entrypoint": null,
            "OnBuild": null,
            "Labels": null
        },
        "Architecture": "amd64",
        "Os": "linux",
        "Size": 222876395,
        "VirtualSize": 222876395,
        "GraphDriver": {
            "Data": {
                "LowerDir": "/var/lib/docker/overlay2/86a76eac21ae67f6d78e59076107a121e6dfb9cc922e68e1be975fc97e711eb1/diff:/var/lib/docker/overlay2/0604b502d31eff670769257ba3411fca09fbe2eab03343660ba557024915a1e6/diff:/var/lib/docker/overlay2/16af32e079fbc252ea5de044628285d5c3a34fc8441602a762729482666b2431/diff:/var/lib/docker/overlay2/732c4ab0164f92664ce831b4a830251132bf17cbcb7d093334a7a367b1a665e5/diff:/var/lib/docker/overlay2/c8a69709e5093c6eefa317f015cbf1422a446b2fe5d3f3d52a7e0d8af8dc6a28/diff:/var/lib/docker/overlay2/c93b36ec3a753592518727a2ea4547ab4e53d58489b9fae0838b2806e9c18346/diff:/var/lib/docker/overlay2/e67589599c2a5ed3bd74a269f3effaa52f94975fd811a866f1fe2bbcb2edabe4/diff",
                "MergedDir": "/var/lib/docker/overlay2/31c68adcd824f155d23de4197b3d0b8776b079c307c1e4c0f2f8bbc73807adc0/merged",
                "UpperDir": "/var/lib/docker/overlay2/31c68adcd824f155d23de4197b3d0b8776b079c307c1e4c0f2f8bbc73807adc0/diff",
                "WorkDir": "/var/lib/docker/overlay2/31c68adcd824f155d23de4197b3d0b8776b079c307c1e4c0f2f8bbc73807adc0/work"
            },
            "Name": "overlay2"
        },
        "RootFS": {
            "Type": "layers",
            "Layers": [
                "sha256:05b0f7f2a81723fd647744a7340477ef9619f5ddeba3f2ca039dac3dd143cd59",
                "sha256:0c3819952093832ffd8865bf72bc17f2f5475795cffe97e2b4c4ff36e638c244",
                "sha256:14fa4a9494bf9e61f83a1bb96cd9e963ab0cbbdaf8ed91ff5eec5196c5bf7b12",
                "sha256:b33859b66bfd3ad176ccf3be8dbd52d6b9823de8cc26688f2efeb76a0ea24a78",
                "sha256:4622c8e1bdc0716e185fa3b338fa415dfdad3724336315de0bebd173a6ceaf05",
                "sha256:6427efc3a0d7bae1fe315b844703580b2095073dcdf54a6ed9c7b1c0d982d9b0",
                "sha256:59cd898074ac7765bacd76a11724b8d666ed8e9c14e7806dfb20a486102f6f1e",
                "sha256:ad24f18512fddb8794612f7ec5955d06dcee93641d02932d809f0640263b8e79"
            ]
        },
        "Metadata": {
            "LastTagTime": "2019-06-04T05:17:01.430558997+05:30"
        }
    }
]

```

### Visualizing layers of Docker Image

```
docker run --rm -it -v /var/run/docker.sock:/var/run/docker.sock  wagoodman/dive testimage
```

```
[● Layers]───────────────────────────────────────────────────────────────────────────── [Current Layer Contents]───────────────────────────────────────────────────────────────
Cmp   Size  Command                                                                     Permission     UID:GID       Size  Filetree
     63 MB  FROM e388568efdf7281                                                        drwxr-xr-x         0:0     4.8 MB  ├── bin
    988 kB  [ -z "$(apt-get indextargets)" ]                                            -rwxr-xr-x         0:0     1.1 MB  │   ├── bash
     745 B  set -xe   && echo '#!/bin/sh' > /usr/sbin/policy-rc.d  && echo 'exit 101' > -rwxr-xr-x         0:0      35 kB  │   ├── bunzip2
       7 B  mkdir -p /run/systemd && echo 'docker' > /run/systemd/container             -rwxr-xr-x         0:0        0 B  │   ├── bzcat → bin/bunzip2
       0 B  mkdir -p /hello/hello                                                       -rwxrwxrwx         0:0        0 B  │   ├── bzcmp → bzdiff
      37 B  #(nop) COPY file:666735678ded52c6f9e0693ca27b4dc3d466e3d79c585a58c3b9a91357 -rwxr-xr-x         0:0     2.1 kB  │   ├── bzdiff
      37 B  chmod 600 /hello/hello/hello.txt                                            -rwxrwxrwx         0:0        0 B  │   ├── bzegrep → bzgrep
                                                                                        -rwxr-xr-x         0:0     4.9 kB  │   ├── bzexe
[Layer Details]──────────────────────────────────────────────────────────────────────── -rwxrwxrwx         0:0        0 B  │   ├── bzfgrep → bzgrep
                                                                                        -rwxr-xr-x         0:0     3.6 kB  │   ├── bzgrep
Tags:   (unavailable)                                                                   -rwxr-xr-x         0:0        0 B  │   ├── bzip2 → bin/bunzip2
Id:     e388568efdf72814bd6439a80d822ce06b631689a82292a2b96382d020d63a4c                -rwxr-xr-x         0:0      14 kB  │   ├── bzip2recover
Digest: sha256:43c67172d1d182ca5460fc962f8f053f33028e0a3a1d423e05d91b532429e73d         -rwxrwxrwx         0:0        0 B  │   ├── bzless → bzmore
Command:                                                                                -rwxr-xr-x         0:0     1.3 kB  │   ├── bzmore
#(nop) ADD file:08e718ed0796013f5957a1be7da3bef6225f3d82d8be0a86a7114e5caad50cbc in /   -rwxr-xr-x         0:0      35 kB  │   ├── cat
                                                                                        -rwxr-xr-x         0:0      64 kB  │   ├── chgrp
[Image Details]──────────────────────────────────────────────────────────────────────── -rwxr-xr-x         0:0      60 kB  │   ├── chmod
                                                                                        -rwxr-xr-x         0:0      68 kB  │   ├── chown
Total Image size: 64 MB                                                                 -rwxr-xr-x         0:0     142 kB  │   ├── cp
Potential wasted space: 308 B                                                           -rwxr-xr-x         0:0     121 kB  │   ├── dash
Image efficiency score: 99 %                                                            -rwxr-xr-x         0:0     101 kB  │   ├── date
                                                                                        -rwxr-xr-x         0:0      76 kB  │   ├── dd
Count   Total Space  Path                                                               -rwxr-xr-x         0:0      85 kB  │   ├── df
    2         234 B  /var/lib/dpkg/diversions                                           -rwxr-xr-x         0:0     134 kB  │   ├── dir
    2          74 B  /hello/hello/hello.txt                                             -rwxr-xr-x         0:0      72 kB  │   ├── dmesg
                                                                                        -rwxrwxrwx         0:0        0 B  │   ├── dnsdomainname → hostname
                                                                                        -rwxrwxrwx         0:0        0 B  │   ├── domainname → hostname
                                                                                        -rwxr-xr-x         0:0      35 kB  │   ├── echo
                                                                                        -rwxr-xr-x         0:0       28 B  │   ├── egrep
                                                                                        -rwxr-xr-x         0:0      31 kB  │   ├── false
                                                                                        -rwxr-xr-x         0:0       28 B  │   ├── fgrep
                                                                                        -rwxr-xr-x         0:0      65 kB  │   ├── findmnt
                                                                                        -rwxr-xr-x         0:0     220 kB  │   ├── grep
                                                                                        -rwxr-xr-x         0:0     2.3 kB  │   ├── gunzip
                                                                                        -rwxr-xr-x         0:0     5.9 kB  │   ├── gzexe
                                                                                        -rwxr-xr-x         0:0     102 kB  │   ├── gzip
 ```

## Lab #1: Create an image with GIT installed

### Pre-requisite:

### Tested Infrastructure

<table class="tg">
  <tr>
    <th class="tg-yw4l"><b>Platform</b></th>
    <th class="tg-yw4l"><b>Number of Instance</b></th>
    <th class="tg-yw4l"><b>Reading Time</b></th>
    
  </tr>
  <tr>
    <td class="tg-yw4l"><b> Play with Docker</b></td>
    <td class="tg-yw4l"><b>1</b></td>
    <td class="tg-yw4l"><b>5 min</b></td>
    
  </tr>
  
</table>

### Pre-requisite

- Create an account with [DockerHub](https://hub.docker.com)
- Open [PWD](https://labs.play-with-docker.com/) Platform on your browser 
- Click on **Add New Instance** on the left side of the screen to bring up Alpine OS instance on the right side


### Assignment:

- Create an image with GIT installed
- Tag your image as labs-git:v1.0
- Create a container based on that image, and run git --version to check that it is installed correctly

### Creating Dockerfile

```
FROM alpine:3.5
RUN apk update
RUN apk add git
```

### Build Docker Image

```
docker build -t ajeetraina/alpine-git .
```

### Tagging image as labs-git

```
docker tag ajeetraina/alpine-git ajeetraina/labs-git:v1.0
```

### Verify the Images


```
$ docker images
REPOSITORY              TAG                 IMAGE ID            CREATED             SIZE
ajeetraina/alpine-git   latest              cb913e37a593        16 seconds ago      26.6MB
ajeetraina/labs-git     v1.0                cb913e37a593        16 seconds ago      26.6MB
```


###  Create a container

```
docker run -itd ajeetraina/labs-git:v1.0 /bin/sh
```

```
$ docker ps
CONTAINER ID        IMAGE                      COMMAND             CREATED             STATUS              PORTS               NAMES
3e26a5268f55        ajeetraina/labs-git:v1.0   "/bin/sh"           4 seconds ago       Up 2 seconds                            elated_neumann
```

### Enter into Container Shell

```
docker attach 3e26
```

Please press "Enter" key twice so as to enter into container shell


### Verify if GIT is installed 

```
/ # git --version
git version 2.13.7
```

## Lab #2: Create an image with ADD instruction

COPY and ADD are both Dockerfile instructions that serve similar purposes. They let you copy files from a specific location into a Docker image.

COPY takes in a src and destination. It only lets you copy in a local file or directory from your host (the machine building the Docker image) into the Docker image itself.

ADD lets you do that too, but it also supports 2 other sources. First, you can use a URL instead of a local file / directory. Secondly, you can extract a tar file from the source directly into the destination.

### Pre-requisite:

### Tested Infrastructure

<table class="tg">
  <tr>
    <th class="tg-yw4l"><b>Platform</b></th>
    <th class="tg-yw4l"><b>Number of Instance</b></th>
    <th class="tg-yw4l"><b>Reading Time</b></th>
    
  </tr>
  <tr>
    <td class="tg-yw4l"><b> Play with Docker</b></td>
    <td class="tg-yw4l"><b>1</b></td>
    <td class="tg-yw4l"><b>5 min</b></td>
    
  </tr>
  
</table>

### Pre-requisite

- Create an account with [DockerHub](https://hub.docker.com)
- Open [PWD](https://labs.play-with-docker.com/) Platform on your browser 
- Click on **Add New Instance** on the left side of the screen to bring up Alpine OS instance on the right side


### Assignment:

- Create an image with ADD instruction
- Tag your image as labs-add:v1.0
- Create a container based on that image, and see the extracted tar file.

### Creating Dockerfile

```
FROM alpine:3.5
RUN apk update
ADD http://www.vlsitechnology.org/pharosc_8.4.tar.gz .
```

### Build Docker Image

```
docker build -t saiyam911/alpine-add . -f <name of dockerfile>
```

### Tagging image as labs-git

```
docker tag saiyam911/alpine-add saiyam911/labs-add:v1.0
```

### Verify the Images


```
$ docker images
REPOSITORY                   TAG                 IMAGE ID            CREATED             SIZE
saiyam911/alpine-add        latest              cdf97cb49d48        38 minutes ago       300MB
saiyam911/labs-add          v1.0                cdf97cb49d48        38 minutes ago       300MB
```


###  Create a container

```
docker run -itd saiyam911/labs-add:v1.0 /bin/sh
```

```
$ docker ps
CONTAINER ID        IMAGE                      COMMAND             CREATED             STATUS              PORTS               NAMES
f0940750f61a        saiyam911/labs-add:v1.0   "/bin/sh"           20 seconds ago      Up 18 seconds                           distracted_darwin
```

### Enter into Container Shell

```
docker attach f094
```

Please press "Enter" key twice so as to enter into container shell


### Verify if the link has been extracted onto the container

```
/ # ls -ltr
-rw-------    1 root     root     295168000 Sep 19  2007 pharosc_8.4.tar.gz
```

ADD Command lets you to add a tar directly from a link and explode to the container.

## Lab #3: Create an image with COPY instruction

The COPY instruction copies files or directories from source and adds them to the filesystem of the container at destinatio.

Two form of COPY instruction
```
COPY [--chown=<user>:<group>] <src>... <dest>
COPY [--chown=<user>:<group>] ["<src>",... "<dest>"] (this form is required for paths containing whitespace)
```


### Tested Infrastructure

<table class="tg">
  <tr>
    <th class="tg-yw4l"><b>Platform</b></th>
    <th class="tg-yw4l"><b>Number of Instance</b></th>
    <th class="tg-yw4l"><b>Reading Time</b></th>
    
  </tr>
  <tr>
    <td class="tg-yw4l"><b> Play with Docker</b></td>
    <td class="tg-yw4l"><b>1</b></td>
    <td class="tg-yw4l"><b>5 min</b></td>
    
  </tr>
  
</table>

### Pre-requisite

- Create an account with [DockerHub](https://hub.docker.com)
- Open [PWD](https://labs.play-with-docker.com/) Platform on your browser 
- Click on **Add New Instance** on the left side of the screen to bring up Alpine OS instance on the right side

### Assignment:

- Create an image with COPY instruction
- COPY instruction in Multi-stage Builds

### Create an image with COPY instruction
Dockerfile
```
FROM nginx:alpine
LABEL maintainer="Collabnix"

COPY index.html /usr/share/nginx/html/
ENTRYPOINT ["nginx", "-g", "daemon off;"]
```
Lets create the <b>index.html</b> file
```
$ echo "Welcome to Dockerlabs !" > index.html
```
#### Building Docker Image
```
$ docker image build -t cpy:v1 .
```
#### Staring the container
```
$ docker container run -d --rm --name myapp1 -p 80:80 cpy:v1
```
#### Checking index file
```
$ curl localhost
Welcome to Dockerlabs !
```

### COPY instruction in Multi-stage Builds
Dockerfile
```
FROM alpine AS stage1
LABEL maintainer="Collabnix"
RUN echo "Welcome to Docker Labs!" > /opt/index.html

FROM nginx:alpine
LABEL maintainer="Collabnix"
COPY --from=stage1 /opt/index.html /usr/share/nginx/html/
ENTRYPOINT ["nginx", "-g", "daemon off;"]
```
#### Building Docker Image
```
$ docker image build -t cpy:v2 .
```
#### Staring the container
```
$ docker container run -d --rm --name myapp2 -p 8080:80 cpy:v2
```
#### Checking index file
```
$ curl localhost:8080
Welcome to Docker Labs !
```

<b>NOTE:</b> You can name your stages, by adding an AS <NAME> to the FROM instruction.By default, the stages are not named, and you can refer to them by their integer number, starting with 0 for the first FROM instruction.You are not limited to copying from stages you created earlier in your Dockerfile, you can use the COPY --from instruction to copy from a separate image, either using the local image name, a tag available locally or on a Docker registry.

```
COPY --from=nginx:latest /etc/nginx/nginx.conf /nginx.conf
```


## Lab #4: Create an image with CMD instruction


### Tested Infrastructure

<table class="tg">
  <tr>
    <th class="tg-yw4l"><b>Platform</b></th>
    <th class="tg-yw4l"><b>Number of Instance</b></th>
    <th class="tg-yw4l"><b>Reading Time</b></th>
  </tr>
  <tr>
    <td class="tg-yw4l"><b> Play with Docker</b></td>
    <td class="tg-yw4l"><b>1</b></td>
    <td class="tg-yw4l"><b>5 min</b></td>
  </tr>
</table>

### Pre-requisite

- Create an account with [DockerHub](https://hub.docker.com)
- Open [PWD](https://labs.play-with-docker.com/) Platform on your browser 
- Click on **Add New Instance** on the left side of the screen to bring up Alpine OS instance on the right side

### Creating Dockerfile

```
FROM alpine:3.6

RUN apk update
CMD ["top"]
```

### Building Docker Container

```
docker build -t ajeetraina/lab3_cmd . -f Dockerfile_cmd
```

### Running the Docker container

```
docker run ajeetraina/lab3_cmd:latest
```

## Lab #5: Create an image with ENTRYPOINT instruction

The `ENTRYPOINT` instruction make your container run as an executable. <br>
ENTRYPOINT can be configured in two forms:
 - <b> Exec Form </b><br>
		    ENTRYPOINT ["executable", "param1", "param2"]  <br>
 - <b>Shell Form</b><br>
		  ENTRYPOINT command param1 param2 <br>
      
If an image has an ENTRYPOINT if you pass an argument it, while running container it wont override the existing entrypoint, it will append what you passed with the entrypoint.To override the existing ENTRYPOINT you should user <b>--entrypoint</b> flag when running container.


## Tested Infrastructure

<table class="tg">
  <tr>
    <th class="tg-yw4l"><b>Platform</b></th>
    <th class="tg-yw4l"><b>Number of Instance</b></th>
    <th class="tg-yw4l"><b>Reading Time</b></th>
    
  </tr>
  <tr>
    <td class="tg-yw4l"><b> Play with Docker</b></td>
    <td class="tg-yw4l"><b>1</b></td>
    <td class="tg-yw4l"><b>5 min</b></td>
    
  </tr>
  
</table>

### Pre-requisite

- Create an account with [DockerHub](https://hub.docker.com)
- Open [PWD](https://labs.play-with-docker.com/) Platform on your browser 
- Click on **Add New Instance** on the left side of the screen to bring up Alpine OS instance on the right side


### Assignment:
- Create an image with ENTRYPOINT instruction(Exec Form)
- ENTRYPOINT instruction in Shell Form
- Override the existing ENTRYPOINT
 
### Create an image with ENTRYPOINT instruction(Exec Form)
Dockerfile
```
FROM alpine:3.5
LABEL maintainer="Collabnix"

ENTRYPOINT ["/bin/echo", "Hi, your ENTRYPOINT instruction in Exec Form !"]
```
#### Build Docker Image
```
$ docker build -t entrypoint:v1 .
```
#### Verify the Image
```
$ docker image ls

REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
entrypoint          v1                  1d06f06c2062        2 minutes ago       4MB
alpine              3.5                 f80194ae2e0c        7 months ago        4MB
```
#### Create a container
```
$ docker container run entrypoint:v1
Hi, your ENTRYPOINT instruction in Exec Form !
```
### ENTRYPOINT instruction in Shell Form
Dockerfile
```
$ cat Dockerfile 
FROM alpine:3.5
LABEL maintainer="Collabnix"

ENTRYPOINT echo "Hi, your ENTRYPOINT instruction in Shell Form !"
```
#### Build Docker Image
```
$ docker build -t entrypoint:v2 .
```
#### Verify the Image
```
$ docker image ls

REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
entrypoint          v2                  cde521f13080        2 minutes ago       4MB
entrypoint          v1                  1d06f06c2062        5 minutes ago      4MB
alpine              3.5                 f80194ae2e0c        7 months ago        4MB
```
#### Create a container
```
$ docker container run entrypoint:v2
Hi, your ENTRYPOINT instruction in Shell Form !
```

### Override the existing ENTRYPOINT
```
$ docker container run --entrypoint "/bin/echo" entrypoint:v2 "Hello, Welocme to Docker Meetup! "
Hello, Welocme to Docker Meetup! 
```

## Lab #6: Create an image with WORKDIR instruction

The `WORKDIR` directive in `Dockerfile` defines the working directory for the rest of the instructions in the Dockerfile. The WORKDIR instruction wont create a new layer in the image but will add metadata to the image config. If the WORKDIR doesn’t exist, it will be created even if it’s not used in any subsequent Dockerfile instruction. you can have multiple WORKDIR in same Dockerfile. If a relative path is provided, it will be relative to the previous WORKDIR instruction.

```
WORKDIR /path/to/workdir
```

If no WORKDIR is specified in the Dockerfile then the default path is `/`. The WORKDIR instruction can resolve environment variables previously set in Dockerfile using ENV.


### Tested Infrastructure

<table class="tg">
  <tr>
    <th class="tg-yw4l"><b>Platform</b></th>
    <th class="tg-yw4l"><b>Number of Instance</b></th>
    <th class="tg-yw4l"><b>Reading Time</b></th>
  </tr>
  <tr>
    <td class="tg-yw4l"><b> Play with Docker</b></td>
    <td class="tg-yw4l"><b>1</b></td>
    <td class="tg-yw4l"><b>5 min</b></td>
  </tr>
  
</table>

### Pre-requisite

- Create an account with [DockerHub](https://hub.docker.com)
- Open [PWD](https://labs.play-with-docker.com/) Platform on your browser 
- Click on **Add New Instance** on the left side of the screen to bring up Alpine OS instance on the right side

### Assignment
- Dockerfile with WORKDIR instruction
- WORKDIR with Relative path
- WORKDIR with Absolute path
- WORKDIR with environment variables as path 

#### Dockerfile with WORKDIR instruction
Dockerfile
```
FROM alpine:3.9.3
LABEL maintainer="Collabnix"

WORKDIR /opt
```
#### Building Docker image
```
$ docker build -t workdir:v1 .
```
#### Testing current WORKDIR by running container
```
$ docker run -it workdir:v1 pwd
```

### WORKDIR with relative path
Dockerfile
```
FROM alpine:3.9.3
LABEL maintainer="Collabnix"

WORKDIR /opt
RUN echo "Welcome to Docker Labs" > opt.txt
WORKDIR folder1
RUN echo "Welcome to Docker Labs" > folder1.txt
WORKDIR folder2
RUN echo "Welcome to Docker Labs" > folder2.txt
```
#### Building Docker image
```
$ docker build -t workdir:v2 .
```
#### Testing current WORKDIR by running container
```
$ docker run -it workdir:v2 pwd
```

### WORKDIR with Absolute path
Dockerfile
```
FROM alpine:3.9.3
LABEL maintainer="Collabnix"

WORKDIR /opt/folder1
RUN echo "Welcome to Docker Labs" > opt.txt
WORKDIR /var/tmp/
```
#### Building Docker image
```
$ docker build -t workdir:v3 .
```
#### Testing current WORKDIR by running container
```
$ docker run -it workdir:v3 pwd
```

### WORKDIR with environment variables as path
Dockerfile
```
FROM alpine:3.9.3
LABEL maintainer="Collabnix"

ENV DIRPATH /myfolder
WORKDIR $DIRPATH
```
#### Building Docker image
```
$ docker build -t workdir:v4 .
```
#### Testing current WORKDIR by running container
```
$ docker run -it workdir:v4 pwd
```

## Lab #7: Create an image with RUN instruction

The `RUN` instruction execute command on top of the below layer and create a new layer. <br>
RUN instruction can be wrote in two forms:
- RUN <command> (shell form)
- RUN ["executable", "param1", "param2"] (exec form)



### Tested Infrastructure

<table class="tg">
  <tr>
    <th class="tg-yw4l"><b>Platform</b></th>
    <th class="tg-yw4l"><b>Number of Instance</b></th>
    <th class="tg-yw4l"><b>Reading Time</b></th>
    
  </tr>
  <tr>
    <td class="tg-yw4l"><b> Play with Docker</b></td>
    <td class="tg-yw4l"><b>1</b></td>
    <td class="tg-yw4l"><b>5 min</b></td>
    
  </tr>
  
</table>

### Pre-requisite

- Create an account with [DockerHub](https://hub.docker.com)
- Open [PWD](https://labs.play-with-docker.com/) Platform on your browser 
- Click on **Add New Instance** on the left side of the screen to bring up Alpine OS instance on the right side

### Assignment:

- Create an image with RUN instruction
- Combining multiple RUN instruction to one

### Create an image with RUN instruction
```
FROM alpine:3.9.3
LABEL maintainer="Collabnix"
RUN apk add --update 
RUN apk add curl
RUN rm -rf /var/cache/apk/
```
#### Building Docker image
```
$ docker image build -t run:v1 .
```
#### Checking layer of the image
```
$  docker image history run:v1 
IMAGE               CREATED             CREATED BY                                      SIZE                
NT
5b09d7ba1736        19 seconds ago      /bin/sh -c rm -rf /var/cache/apk/               0B                  
192115cc597a        21 seconds ago      /bin/sh -c apk add curl                         1.55MB              
0518580850f1        43 seconds ago      /bin/sh -c apk add --update                     1.33MB              
8590497d994e        45 seconds ago      /bin/sh -c #(nop)  LABEL maintainer=Collabnix   0B                  
cdf98d1859c1        4 months ago        /bin/sh -c #(nop)  CMD ["/bin/sh"]              0B                  
<missing>           4 months ago        /bin/sh -c #(nop) ADD file:2e3a37883f56a4a27…   5.53MB 
```
Number of layers 6

#### Checking image size
```
$ docker image ls run:v1
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
run                 v1                  5b09d7ba1736        4 minutes ago       8.42MB
```
Its 8.42MB

### Combining multiple RUN instruction to one
```
FROM alpine:3.9.3
LABEL maintainer="Collabnix"
RUN apk add --update && \
	apk add curl  && \  
	rm -rf /var/cache/apk/
```
#### Building Docker image
```
$ docker image build -t run:v2 .
```
#### Checking layer of the image
```
$ docker image history run:v2
IMAGE               CREATED             CREATED BY                                      SIZE            
NT
784298155541        50 seconds ago      /bin/sh -c apk add --update  && apk add curl…   1.55MB              
8590497d994e        8 minutes ago       /bin/sh -c #(nop)  LABEL maintainer=Collabnix   0B                  
cdf98d1859c1        4 months ago        /bin/sh -c #(nop)  CMD ["/bin/sh"]              0B                  
<missing>           4 months ago        /bin/sh -c #(nop) ADD file:2e3a37883f56a4a27…   5.53MB
```
Number of layers 4
#### Checking image size
```
$ docker image ls run:v2
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
run                 v2                  784298155541        3 minutes ago       7.08MB
```
its now 7.08MB 


## Lab #8: Create an image with ARG instruction


The `ARG` directive in `Dockerfile` defines the parameter name and defines its default value. This default value can be overridden by the `--build-arg <parameter name>=<value>` in the build command `docker build`.

```
`ARG <parameter name>[=<default>]`
```

The build parameters have the same effect as `ENV`, which is to set the environment variables. The difference is that the environment variables of the build environment set by `ARG` will not exist in the future when the container is running. But don't use `ARG` to save passwords and the like, because `docker history` can still see all the values.


### Tested Infrastructure

<table class="tg">
  <tr>
    <th class="tg-yw4l"><b>Platform</b></th>
    <th class="tg-yw4l"><b>Number of Instance</b></th>
    <th class="tg-yw4l"><b>Reading Time</b></th>
    
  </tr>
  <tr>
    <td class="tg-yw4l"><b> Play with Docker</b></td>
    <td class="tg-yw4l"><b>1</b></td>
    <td class="tg-yw4l"><b>5 min</b></td>
    
  </tr>
  
</table>

### Pre-requisite

- Create an account with [DockerHub](https://hub.docker.com)
- Open [PWD](https://labs.play-with-docker.com/) Platform on your browser 
- Click on **Add New Instance** on the left side of the screen to bring up Alpine OS instance on the right side

### Assignment
- Writing a Dockerfile with ARG instruction
- Building Docker Image with default argument
- Running container argv:v1
- Passing the argument during image build time
- Running container argv:v2

### Writing a Dockerfile with ARG instruction
We are writing a Dockerfile which echo "Welcome $WELCOME_USER, to Docker World!" where default argument value for <b>WELCOME_USER</b> as <b>Collabnix</b>.
```
FROM alpine:3.9.3
LABEL maintainer="Collabnix"

#Setting a default value to Argument WELCOME_USER
ARG WELCOME_USER=Collabnix
RUN echo "Welcome $WELCOME_USER, to Docker World!" > message.txt
CMD cat message.txt
```
### Building Docker Image with default argument
```
$ docker image build -t arg:v1 .
```
### Running container argv:v1
```
$ docker run arg:v1

Welcome Collabnix, to Docker World!
```

### Passing the argument(WELCOME_USER) during image build time using <b>--build-arg</b> flag 
```
$ docker image build -t arg:v2 --build-arg WELCOME_USER=Savio .
```
### Running container argv:v2
```
$ docker run arg:v2

Welcome Savio, to Docker World!
```
<b>NOTE:</b> ARG is the only one instruction which can come before FROM instruction, but then arg value can be used only by FROM.


## Lab #9: Create an image with ENV instruction

The `ENV` instruction in Dockerfile sets the environment variable for your container when you start. The default value can be overridden by passing `--env <key>=<value>` when you start the container.


### Tested Infrastructure

<table class="tg">
  <tr>
    <th class="tg-yw4l"><b>Platform</b></th>
    <th class="tg-yw4l"><b>Number of Instance</b></th>
    <th class="tg-yw4l"><b>Reading Time</b></th>
  </tr>
  <tr>
    <td class="tg-yw4l"><b> Play with Docker</b></td>
    <td class="tg-yw4l"><b>1</b></td>
    <td class="tg-yw4l"><b>5 min</b></td>
  </tr>
</table>

### Pre-requisite

- Create an account with [DockerHub](https://hub.docker.com)
- Open [PWD](https://labs.play-with-docker.com/) Platform on your browser 
- Click on **Add New Instance** on the left side of the screen to bring up Alpine OS instance on the right side

### Assignment
- Writing a Dockerfile with ENV instruction
- Building Docker Image
- Running container env:v1
- Override existing env while running container

### Writing a Dockerfile with ENV instruction
Dockerfile
```
FROM alpine:3.9.3
LABEL maintainer="Collabnix"

ENV WELCOME_MESSAGE="Welcome to Docker World"

CMD ["sh", "-c", "echo $WELCOME_MESSAGE"]
```

#### Building Docker Image
```
$ docker build -t env:v1 .
```

### Running container env:v1
```
$ docker container run env:v1
Welcome to Docker World
```

### Override existing env while running container
```
$ docker container run --env WELCOME_MESSAGE="Welcome to Docker Workshop" env:v1 
Welcome to Docker Workshop
```

## Lab #10: Create an image with VOLUME instruction

### Pre-requisite:

### Tested Infrastructure

<table class="tg">
  <tr>
    <th class="tg-yw4l"><b>Platform</b></th>
    <th class="tg-yw4l"><b>Number of Instance</b></th>
    <th class="tg-yw4l"><b>Reading Time</b></th>    
  </tr>
  <tr>
    <td class="tg-yw4l"><b> Play with Docker</b></td>
    <td class="tg-yw4l"><b>1</b></td>
    <td class="tg-yw4l"><b>5 min</b></td>    
  </tr>
  
</table>

### Pre-requisite

- Create an account with [DockerHub](https://hub.docker.com)
- Open [PWD](https://labs.play-with-docker.com/) Platform on your browser 
- Click on **Add New Instance** on the left side of the screen to bring up Alpine OS instance on the right side

## Assignment
- Create an image with VOLUME instruction
- Finding the volume created on the host
- Testing mount working as exepected

### Create an image with VOLUME instruction
Dockerfile
```
FROM nginx:alpine
LABEL maintainer="Collabnix"

VOLUME /myvol
CMD [ "nginx","-g","daemon off;" ]
```
#### Building Docker image
```
$ docker build -t volume:v1 .
```
#### Create a container based on volume:v1 image
```
$ docker container run --rm -d --name volume-test volume:v1
```
### Finding the volume created on the host

#### Checking the volume name of the container
```
$ docker container inspect -f '{{ (index .Mounts 0).Name }}' volume-test
ed09456a448934218f03acbdaa31f465ebbb92e0d45e8284527a2c538cc6b016
```
#### Listout Volume in the host
```
$ docker volume ls
DRIVER              VOLUME NAME
local               ed09456a448934218f03acbdaa31f465ebbb92e0d45e8284527a2c538cc6b016
```
You will see the volume has been created.

#### Volume mount path in host
```
$ docker container inspect -f '{{ (index .Mounts 0).Source }}' volume-test
/var/lib/docker/volumes/ed09456a448934218f03acbdaa31f465ebbb92e0d45e8284527a2c538cc6b016/_data
```

### Testing mount working as exepected
#### Create a file in this folder
```
$ touch /var/lib/docker/volumes/ed09456a448934218f03acbdaa31f465ebbb92e0d45e8284527a2c538cc6b016/_data/mytestfile.txt
```
#### Checking file is there in run container
```
$ docker container exec -it volume-test ls myvol
```


## Lab #11: Create an image with EXPOSE instruction

The `EXPOSE` instruction expose a port, the protocol can be UDP or TCP associated with the indicated port, default is TCP with no specification. The EXPOSE won't be able to map the ports on the host machine. Regardless of the EXPOSE settings, EXPOSE port can be override using <b>-p</b> flag while starting the container.

### Pre-requisite:

### Tested Infrastructure

<table class="tg">
  <tr>
    <th class="tg-yw4l"><b>Platform</b></th>
    <th class="tg-yw4l"><b>Number of Instance</b></th>
    <th class="tg-yw4l"><b>Reading Time</b></th>    
  </tr>
  <tr>
    <td class="tg-yw4l"><b> Play with Docker</b></td>
    <td class="tg-yw4l"><b>1</b></td>
    <td class="tg-yw4l"><b>5 min</b></td>    
  </tr>
  
</table>

### Pre-requisite

- Create an account with [DockerHub](https://hub.docker.com)
- Open [PWD](https://labs.play-with-docker.com/) Platform on your browser 
- Click on **Add New Instance** on the left side of the screen to bring up Alpine OS instance on the right side

### Assignment
- Create an image with EXPOSE instruction
- Inspecting the EXPOSE port in the image
- Publish all exposed port

### Create an image with VOLUME instruction
Dockerfile
```
FROM nginx:alpine
LABEL maintainer="Collabnix"

EXPOSE 80/tcp
EXPOSE 80/udp

CMD [ "nginx","-g","daemon off;" ]
```
#### Building Docker image
```
$ docker build -t expose:v1 .
```
#### Create a container based on expose:v1 image
```
$  docker container run --rm -d --name expose-inst expose:v1
```

### Inspecting the EXPOSE port in the image
```
$ docker image inspect --format={{.ContainerConfig.ExposedPorts}} expose:v1
```

### Publish all exposed ports
We can publish all EXPOSE port using <b>-P</b> flag. 
```
$ docker container run --rm -P -d --name expose-inst-Publish expose:v1
```
#### Checking the publish port
```
$  docker container ls
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                                          NAMES
24983e09bd86        expose:v1           "nginx -g 'daemon of…"   46 seconds ago      Up 45 seconds       0.0.0.0:32768->80/tcp, 0.0.0.0:32768->80/udp   expose-inst-Publish
```


## Lab #12: Create an image with LABEL Instruction

You can add labels to your image to help organize images by project, record licensing information, to aid in automation, or for other reasons.
For each label, add a line beginning with LABEL and with one or more key-value pairs.
The following examples show the different acceptable formats.

Docker offers support to add labels into images as a way to add custom metadata on them.
The label syntax on your Dockerfile is as follows:

```
LABEL <key>=<value> <key>=<value> <key>=<value> ...
```

The LABEL instruction adds metadata to an image.
A LABEL is a key-value pair.
To include spaces within a LABEL value, use quotes and backslashes as you would in command-line parsing.
A few usage examples:

```
LABEL "com.example.vendor"="ACME Incorporated"
LABEL com.example.label-with-value="foo"
LABEL version="1.0"
LABEL description="This text illustrates \
that label-values can span multiple lines."
```

An image can have more than one label.
You can specify multiple labels on a single line.
Prior to Docker 1.10, this decreased the size of the final image, but this is no longer the case.
You may still choose to specify multiple labels in a single instruction, in one of the following two ways:

```
LABEL multi.label1="value1" multi.label2="value2" other="value3"
``` 

```
LABEL multi.label1="value1" \
      multi.label2="value2" \
      other="value3"
```

Labels included in base or parent images (images in the FROM line) are inherited by your image.
If a label already exists but with a different value, the most-recently-applied value overrides any previously-set value.

To view an image’s labels, use the `docker inspect` command.

```
"Labels": {
    "com.example.vendor": "ACME Incorporated"
    "com.example.label-with-value": "foo",
    "version": "1.0",
    "description": "This text illustrates that label-values can span multiple lines.",
    "multi.label1": "value1",
    "multi.label2": "value2",
    "other": "value3"
},
```

## Lab #13: Create an image with ONBUILD instruction

Format: `ONBUILD <other instructions>`.

`ONBUILD` is a special instruction, followed by other instructions, such as `RUN`, `COPY`, etc., and these instructions will not be executed when the current image is built. Only when the current image is mirrored, the next level of mirroring will be executed.

The other instructions in `Dockerfile` are prepared to customize the current image. Only `ONBUILD` is prepared to help others customize themselves.

Suppose we want to make an image of the application written by Node.js. We all know that Node.js uses `npm` for package management, and all dependencies, configuration, startup information, etc. are placed in the `package.json` file. After getting the program code, you need to do `npm install` first to get all the required dependencies. Then you can start the app with `npm start`. Therefore, in general, `Dockerfile` will be written like this:

```Dockerfile
FROM node:slim
RUN mkdir /app
WORKDIR /app
COPY ./package.json /app
RUN [ "npm", "install" ]
COPY . /app/
CMD [ "npm", "start" ]
```

Put this `Dockerfile` in the root directory of the Node.js project, and after building the image, you can use it to start the container. But what if we have a second Node.js project? Ok, then copy this `Dockerfile` to the second project. If there is a third project? Copy it again? The more copies of a file, the more difficult it is to have version control, so let's continue to look at the maintenance of such scenarios.

If the first Node.js project is in development, I find that there is a problem in this `Dockerfile`, such as typing a typo, or installing an extra package, then the developer fixes the `Dockerfile`, builds it again, and solves the problem. The first project is ok, but the second one? Although the original `Dockerfile` was copied and pasted from the first project, it will not fix their `Dockerfile` because the first project, and the `Dockerfile` of the second project will be automatically fixed.

So can we make a base image, and then use the base image for each project? In this way, the basic image is updated, and each project does not need to synchronize the changes of `Dockerfile`. After rebuilding, it inherits the update of the base image. Ok, yes, let's see the result. Then the above `Dockerfile` will become:

```Dockerfile
FROM node:slim
RUN mkdir /app
WORKDIR /app
CMD [ "npm", "start" ]
```

Here we take out the project-related build instructions and put them in the subproject. Assuming that the name of the base image is `my-node`, the own `Dockerfile` in each project becomes:

```Dockerfile
FROM my-node
```

Yes, there is only one such line. When constructing a mirror with this one-line `Dockerfile` in each project directory, the three lines of the previous base image `ONBUILD` will start executing, successfully copy the current project code into the image, and execute for this project. `npm install`, generate an application image.


### Lab 
```
# Dockerfile
FROM busybox
ONBUILD RUN echo "You won't see me until later"
```
### Docker build 
```
docker build -t me/no_echo_here .

Uploading context  2.56 kB
Uploading context
Step 0 : FROM busybox
Pulling repository busybox
769b9341d937: Download complete
511136ea3c5a: Download complete
bf747efa0e2f: Download complete
48e5f45168b9: Download complete
 ---&gt; 769b9341d937
Step 1 : ONBUILD RUN echo "You won't see me until later"
 ---&gt; Running in 6bf1e8f65f00
 ---&gt; f864c417cc99
Successfully built f864c417cc9
```
Here the ONBUILD instruction is read, not run, but stored for later use.
```
# Dockerfile
FROM me/no_echo_here
```
docker build -t me/echo_here .
Uploading context  2.56 kB
Uploading context
Step 0 : FROM cpuguy83/no_echo_here

### Executing 1 build triggers
```
Step onbuild-0 : RUN echo "You won't see me until later"
 ---&gt; Running in ebfede7e39c8
You won't see me until later
 ---&gt; ca6f025712d4
 ---&gt; ca6f025712d4
Successfully built ca6f025712d4
```

### Ubutu Rails 

```
FROM ubuntu:12.04

RUN apt-get update -qq && apt-get install -y ca-certificates sudo curl git-core
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

RUN locale-gen  en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV LC_ALL en_US.UTF-8

RUN curl -L https://get.rvm.io | bash -s stable
ENV PATH /usr/local/rvm/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
RUN /bin/bash -l -c rvm requirements
RUN source /usr/local/rvm/scripts/rvm && rvm install ruby
RUN rvm all do gem install bundler

ONBUILD ADD . /opt/rails_demo
ONBUILD WORKDIR /opt/rails_demo
ONBUILD RUN rvm all do bundle install
ONBUILD CMD rvm all do bundle exec rails server

```
This Dockerfile is doing some initial setup of a base image. Installs Ruby and bundler. Pretty typical stuff. At the end are the ONBUILD instructions.

ONBUILD ADD . /opt/rails_demo Tells any child image to add everything in the current directory to /opt/railsdemo. Remember, this only gets run from a child image, that is when another image uses this one as a base (or FROM). And it just so happens if you look in the repo I have a skeleton rails app in railsdemo that has it's own Dockerfile in it, we'll take a look at this later.

ONBUILD WORKDIR /opt/rails_demo Tells any child image to set the working directory to /opt/rails_demo, which is where we told ADD to put any project files

ONBUILD RUN rvm all do bundle install Tells any child image to have bundler install all gem dependencies, because we are assuming a Rails app here.

ONBUILD CMD rvm all do bundle exec rails server Tells any child image to set the CMD to start the rails server

Ok, so let's see this image build, go ahead and do this for yourself so you can see the output.

```
git clone git@github.com:sangam14/docker_onbuild.git 
cd docker_onbuild
docker build -t sangam14/docker_onbuild .

Step 0 : FROM ubuntu:12.04
 ---&gt; 9cd978db300e
Step 1 : RUN apt-get update -qq &amp;&amp; apt-get install -y ca-certificates sudo curl git-core
 ---&gt; Running in b32a089b7d2d
# output supressed
ldconfig deferred processing now taking place
 ---&gt; d3fdefaed447
Step 2 : RUN rm /bin/sh &amp;&amp; ln -s /bin/bash /bin/sh
 ---&gt; Running in f218cafc54d7
 ---&gt; 21a59f8613e1
Step 3 : RUN locale-gen  en_US.UTF-8
 ---&gt; Running in 0fcd7672ddd5
Generating locales...
done
Generation complete.
 ---&gt; aa1074531047
Step 4 : ENV LANG en_US.UTF-8
 ---&gt; Running in dcf936d57f38
 ---&gt; b9326a787f78
Step 5 : ENV LANGUAGE en_US.UTF-8
 ---&gt; Running in 2133c36335f5
 ---&gt; 3382c53f7f40
Step 6 : ENV LC_ALL en_US.UTF-8
 ---&gt; Running in 83f353aba4c8
 ---&gt; f849fc6bd0cd
Step 7 : RUN curl -L https://get.rvm.io | bash -s stable
 ---&gt; Running in b53cc257d59c
# output supressed
---&gt; 482a9f7ac656
Step 8 : ENV PATH /usr/local/rvm/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
 ---&gt; Running in c4666b639c70
 ---&gt; b5d5c3e25730
Step 9 : RUN /bin/bash -l -c rvm requirements
 ---&gt; Running in 91469dbc25a6
# output supressed
Step 10 : RUN source /usr/local/rvm/scripts/rvm &amp;&amp; rvm install ruby
 ---&gt; Running in cb4cdfcda68f
# output supressed
Step 11 : RUN rvm all do gem install bundler
 ---&gt; Running in 9571104b3b65
Successfully installed bundler-1.5.3
Parsing documentation for bundler-1.5.3
Installing ri documentation for bundler-1.5.3
Done installing documentation for bundler after 3 seconds
1 gem installed
 ---&gt; e2ea33486d62
Step 12 : ONBUILD ADD . /opt/rails_demo
 ---&gt; Running in 5bef85f266a4
 ---&gt; 4082e2a71c7e
Step 13 : ONBUILD WORKDIR /opt/rails_demo
 ---&gt; Running in be1a06c7f9ab
 ---&gt; 23bec71dce21
Step 14 : ONBUILD RUN rvm all do bundle install
 ---&gt; Running in 991da8dc7f61
 ---&gt; 1547bef18de8
Step 15 : ONBUILD CMD rvm all do bundle exec rails server
 ---&gt; Running in c49139e13a0c
 ---&gt; 23c388fb84c1
Successfully built 23c388fb84c1
```

## Lab #14: Create an image with HEALTHCHECK instruction

The HEALTHCHECK directive tells Docker how to determine if the state of the container is normal. This was a new directive introduced during Docker 1.12. Before the HEALTHCHECK directive, the Docker engine can only determine if the container is in a state of abnormality by whether the main process in the container exits. In many cases, this is fine, but if the program enters a deadlock state, or an infinite loop state, the application process does not exit, but the container is no longer able to provide services. Prior to 1.12, Docker did not detect this state of the container and would not reschedule it, causing some containers to be unable to serve, but still accepting user requests.

The syntax look like:


`HEALTHCHECK [options] CMD <command>`: 

The above syntax set the command to check the health of the container

### How does it work?

When a HEALTHCHECK instruction is specified in an image, the container is started with it, the initial state will be starting, and will become healthy after the HEALTHCHECK instruction is checked successfully. If it fails for a certain number of times, it will become unhealthy.

### What options does HEALTHCHECK support?

`--interval=<interval>`: interval between two health checks, the default is 30 seconds;
`--timeout=<time length>`: The health check command runs the timeout period. If this time is exceeded, the health check is regarded as a failure. The default is 30 seconds.
`--retries=<number>`: When the specified number of consecutive failures, the container status is treated as unhealthy, the default is 3 times.
Like CMD, ENTRYPOINT, HEALTHCHECK can only appear once. If more than one is written, only the last one will take effect.


### Pre-requisite:

### Tested Infrastructure

<table class="tg">
  <tr>
    <th class="tg-yw4l"><b>Platform</b></th>
    <th class="tg-yw4l"><b>Number of Instance</b></th>
    <th class="tg-yw4l"><b>Reading Time</b></th>
    
  </tr>
  <tr>
    <td class="tg-yw4l"><b> Play with Docker</b></td>
    <td class="tg-yw4l"><b>1</b></td>
    <td class="tg-yw4l"><b>5 min</b></td>
    
  </tr>
  
</table>

### Pre-requisite

- Create an account with [DockerHub](https://hub.docker.com)
- Open [PWD](https://labs.play-with-docker.com/) Platform on your browser 
- Click on **Add New Instance** on the left side of the screen to bring up Alpine OS instance on the right side


### Assignment:

- Writing a Dockerfile with HEALTHCHECK instruction
- Build a Docker Image
- Check that the nginx config file exists
- Check if nginx is healthy
- Make Docker container Unhealthy and check
- Create the nginx.conf file and Making the container go healthy



### Writing a Dockerfile with HEALTHCHECK instruction

Suppose we have a simple Web service. We want to add a health check to determine if its Web service is working. We can use curl to help determine the HEALTHCHECK of its Dockerfile:

```
FROM nginx:1.13
HEALTHCHECK --interval=30s --timeout=3s \
  CMD curl -f http://localhost/ || exit 1
EXPOSE 80
```

Here we set a check every 3 seconds (here the interval is very short for the test, it should be relatively long), if the health check command does not respond for more than 3 seconds, it is considered a failure, and use curl -fs http://localhost/ || exit 1 As a health check command.

### Building Docker Image

```
docker image build -t nginx:1.13 .
```

### Check that the nginx config file exists

```
docker run --name=nginx-proxy -d \
        --health-cmd='stat /etc/nginx/nginx.conf || exit 1' \
        nginx:1.13
```

### Check if nginx is healthy

```
docker inspect --format='{{.State.Health.Status}}' nginx-proxy
```

### Make Docker container Unhealthy and check

```
docker exec nginx-proxy rm /etc/nginx/nginx.conf
```

### Check if nginx is healthy

```
sleep 5; docker inspect --format='{{.State.Health.Status}}' nginx-proxy
```

### Creating the nginx.conf file and Making the container go healthy

```
docker exec nginx-proxy touch /etc/nginx/nginx.conf
```

```
sleep 5; docker inspect --format='{{.State.Health.Status}}' nginx-proxy
healthy
```


## Lab #15: Create an image with SHELL instruction

### Pre-requisite:

  - Create an account with [DockerHub](https://hub.docker.com)
  - Open [PWD](https://labs.play-with-docker.com/) Platform on your browser 
  - Click on **Add New Instance** on the left side of the screen to bring up Alpine OS instance on the right side

### Tested Infrastructure

<table class="tg">
  <tr>
    <th class="tg-yw4l"><b>Platform</b></th>
    <th class="tg-yw4l"><b>Number of Instance</b></th>
    <th class="tg-yw4l"><b>Reading Time</b></th>    
  </tr>
  <tr>
    <td class="tg-yw4l"><b> Play with Docker</b></td>
    <td class="tg-yw4l"><b>1</b></td>
    <td class="tg-yw4l"><b>5 min</b></td>    
  </tr>
</table>

### How does it work?

Format: `SHELL ["executable", "parameters"]`

  - The SHELL instruction allows the default shell used for the shell form of commands to be overridden.
  The default shell on Linux is `["/bin/sh", "-c"]`, and on Windows is `["cmd", "/S", "/C"]`.
  The SHELL instruction must be written in JSON form in a Dockerfile.
  - The SHELL instruction is particularly useful on Windows where there are two commonly used and quite different native shells: `cmd` and `powershell`, as well as alternate shells available including `sh`.
  - The SHELL instruction can appear multiple times.
  Each SHELL instruction overrides all previous SHELL instructions, and affects all subsequent instructions. 

### Create a Dockerfile

```
FROM windowsservercore

# Executed as cmd /S /C echo default
RUN echo default

# Executed as cmd /S /C powershell -command Write-Host default
RUN powershell -command Write-Host default

# Executed as powershell -command Write-Host hello
SHELL ["powershell", "-command"]
RUN Write-Host hello

# Executed as cmd /S /C echo hello
SHELL ["cmd", "/S"", "/C"]
RUN echo hello
```

The following instructions can be affected by the `SHELL` instruction when the shell form of them is used in a Dockerfile: `RUN`, `CMD` and `ENTRYPOINT`.
The following example is a common pattern found on Windows which can be streamlined by using the SHELL instruction:

```
RUN powershell -command Execute-MyCmdlet -param1 "c:\foo.txt"
```

The command invoked by docker will be:

```
cmd /S /C powershell -command Execute-MyCmdlet -param1 "c:\foo.txt"
```

This is inefficient for two reasons. 
First, there is an un-necessary `cmd.exe` command processor (aka shell) being invoked.
Second, each `RUN` instruction in the shell form requires an extra powershell `-command` prefixing the command.

To make it more efficient, one of two mechanisms can be employed.
One is to use the JSON form of the RUN command such as:

```
RUN ["powershell", "-command", "Execute-MyCmdlet", "-param1 \"c:\\foo.txt\""]
```

While the JSON form is unambiguous and does not use the un-necessary `cmd.exe`, it does require more verbosity through double-quoting and escaping.
The alternate mechanism is to use the SHELL instruction and the shell form, making a more natural syntax for Windows users, especially when combined with the escape parser directive:

```
# escape=`

FROM windowsservercore
SHELL ["powershell","-command"]
RUN New-Item -ItemType Directory C:\Example
ADD Execute-MyCmdlet.ps1 c:\example\
RUN c:\example\Execute-MyCmdlet -sample 'hello world'
```

### Build an image

```
PS E:\docker\build\shell> docker build -t shell .
Sending build context to Docker daemon 3.584 kB
Step 1 : FROM windowsservercore
 ---> 5bc36a335344
Step 2 : SHELL powershell -command
 ---> Running in 87d7a64c9751
 ---> 4327358436c1
Removing intermediate container 87d7a64c9751
Step 3 : RUN New-Item -ItemType Directory C:\Example
 ---> Running in 3e6ba16b8df9


Directory: C:\

Mode                LastWriteTime         Length Name
----                -------------         ------ ----
d-----         6/2/2016   2:59 PM                Example


 ---> 1f1dfdcec085
Removing intermediate container 3e6ba16b8df9
Step 4 : ADD Execute-MyCmdlet.ps1 c:\example\
 ---> 6770b4c17f29
Removing intermediate container b139e34291dc
Step 5 : RUN c:\example\Execute-MyCmdlet -sample 'hello world'
 ---> Running in abdcf50dfd1f
Hello from Execute-MyCmdlet.ps1 - passed hello world
 ---> ba0e25255fda
Removing intermediate container abdcf50dfd1f
Successfully built ba0e25255fda
PS E:\docker\build\shell>
```

  - The SHELL instruction could also be used to modify the way in which a shell operates.
  For example, using `SHELL cmd /S /C /V:ON|OFF` on Windows, delayed environment variable expansion semantics could be modified.
  - The `SHELL` instruction can also be used on Linux should an alternate shell be required such `zsh`, `csh`, `tcsh` and others.
  - The `SHELL` feature was added in Docker 1.12.

## Lab 16: Create an image with USER Instruction


The `USER` directive is similar to `WORKDIR`, which changes the state of the environment and affects future layers. `WORKDIR` is to change the working directory, and `USER` is the identity of the commands such as `RUN`, `CMD` and `ENTRYPOINT`.


Of course, like `WORKDIR`, `USER` just helps you switch to the specified user. This user must be pre-established, otherwise it cannot be switched.

Example:

```Dockerfile
RUN groupadd -r redis && useradd -r -g redis redis
USER redis
RUN [ "redis-server" ]
```

If the script executed with `root` wants to change the identity during execution, such as wanting to run a service process with an already established user, don't use `su` or `sudo`, which requires a more cumbersome configuration. And often in the absence of TTY environment. It is recommended to use [`gosu`] (https://github.com/tianon/gosu).

```Dockerfile
# Create a redis user and use gosu to change another user to execute the command
RUN groupadd -r redis && useradd -r -g redis redis
# download gosu
RUN wget -O /usr/local/bin/gosu "https://github.com/tianon/gosu/releases/download/1.7/gosu-amd64" \
    && chmod +x /usr/local/bin/gosu \
    && gosu nobody true
# Set CMD and execute it as another user
CMD [ "exec", "gosu", "redis", "redis-server" ]
```

### Pre-requisite:

### Tested Infrastructure

<table class="tg">
  <tr>
    <th class="tg-yw4l"><b>Platform</b></th>
    <th class="tg-yw4l"><b>Number of Instance</b></th>
    <th class="tg-yw4l"><b>Reading Time</b></th>
    
  </tr>
  <tr>
    <td class="tg-yw4l"><b> Play with Docker</b></td>
    <td class="tg-yw4l"><b>1</b></td>
    <td class="tg-yw4l"><b>5 min</b></td>
    
  </tr>
  
</table>

### Pre-requisite

- Create an account with [DockerHub](https://hub.docker.com)
- Open [PWD](https://labs.play-with-docker.com/) Platform on your browser 
- Click on **Add New Instance** on the left side of the screen to bring up Alpine OS instance on the right side

## How is ENTRYPOINT different from the RUN instruction?

### Tested Infrastructure

<table class="tg">
  <tr>
    <th class="tg-yw4l"><b>Platform</b></th>
    <th class="tg-yw4l"><b>Number of Instance</b></th>
    <th class="tg-yw4l"><b>Reading Time</b></th>
    
  </tr>
  <tr>
    <td class="tg-yw4l"><b> Play with Docker</b></td>
    <td class="tg-yw4l"><b>1</b></td>
    <td class="tg-yw4l"><b>5 min</b></td>
    
  </tr>
  
</table>

### Pre-requisite

- Create an account with [DockerHub](https://hub.docker.com)
- Open [PWD](https://labs.play-with-docker.com/) Platform on your browser 
- Click on **Add New Instance** on the left side of the screen to bring up Alpine OS instance on the right side


### What is ENTRYPOINT meant for?

ENTRYPOINT is meant to provide the executable while CMD is to pass the default arguments to the executable.
To understand it clearly, let us consider the below Dockerfile:

![My Image](https://raw.githubusercontent.com/collabnix/dockerlabs/master/beginners/dockerfile/dockerfile-1.png)

If you try building this Docker image using `docker build command` -

![My Image](https://raw.githubusercontent.com/collabnix/dockerlabs/master/beginners/dockerfile/dockerfile-2.png)

 Let us run this image without any argument.

![My Image](https://raw.githubusercontent.com/collabnix/dockerlabs/master/beginners/dockerfile/dockerfile-3.png)

Let's run it passing a command line argument

![My Image](https://raw.githubusercontent.com/collabnix/dockerlabs/master/beginners/dockerfile/dockerfile-4.png)

This clearly state that ENTRYPOINT is meant to provide the executable while CMD is to pass the default arguments to the executable.

## Writing Dockerfile with Hello Python Script Added

### Pre-requisite:

- Create an account with [DockerHub](https://hub.docker.com)
- Open [PWD](https://labs.play-with-docker.com/) Platform on your browser 
- Click on **Add New Instance** on the left side of the screen to bring up Alpine OS instance on the right side

### Tested Infrastructure

<table class="tg">
  <tr>
    <th class="tg-yw4l"><b>Platform</b></th>
    <th class="tg-yw4l"><b>Number of Instance</b></th>
    <th class="tg-yw4l"><b>Reading Time</b></th>    
  </tr>
  <tr>
    <td class="tg-yw4l"><b> Play with Docker</b></td>
    <td class="tg-yw4l"><b>1</b></td>
    <td class="tg-yw4l"><b>5 min</b></td>    
  </tr>  
</table>

```
[node1] (local) root@192.168.0.38 ~
$ mkdir /test
```

```
[node1] (local) root@192.168.0.38 ~
$ cd /test
```

```
[node1] (local) root@192.168.0.38 /test
$ pwd
/test
```

Open a file named 'Dockerfile' with a text editor.

```
[node1] (local) root@192.168.0.38 /test
$ vi Dockerfile
```

## Writing a Dockerfile

#### Setting a Base Image using FROM keyword

```
FROM ubuntu
```

Thus, our image would start building taking base as Ubuntu.

#### Defining the Author (Optional) using MAINTAINER keyword

```
MAINTAINER Prashansa Kulshrestha
```

#### Running a commands on the base image to form new layers using RUN keyword

```
RUN apt-get update
RUN apt-get install python
```
Since, the base image was Ubuntu, we can run Ubuntu commands here. These commands above install python over Ubuntu.

#### Adding a simple Hello World printing python file to the container's file system using ADD command

```
ADD hello.py /home/hello.py
ADD a.py /home/a.py
```

We will place our hello.py and a.py files in the newly created directory itself (/test). ADD command would copy it from /test (current working directory) of host system
to container's filesystem at /home. The destination directories in the container would be create incase they don't exist.

Code for hello.py:
```
print ("Hello World")
```

Code for a.py:
```
print ("Overriden Hello")
```

#### Specifying default execution environment for the container using CMD and ENTRYPOINT

These keywords let us define the default execution environment for a container when it just initiates from an image or just starts.
If a command is specified with CMD keyword, it is the first command which a container executes as soon as it instantiates from an image. However, command and arguments provided with CMD can be overridden if user specifies his own commands while running the container using 'docker run' command.'

ENTRYPOINT helps to create a executable container and the commands and arguments provided with this keyword are not overridden.

We can also provide the default application environment using ENTRYPOINT and default arguments to be passed to it via CMD keyword. This can be done as follows:
```
CMD ["/home/hello.py"]
ENTRYPOINT ["python"]
```
So, default application mode of container would be python and if no other filename is provided as argument to it then it will execute hello.py placed in its /home directory.

Benefit of this is that user can choose some other file to run with the same application at runtime, that is, while launching the container.

So, our overall Dockerfile currently looks like this:

```
FROM ubuntu
MAINTAINER Prashansa Kulshrestha
RUN apt-get update
RUN apt-get install -y python
ADD hello.py /home/hello.py
ADD a.py /home/a.py
CMD ["/home/hello.py"]
ENTRYPOINT ["python"]
```

## Building a Dockerfile

To create an image from the Dockerfile, we need to build it. This is done as follows:

```
[node1] (local) root@192.168.0.38 /test
$ docker build -t pythonimage .
```

The option -t lets us tag our image with a name we desire. So, here we have named our image as 'pythonimage'.
The '.' in the end specifies current working directory i.e. /test. We initiated our build process from here. Docker would find the file named 'Dockerfile' in the current directory to process the build.

## Running a container from the newly built image

```
[node1] (local) root@192.168.0.38 /test
$ docker run --name test1 pythonimage
Hello World
[node1] (local) root@192.168.0.38 /test
$
```

So, here /home/hello.py file placed in the container executed and displayed the output 'Hello World', since it was specified as default with CMD keyword.

```
[node1] (local) root@192.168.0.38 /test
$ docker run --name test2 pythonimage /home/a.py
Overriden Hello 
[node1] (local) root@192.168.0.38 /test
$
```
Here, user specified another file to be run with python (default application for this container). So, the file specified with CMD got overridden and we obtained the output from /home/a.py.
