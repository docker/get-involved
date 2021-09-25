---
title: "Dockerize Your First React Application"
linkTitle: "Dockerize Your First React Application"
weight: 1009
description: >-
  How to containerize your first React Application
---

Now that we have our server, let’s set about writing our Dockerfile and constructing the container in where our newly born React application will live.

Now that we have defined everything we need for our React application to run in our Dockerfile we can now build an image using this file. In order to do that, we’ll need to run the following command:

```
$ docker build -t react-app .
[+] Building 19.0s (17/17) FINISHED
 => [internal] load build definition from Dockerfile                                                               0.0s
 => => transferring dockerfile: 625B                                                                               0.0s
 => [internal] load .dockerignore                                                                                  0.0s
 => => transferring context: 57B                                                                                   0.0s
 => [internal] load metadata for docker.io/library/nginx:1.19                                                      2.7s
 => [internal] load metadata for docker.io/library/node:15.4                                                       2.8s
 => [auth] library/nginx:pull token for registry-1.docker.io                                                       0.0s
 => [auth] library/node:pull token for registry-1.docker.io                                                        0.0s
 => [build 1/6] FROM docker.io/library/node:15.4@sha256:a76eb778d162f8fd96138d9ca7dbd14b8916c201775a97d2f2aa22e9f  0.0s
 => [internal] load build context                                                                                  0.1s
 => => transferring context: 516.66kB                                                                              0.0s
 => [stage-1 1/3] FROM docker.io/library/nginx:1.19@sha256:df13abe416e37eb3db4722840dd479b00ba193ac6606e7902331dc  0.0s
 => CACHED [build 2/6] WORKDIR /react-app                                                                          0.0s
 => CACHED [build 3/6] COPY package*.json .                                                                        0.0s
 => CACHED [build 4/6] RUN yarn install                                                                            0.0s
 => [build 5/6] COPY . .                                                                                           0.1s
 => [build 6/6] RUN yarn run build                                                                                14.3s
 => CACHED [stage-1 2/3] COPY ./nginx/nginx.conf /etc/nginx/nginx.conf                                             0.0s
 => CACHED [stage-1 3/3] COPY --from=build /react-app/build /usr/share/nginx/html                                  0.0s
 => exporting to image                                                                                             0.0s
 => => exporting layers                                                                                            0.0s
 => => writing image sha256:dcbdf2ec78039a9eda5acce77263ea5cf653730e78c151acfebaf7a5d33eac97                       0.0s
 => => naming to docker.io/library/react-app                                                                       0.0s
```

We can now verify that our image exists on our machine by typing docker images:

```
$ docker image ls
REPOSITORY                                 TAG                 IMAGE ID            CREATED             SIZE
react-app                            latest              dcbdf2ec7803        2 minutes ago       134MB$ docker images


```

In order to run this newly created image, we can use the docker run command and pass in the ports we want to map to and the image we wish to run.

```
$ docker run -p 80:80 -it react-app

```

- `-p 8000:5000` - This exposes our application which is running on port 80 within our container on http://localhost on our local machine.
- `-it` - This flag specifies that we want to run this image in interactive mode with a tty for this container process.
- `react-app` - This is the name of the image that we want to run in a container.

Awesome, if we open up http://localhost within our browser, we should see that our application is successfully responding with react template page.

# Running our Container In the Background

You’ll notice that if we `ctrl-c` this within the terminal, it will kill the container. If we want to have it run permanently in the background, you can replace -it with `-d ` to run this container in detached mode.

In order to view the list of containers running in the background you can use docker ps which should output something like this:

```
$ docker ps
CONTAINER ID   IMAGE       COMMAND                  CREATED         STATUS         PORTS                               NAMES
fe15c29533e2   react-app   "/docker-entrypoint.…"   6 seconds ago   Up 5 seconds   0.0.0.0:80->80/tcp, :::80->80/tcp   zealous_stonebraker

```
