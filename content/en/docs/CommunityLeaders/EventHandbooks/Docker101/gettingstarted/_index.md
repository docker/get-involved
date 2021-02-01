---
title: "Getting Started with Docker Image"
linkTitle: "Getting Started with Docker Image"
weight: 90
description: >-
     Getting Started with Docker Image
---


- [Running Hello World Example](#running-hello-world-example)  
- [Working with Docker Image](#working-with-docker-image) 
- [Saving Images and Containers as Tar Files for Sharing](#saving-images-and-containers-as-tar-files-for-sharing)
- [Building Your First Alpine Docker Image and Push it to DockerHub](#building-your-first-alpine-docker-image-and-push-it-to-dockerhub)
- [Test Your Knowledge](#test-your-knowledge)


## Getting Started with Docker Image

 Demonstrating Hello World Example


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


## Running Hello World Example



```
$ docker run hello-world

```

```
Unable to find image 'hello-world:latest' locally
latest: Pulling from library/hello-world
0e03bdcc26d7: Pull complete 
Digest: sha256:31b9c7d48790f0d8c50ab433d9c3b7e17666d6993084c002c2ff1ca09b96391d
Status: Downloaded newer image for hello-world:latest

Hello from Docker!
This message shows that your installation appears to be working correctly.

To generate this message, Docker took the following steps:
 1. The Docker client contacted the Docker daemon.
 2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
    (amd64)
 3. The Docker daemon created a new container from that image which runs the
    executable that produces the output you are currently reading.
 4. The Docker daemon streamed that output to the Docker client, which sent it
    to your terminal.

To try something more ambitious, you can run an Ubuntu container with:
 $ docker run -it ubuntu bash

Share images, automate workflows, and more with a free Docker ID:
 https://hub.docker.com/

For more examples and ideas, visit:
 https://docs.docker.com/get-started/
```






### Explanation


This image is a prime example of using the scratch image effectively. See hello.c in https://github.com/docker-library/hello-world for the source code of the hello binary included in this image.

So what’s happened here? We’ve called the docker run command, which is responsible for launching containers.

The argument hello-world is the name of the image someone created on dockerhub for us. It will first search for "hello-world" image locally and then search in Dockerhub.

Once the image has been downloaded, Docker turns the image into a running container and executes it. 

### Did you Know?

1. The Hello World Docker Image is only 1.84 KB size.

```
[node1] (local) root@192.168.0.18 ~
$ docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
hello-world         latest              4ab4c602aa5e        6 weeks ago         1.84kB
```

2. While running `docker ps` command, it doesn't display any running container. Reason - It gets executed once and exit immediately.

```
$ docker ps
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS
      PORTS               NAMES
```

3. You can use `docker inspect <imagename>` command to inspect about this particular Docker Image. 

```
$ docker inspect 4ab
[
    {
        "Id": "sha256:4ab4c602aa5eed5528a6620ff18a1dc4faef0e1ab3a5eddeddb410714478c67f",
        "RepoTags": [
            "hello-world:latest"
        ],
        "RepoDigests": [
            "hello-world@sha256:0add3ace90ecb4adbf7777e9aacf18357296e799f81cabc9fde470971e499788"
        ],
        "Parent": "",
        "Comment": "",
        "Created": "2018-09-07T19:25:39.809797627Z",
        "Container": "15c5544a385127276a51553acb81ed24a9429f9f61d6844db1fa34f46348e420",
        "ContainerConfig": {
            "Hostname": "15c5544a3851",
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
                "#(nop) ",
                "CMD [\"/hello\"]"
            ],
            "ArgsEscaped": true,
            "Image": "sha256:9a5813f1116c2426ead0a44bbec252bfc5c3d445402cc1442ce9194fc1397027",
            "Volumes": null,
            "WorkingDir": "",
            "Entrypoint": null,
            "OnBuild": null,
            "Labels": {}
        },
        "DockerVersion": "17.06.2-ce",
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
                "/hello"
            ],
            "ArgsEscaped": true,
            "Image": "sha256:9a5813f1116c2426ead0a44bbec252bfc5c3d445402cc1442ce9194fc1397027",
            "Volumes": null,
            "WorkingDir": "",
            "Entrypoint": null,
            "OnBuild": null,
            "Labels": null
        },
        "Architecture": "amd64",
        "Os": "linux",
        "Size": 1840,
        "VirtualSize": 1840,
        "GraphDriver": {
            "Data": {
                "MergedDir": "/var/lib/docker/overlay2/e494ae30abc49ad403ef5c2a32bcb894629ea4da6d4d226fbca70d27ed9a74d8/merged",
                "UpperDir": "/var/lib/docker/overlay2/e494ae30abc49ad403ef5c2a32bcb894629ea4da6d4d226fbca70d27ed9a74d8/diff",
                "WorkDir": "/var/lib/docker/overlay2/e494ae30abc49ad403ef5c2a32bcb894629ea4da6d4d226fbca70d27ed9a74d8/work"
            },
            "Name": "overlay2"
        },
        "RootFS": {
            "Type": "layers",
            "Layers": [
                "sha256:428c97da766c4c13b19088a471de6b622b038f3ae8efa10ec5a37d6d31a2df0b"
            ]
        },
        "Metadata": {
            "LastTagTime": "0001-01-01T00:00:00Z"
        }
    }
]
```

## Working with Docker Image

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


### Listing the Docker Images

```
$ docker images
```

```
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
hello-world         latest              4ab4c602aa5e        6 weeks ago         1.84kB
```

### Show all images (default hides intermediate images)

```
docker images -a
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
hello-world         latest              4ab4c602aa5e        6 weeks ago         1.84kB
```


### List images by name and tag

The docker images command takes an optional [REPOSITORY[:TAG]] argument that restricts the list to images that match the argument. If you specify REPOSITORY but no TAG, the docker images command lists all images in the given repository.

To demo this, let us pull all various versions of alpine OS

```
docker pull alpine:3.6
docker pull alpine:3.7
docker pull alpine:3.8
docker pull alpine:3.9
```

```
[node4] (local) root@192.168.0.20 ~
$ docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
alpine              3.6                 43773d1dba76        7 days ago          4.03MB
alpine              3.7                 6d1ef012b567        7 days ago          4.21MB
alpine              3.8                 dac705114996        7 days ago          4.41MB
alpine              3.9                 5cb3aa00f899        7 days ago          5.53MB
```

```
[node4] (local) root@192.168.0.20 ~
$ docker images alpine:3.7
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
alpine              3.7                 6d1ef012b567        7 days ago          4.21MB
```

### List the full length image IDs

```
$ docker images --no-trunc
REPOSITORY          TAG                 IMAGE ID                                                                  CREATED
     SIZE
alpine              3.6                 sha256:43773d1dba76c4d537b494a8454558a41729b92aa2ad0feb23521c3e58cd0440   7 days ago
     4.03MB
alpine              3.7                 sha256:6d1ef012b5674ad8a127ecfa9b5e6f5178d171b90ee462846974177fd9bdd39f   7 days ago
     4.21MB
alpine              3.8                 sha256:dac7051149965716b0acdcab16380b5f4ab6f2a1565c86ed5f651e954d1e615c   7 days ago
     4.41MB
alpine              3.9                 sha256:5cb3aa00f89934411ffba5c063a9bc98ace875d8f92e77d0029543d9f2ef4ad0   7 days ago
     5.53MB
```

### Listing out images with filter

```
$ docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
ubuntu              latest              94e814e2efa8        3 days ago          88.9MB
alpine              3.6                 43773d1dba76        7 days ago          4.03MB
alpine              3.7                 6d1ef012b567        7 days ago          4.21MB
alpine              3.8                 dac705114996        7 days ago          4.41MB
alpine              3.9                 5cb3aa00f899        7 days ago          5.53MB
```

If you want to filter out just alpine

```
$ docker images --filter=reference='alpine'
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
alpine              3.6                 43773d1dba76        7 days ago          4.03MB
alpine              3.7                 6d1ef012b567        7 days ago          4.21MB
alpine              3.8                 dac705114996        7 days ago          4.41MB
alpine              3.9                 5cb3aa00f899        7 days ago          5.53MB
```

### Saving Images and Containers as Tar Files for Sharing

Imagine a scenario where you have built Docker images and containers that you would be interested to keep and share it with your other collaborators or colleagues. The below methods shall help you achieve it.

Four basic Docker CLI comes into action:

- The `docker export` - Export a container’s filesystem as a tar archive
- The `docker import` - Import the contents from a tarball to create a filesystem image
- The `docker save` - Save one or more images to a tar archive (streamed to STDOUT by default)
- The `docker load` - Load an image from a tar archive or STDIN


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


### Create Nginx Container

```
$ docker run -d -p 80:80 nginx
Unable to find image 'nginx:latest' locally
latest: Pulling from library/nginx
a5a6f2f73cd8: Pull complete
1ba02017c4b2: Pull complete
33b176c904de: Pull complete
Digest: sha256:5d32f60db294b5deb55d078cd4feb410ad88e6fe77500c87d3970eca97f54dba
Status: Downloaded newer image for nginx:latest
df2caf9283e84a15bb2321a17aabe84e3e0762ec82fc180e2a4c15fcf0f96588
[node1] (local) root@192.168.0.33 ~
```

### Displaying Running Container
```
$ docker ps -a
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                NAMES
df2caf9283e8        nginx               "nginx -g 'daemon of…"   35 seconds ago      Up 34 seconds       0.0.0.0:80->80/tcp   vigorous_jang
```


```
$ docker export df2 > nginx.tar
```

You could commit this container as a new image  locally, but you could also use the Docker import command:

```
$ docker import - mynginx < nginx.tar
sha256:aaaed50d250a671042e8dc383c6e05012e245f5eaf555d10c40be63f6028ee7b
```

```
$ docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
mynginx             latest              aaaed50d250a        25 seconds ago      107MB
nginx               latest              568c4670fa80        2 weeks ago         109MB
```


If you wanted to share this image with one of your collaborators, you could upload the tar file on a web server and let your collaborator download it and use the import command on his Docker host.

If you would rather deal with images that you have already committed, you can use the load and save commands:

```
$ docker save -o mynginx1.tar nginx
```

```
$ ls -l
total 218756
-rw-------    1 root     root     112844800 Dec 18 02:53 mynginx1.tar
-rw-r--r--    1 root     root     111158784 Dec 18 02:50 nginx.tar
```

```
$ docker rmi mynginx
Untagged: mynginx:latest
Deleted: sha256:aaaed50d250a671042e8dc383c6e05012e245f5eaf555d10c40be63f6028ee7b
Deleted: sha256:41135ad184eaac0f5c4f46e4768555738303d30ab161a7431d28a5ccf1778a0f
```

Now delete all images and containers running and try to run the below command to load Docker image into your system:

```
$ docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
```

```
$ docker load < mynginx1.tar
Loaded image: nginx:latest
```

```
[node1] (local) root@192.168.0.33 ~$ docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
nginx               latest              568c4670fa80        2 weeks ago         109MB
[node1] (local) root@192.168.0.33 ~
$
```

## Building Your First Alpine Docker Image and Push it to DockerHub

How to build Your First Alpine Docker Image and Push it to DockerHub


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

Under this tutorial we will see how to build our own first alpine based Docker Image.

```
$ docker run -dit alpine sh
620e1bcb5ab6e84b75a7a5c35790a77691112e59830ea1d5d85244bc108578c9
[node4] (local) root@192.168.0.20 ~
```

```
$ docker ps
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
620e1bcb5ab6        alpine              "sh"                3 seconds ago       Up 2 seconds                            keen_alba
ttani
```

```
[node4] (local) root@192.168.0.20 ~
$ docker attach 62
/ #
/ #
/ # cat /etc/os-release
NAME="Alpine Linux"
ID=alpine
VERSION_ID=3.9.2
PRETTY_NAME="Alpine Linux v3.9"
HOME_URL="https://alpinelinux.org/"
BUG_REPORT_URL="https://bugs.alpinelinux.org/"
/ #
```

### Updating APK Packages

```
/ # apk update
fetch http://dl-cdn.alpinelinux.org/alpine/v3.9/main/x86_64/APKINDEX.tar.gz
fetch http://dl-cdn.alpinelinux.org/alpine/v3.9/community/x86_64/APKINDEX.tar.gz
v3.9.2-21-g3dda2a36ce [http://dl-cdn.alpinelinux.org/alpine/v3.9/main]
v3.9.2-19-gfdf726d41a [http://dl-cdn.alpinelinux.org/alpine/v3.9/community]
OK: 9756 distinct packages available
/ # ^
```

```
/ # apk add git
(1/7) Installing ca-certificates (20190108-r0)
(2/7) Installing nghttp2-libs (1.35.1-r0)
(3/7) Installing libssh2 (1.8.0-r4)
(4/7) Installing libcurl (7.64.0-r1)
(5/7) Installing expat (2.2.6-r0)
(6/7) Installing pcre2 (10.32-r1)
(7/7) Installing git (2.20.1-r0)
Executing busybox-1.29.3-r10.trigger
Executing ca-certificates-20190108-r0.trigger
OK: 20 MiB in 21 packages
/ #
```

### Now lets come out of it by Ctrl+P+Q and commit the changes

```
$ docker ps
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
620e1bcb5ab6        alpine              "sh"                4 minutes ago       Up 4 minutes                            keen_alba
ttani
[node4] (local) root@192.168.0.20 ~
$ docker commit -m "Added GIT" 620 ajeetraina/alpine-git
sha256:9a8cd6c3bd8761013b2b932c58af2870f5637bfdf4227d7414073b0458ed0c54
[node4] (local) root@192.168.0.20 ~
$ docker images
REPOSITORY              TAG                 IMAGE ID            CREATED             SIZE
ajeetraina/alpine-git   latest              9a8cd6c3bd87        11 seconds ago      31.2MB
ubuntu                  latest              94e814e2efa8        3 days ago          88.9MB
alpine                  3.6                 43773d1dba76        7 days ago          4.03MB
alpine                  3.7                 6d1ef012b567        7 days ago          4.21MB
alpine                  3.8                 dac705114996        7 days ago          4.41MB
alpine                  3.9                 5cb3aa00f899        7 days ago          5.53MB
alpine                  latest              5cb3aa00f899        7 days ago          5.53MB
```

There you see a new image just created.

### Time to tag the image

```
$ docker tag --help

Usage:  docker tag SOURCE_IMAGE[:TAG] TARGET_IMAGE[:TAG]

Create a tag TARGET_IMAGE that refers to SOURCE_IMAGE
[node4] (local) root@192.168.0.20 ~
$ docker tag ajeetraina/alpine-git:latest ajeetraina/alpine-git:1.0
```

```
$ docker images
REPOSITORY              TAG                 IMAGE ID            CREATED             SIZE
ajeetraina/alpine-git   1.0                 9a8cd6c3bd87        2 minutes ago       31.2MB
ajeetraina/alpine-git   latest              9a8cd6c3bd87        2 minutes ago       31.2MB
ubuntu                  latest              94e814e2efa8        3 days ago          88.9MB
alpine                  3.6                 43773d1dba76        7 days ago          4.03MB
alpine                  3.7                 6d1ef012b567        7 days ago          4.21MB
alpine                  3.8                 dac705114996        7 days ago          4.41MB
alpine                  3.9                 5cb3aa00f899        7 days ago          5.53MB
alpine                  latest              5cb3aa00f899        7 days ago          5.53MB
```

### Pushing it to DockerHub

```
$ docker login
Login with your Docker ID to push and pull images from Docker Hub. If you don't have a Docker ID, head over to https://hub.docker
.com to create one.
Username: ajeetraina
Password:
WARNING! Your password will be stored unencrypted in /root/.docker/config.json.
Configure a credential helper to remove this warning. See
https://docs.docker.com/engine/reference/commandline/login/#credentials-store

Login Succeeded
[node4] (local) root@192.168.0.20 ~
```


```
$ docker push ajeetraina/alpine-git:1.0
The push refers to repository [docker.io/ajeetraina/alpine-git]
3846235f8c17: Pushed
bcf2f368fe23: Mounted from library/alpine
1.0: digest: sha256:85d50f702e930db9e5b958387e667b7e26923f4de340534085cea184adb8411e size: 740
[node4] (local) root@192.168.0.20 ~
```

## Test Your Knowledge 




| S. No.   |    Question. |      Response
:--------| :--------------|:---------------|
| 1   | What is difference between Docker Image and Docker Container? | |
| 2   | Where are all Docker images stored? | |
| 3   | Is DockerHub a public or private Docker registry? | |
| 4   | What is the main role of Docker Engine? | |
| 5   | Can you run Alpine container without even pulling it? | |
| 6   | What is the minimal size of Docker image you have built?  | |
| 7   | I have mix of Ubuntu and CentOS-based Docker images. How shall I filter it out?  | 
