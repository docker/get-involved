---
title: "Docker Compose 101 Labs"
linkTitle: "Docker Compose 101 Labs"
weight: 100
description: >-
     Page description for Docker Compose 101 Labs
---

# Lab #1: version Command

The `docker-compose version` command shows the Docker-Compose version information.


## Pre-requisite:

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

## Pre-requisite

- Create an account with [DockerHub](https://hub.docker.com)
- Open [PWD](https://labs.play-with-docker.com/) Platform on your browser 
- Click on **Add New Instance** on the left side of the screen to bring up Alpine OS instance on the right side

### Checking docker-compose version 
```
$ docker-compose version
docker-compose version 1.23.2, build 1110ad0
docker-py version: 3.7.3
CPython version: 2.7.16
OpenSSL version: OpenSSL 1.1.1c  28 May 2019
```
`docker-py` is the Docker Remote API, it does everything the docker command does, but from within Python – run containers, manage them, pull/push images, etc.<br>


# Lab #2: help Command
The `docker-compose help` list out all the subcommands that can be used with docker-compose.Even you can try <b>--help</b> or <b>-h</b>.


## Pre-requisite:

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

## Pre-requisite

- Create an account with [DockerHub](https://hub.docker.com)
- Open [PWD](https://labs.play-with-docker.com/) Platform on your browser 
- Click on **Add New Instance** on the left side of the screen to bring up Alpine OS instance on the right side

### Checking docker-compose help command 
```
$ docker-compose help

Define and run multi-container applications with Docker.

Usage:
  docker-compose [-f <arg>...] [options] [COMMAND] [ARGS...]
  docker-compose -h|--help

Options:
  -f, --file FILE             Specify an alternate compose file
                              (default: docker-compose.yml)
  -p, --project-name NAME     Specify an alternate project name
                              (default: directory name)
  --verbose                   Show more output
  --log-level LEVEL           Set log level (DEBUG, INFO, WARNING, ERROR, CRITICAL)
  --no-ansi                   Do not print ANSI control characters
  -v, --version               Print version and exit
  -H, --host HOST             Daemon socket to connect to

  --tls                       Use TLS; implied by --tlsverify
  --tlscacert CA_PATH         Trust certs signed only by this CA
  --tlscert CLIENT_CERT_PATH  Path to TLS certificate file
  --tlskey TLS_KEY_PATH       Path to TLS key file
  --tlsverify                 Use TLS and verify the remote
  --skip-hostname-check       Don't check the daemon's hostname against the
                              name specified in the client certificate
  --project-directory PATH    Specify an alternate working directory
                              (default: the path of the Compose file)
  --compatibility             If set, Compose will attempt to convert deploy
                              keys in v3 files to their non-Swarm equivalent
Commands:
  build              Build or rebuild services
  bundle             Generate a Docker bundle from the Compose file
  config             Validate and view the Compose file
  create             Create services
  down               Stop and remove containers, networks, images, and volumes
  events             Receive real time events from containers
  exec               Execute a command in a running container
  help               Get help on a command
  images             List images
  kill               Kill containers
  logs               View output from containers
  pause              Pause services
  port               Print the public port for a port binding
  ps                 List containers
  pull               Pull service images
  push               Push service images
  restart            Restart services
  rm                 Remove stopped containers
  run                Run a one-off command
  scale              Set number of containers for a service
  start              Start services
  stop               Stop services
  top                Display the running processes
  unpause            Unpause services
  up                 Create and start containers
  version            Show the Docker-Compose version information
```

#### Trying help commands for subcommands
Even you can try help for docker subcommands also
```
$ docker-compose build --help
Build or rebuild services.

Services are built once and then tagged as `project_service`,
e.g. `composetest_db`. If you change a service's `Dockerfile` or the
contents of its build directory, you can run `docker-compose build` to rebuild it.

Usage: build [options] [--build-arg key=val...] [SERVICE...]

Options:
    --compress              Compress the build context using gzip.
    --force-rm              Always remove intermediate containers.
    --no-cache              Do not use cache when building the image.
    --pull                  Always attempt to pull a newer version of the image.
    -m, --memory MEM        Sets memory limit for the build container.
    --build-arg key=val     Set build-time variables for services.
    --parallel              Build images in parallel.
```

# Lab #3: Config Command
The `docker-compose config` command validate the docker-compose file and view the compose file.

## Pre-requisite:

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

## Pre-requisite

- Create an account with [DockerHub](https://hub.docker.com)
- Open [PWD](https://labs.play-with-docker.com/) Platform on your browser 
- Click on **Add New Instance** on the left side of the screen to bring up Alpine OS instance on the right side

# Assignment
- Create a docker-compose.yml file
- Validate the docker-compose file
- Testing docker-compose config with wrong config



### Create a docker-compose.yml file

Copy the below contents:

```
version: '3.1'
services:
  #Nginx Service
   webserver:
     image: nginx:alpine
     container_name: webserver
     restart: unless-stopped
     ports:
       - "80:80"
       - "443:443"
```

Or Clone the repository:

```
git clone https://github.com/collabnix/dockerlabs
cd intermediate/workshop/compose/lab/3/config/
cat docker-compose.yml
```


### Validate the docker-compose file
```
$ docker-compose config
services:
  webserver:
    container_name: webserver
    image: nginx:alpine
    ports:
    - 80:80/tcp
    - 443:443/tcp
    restart: unless-stopped
version: '3.1'
```
### Testing docker-compose config with wrong config
Lets just change the instruction `services` to `service` and test.
```
$docker-compose config

ERROR: The Compose file './docker-compose.yml' is invalid because:
Invalid top-level property "service". Valid top-level sections for this Compose file are: services, secrets, version, networks, volumes, and extensions starting with "x-".

You might be seeing this error because you're using the wrong Compose file version. Either specify a supported version (e.g "2.2" or "3.3") and place your service definitions under the `services` key, or omit the `version` key and place your service definitions at the root of the file to use version 1.
For more on the Compose file format versions, see https://docs.docker.com/compose/compose-file/
```

# Lab #4: Build Command
In this lab we are going to look into <b>docker-compose build</b> command.Docker build used to create a new image using the instructions in the Dockerfile. The <b>build</b> can be specified either as a string containing a path to the build context. The newly built image will be used to create the container for the service.

## Command instructions

#### build

The format is docker-compose build [options] [SERVICE...] .

Build (rebuild) the service container in the project.

Once the service container is built, it will be tagged with a tagname, such as a db container in a web project, possibly web_db.

You can rebuild the service at any time by running the docker-compose build in the project directory.

Options include:

`--force-rm` removes the temporary container during the build process.

`--no-cache` does not use cache during the build image process (this will lengthen the build process).

`--pull always` tries to get a mirror of the updated version by `--pull` .



## Pre-requisite:

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

## Pre-requisite

- Create an account with [DockerHub](https://hub.docker.com)
- Open [PWD](https://labs.play-with-docker.com/) Platform on your browser 
- Click on **Add New Instance** on the left side of the screen to bring up Alpine OS instance on the right side

We are going to build an nginx image with custome page 

#### Setup environment:
```
$ mkdir docker-compose/build
$ cd docker-compose/build
```

#### Now lets create the Dockerfile
```
FROM nginx:alpine
RUN echo "Welcome to Docker Workshop!" >/usr/share/nginx/html/index.html
CMD ["nginx", "-g", "daemon off;"]
```

#### Create a docker-compose.yml file
```
version: "3.7"
services:
  webapp:
    build:
      context: .
      dockerfile: Dockerfile
    image: webapp:v1
```
<b>context:</b> To specify the build context directory that is sent to the Docker daemon.<br>
<b>dockerfile:</b> use to specify Alternate Dockerfile or path to Dockerfile.
#### Build the image using docker-compose
```
$ docker-compose build
```
Since we specified <b>image:</b> as well as <b>build:</b>, then the Compose built the image with name <b>webapp</b> and tag <b>v1</b>.<br>
If we didnt specify the <b>image:</b> option the image name will be <b>buid_<service_name>:latest</b>.

#### Check the image have created
```
$ docker image ls webapp:v1
```

### Quick Notes:

#### build

Specifies the path to the folder where the Dockerfile is located (either an absolute path or a path relative to the docker-compose.yml file). Compose will use it to automatically build this image and then use this image.
```
 version: '3' services:  webapp:  build: ./dir 
```  
You can also use the context directive to specify the path to the folder where the Dockerfile is located.

Use the dockerfile directive to specify the Dockerfile filename.

Use the arg directive to specify the variables when the image is built.
```
 version: '3' services:  webapp:  build:  context: ./dir  dockerfile: Dockerfile-alternate  args:  buildno: 1 
 ```
Use cache_from specify the cache to build the image
```
 build:  context: .  cache_from:  - alpine: latest  - corp/web_app: 3.14 
```
  
# Lab #5: pull Command
The `docker-compose pull` command pull down the images which is specified under each service of docker-compose file from the docker hub.

## Pre-requisite:

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

## Pre-requisite

- Create an account with [DockerHub](https://hub.docker.com)
- Open [PWD](https://labs.play-with-docker.com/) Platform on your browser 
- Click on **Add New Instance** on the left side of the screen to bring up Alpine OS instance on the right side

# Assignment
- Create a docker-compose.yml file
- Pull down the service images
- Pull down image of a single service


### Create a docker-compose.yml file
```
version: '3.1'
services:
  #Nginx Service
   webserver:
     image: nginx:alpine
     container_name: webserver
     restart: unless-stopped
     ports:
       - "80:80"
       - "443:443"
   dbserver:
     image: mysql:5.7
     container_name: Mysqldb
     restart: unless-stopped
     ports:
       - "3306:3306"
```

### Pull down the service images
```
$ docker-compose pull
Pulling webserver ... done
Pulling dbserver  ... done
```
#### Checking the images in local
```
$ docker image ls
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
mysql               5.7                 383867b75fd2        2 hours ago         373MB
nginx               alpine              d87c83ec7a66        2 weeks ago         21.2MB
```

### Pull down image of a single service
Before doing pull make sure you have removed the images(docker image rm <Image_name/Image_ID>) which is already pulled.
```
$ docker-compose pull webserver
Pulling webserver ... done
```
This pulldown only the webserver service image(nginx:alpine).
