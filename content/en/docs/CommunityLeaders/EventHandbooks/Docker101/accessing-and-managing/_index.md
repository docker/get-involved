---
title: "Accessing & Managing Docker Image"
linkTitle: "Accessing & Managing Docker Image"
weight: 100
description: >-
     Accessing & Managing Docker Image
---


- [Accessing the Container Shell](#accessing-the-container-shell)
- [Running a Command inside running Container](#running-a-command-inside-running-container)
- [Managing Docker Containers](#managing-docker-containers)
- [Test Your Knowledge](#test-your-knowledge-quiz2)


## Accessing the Container Shell


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

## Pre-requisite

- Create an account with [DockerHub](https://hub.docker.com)
- Open [PWD](https://labs.play-with-docker.com/) Platform on your browser 
- Click on **Add New Instance** on the left side of the screen to bring up Alpine OS instance on the right side


## Create Ubuntu Container

```
docker run -dit ubuntu 
```

## Accessing the container shell

```
docker exec -t <container-id> bash
```

## Accesssing the container shell

```
docker attach <container-id>

```

## Running a command inside running Container


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


### Create Ubuntu Container

```
docker run -dit ubuntu
```

### Opening up the bash shell

```
docker exec -t <container-id> bash
```

## Managing Docker containers

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



### Preparations

 - Clean your docker host using the commands (in bash):

```
$ docker rm -f $(docker ps -a -q)
```

### Instructions

 - Run the following containers from the dockerhub:
```
$ docker run -d -p 5000:5000 --name app1 selaworkshops/python-app:1.0
```
```
$ docker run -d -p 5001:5001 -e "port=5001" --name app2 selaworkshops/python-app:2.0
```

 - Ensure the containers are running:
```
$ docker ps
```

 - Stop the first container:
```
$ docker stop app1
```

 - Kill the second container:
```
$ docker kill app2
```

 - Display running containers:
```
$ docker ps
```

 - Show all the containers (includind non running containers):
```
$ docker ps -a
```

 - Let's start both containers again:
```
$ docker start app1 app2
```

 - Restart the second container:
```
$ docker restart app2
```

 - Display the docker host information with:
```
$ docker info
```

 - Show the running processes in the first container using:
```
$ docker top app1
```

 - Retrieve the history of the second container:
```
$ docker history selaworkshops/python-app:2.0
```

 - Inspect the second container image:
```
$ docker inspect selaworkshops/python-app:2.0
```

 - Inspect the first container and look for the internal ip:
```
$ docker inspect app1
```
```
"Networks": {
                "bridge": {
                    "IPAMConfig": null,
                    "Links": null,
                    "Aliases": null,
                    "NetworkID": "822cb66790c6358d9decab874916120f3bdeff7193a4375c94ca54d50832303d",
                    "EndpointID": "9aa96dc29be08eddc6d8f429ebecd2285c064fda288681a3611812413cbdfc1f",
                    "Gateway": "172.17.0.1",
                    "IPAddress": "172.17.0.3",
                    "IPPrefixLen": 16,
                    "IPv6Gateway": "",
                    "GlobalIPv6Address": "",
                    "GlobalIPv6PrefixLen": 0,
                    "MacAddress": "02:42:ac:11:00:03",
                    "DriverOpts": null
                }
            }
```

 - Show the logs of the second container using the flag --follow:
```
$ docker logs --follow app2
```

 - Browse to the application and see the containers logs from the terminal:
```
http://localhost:5001
```

 - Stop to tracking logs:
 ```
$ CTRL + C
```

## Test Your Knowledge - Quiz2


| S. No.   |    Question. |      Response
:--------| :--------------|:---------------|
| 1   | What are different ways to access container shell? | |
| 2   | How to run a command inside a Docker container | |
| 3   | Is it possible to stop overall Docker containers in a single shot? | |
| 4   | How do you remove all dangling images in Docker?| |
| 5   | How do you access services ports under Docker? | |

