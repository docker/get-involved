---
title: "Introduction to Docker Networking"
linkTitle: "Introduction to Docker Networking"
weight: 100
description: >-
     Page description for Introduction to Docker Networking
---

# Docker Networking

For Docker containers to communicate with each other and the outside world via the host machine, there has to be a layer of networking involved. Docker supports different types of networks, each fit for certain use cases.

## What are different types of Networking in Docker

Docker comes with network drivers geared towards different use cases. Docker’s networking subsystem is pluggable, using drivers.

### What is `docker0` in terms of Docker Networking

When Docker is installed, a default **bridge** network named **docker0** is created. Each new Docker container is automatically attached to this network, unless a custom network is specified.

Besides **docker0**, two other networks get created automatically by Docker: **host**(no isolation between host and containers on this network, to the outside world they are on the same network) and **none**(attached containers run on container-specific network stack)

1. ### Host networks

Using host network driver for a container, that container’s network stack is not isolated from the Docker host, and use the host’s networking directly.
Host is only available for swarm services on **_Docker 17.06 and higher_**.
The host networking driver only works on Linux hosts, and is not supported on Docker for Mac, Docker for Windows, or Docker EE for Windows Server.

2. ### Bridge networks

The default network driver. If you don’t specify a driver, this is the type of network you are creating. Bridge networks are usually used when your applications run in standalone containers that need to communicate. A bridge network uses a software bridge which allows containers connected to the same bridge network to communicate, while providing isolation from containers which are not connected to that bridge network.

3. ### Macvlan networks

Legacy applications expect to be directly connected to the physical network, rather than routed through the Docker host’s network stack. Macvlan networks assign a MAC address to a container, making it appear as a physical device on your network. The Docker daemon routes traffic to containers by their MAC addresses. We need to designate a physical interface on our Docker host to use for the Macvlan, as well as the subnet and gateway of the Macvlan.

4. ### None networks
This mode will not configure any IP to the container and doesn’t have any access to the external network as well as to other containers. It does have the loopback address and can be used for running batch jobs.

5. ### Overlay networks
You have multiple docker host running containers in which each docker host has its own internal private bridge network allowing the containers to communicate with each other however, containers across the host has no way to communicate with each other unless you publish the port on those containers and set up some kind of routing yourself. This is where `Overlay network` comes into play. With docker swarm you can create an overlay network which will create an internal private network that spans across all the nodes participating in the swarm network as we could attach a container or service to this network using the network option while creating a service. So, the containers across the nodes can communicate over this overlay network.

## Few Basic commands

### 1. How to assign Static IP address to a Container

- Create a new bridge network with your subnet and gateway for your ip block

```docker
$ docker network create --subnet 198.0.125.0/24 --gateway 198.0.125.254 mystaticip
```

- Run a nginx container with a specific ip in that block

```docker
$ docker run --rm -it --net mystaticip --ip 198.0.125.2 nginx
```

- Curl the ip

```docker
$ curl 198.0.125.2
```

### 2. How to Expose Container Port on Host

```docker
$ docker run -d -p 80:80 nginx
```

- If you have multiple interface, then you will need to provide specific IP. Example:-

```docker
$ docker run -p 127.0.0.1:$HOSTPORT:$CONTAINERPORT --name CONTAINER -t image_name
```

### 3. Networking Containers on Multiple Hosts with Docker Network work

```docker
base=https://github.com/docker/machine/releases/download/v0.14.0 &&

curl -L $base/docker-machine-$(uname -s)-$(uname -m) >/tmp/docker-machine &&

sudo install /tmp/docker-machine /usr/local/bin/docker-machine
```


# Lab #1: Docker Overlay Networking

The overlay network driver creates a distributed network among multiple Docker daemon hosts. It allows you to create a secure, layer-2 network, spanning into multiple docker hosts. When you setup a Docker swarm/ Docker in swarm mode, docker automatically create an overlay network called <b>ingress</b>. 

### Firewall rules for Docker daemons using overlay networks

You need the following ports open to traffic to and from each Docker host participating on an overlay network:
```
TCP port 2377 for cluster management communications
TCP and UDP port 7946 for communication among nodes
UDP port 4789 for overlay network traffic
```


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
    <td class="tg-yw4l"><b>2</b></td>
    <td class="tg-yw4l"><b>5 min</b></td>
    
  </tr>
  
</table>

## Pre-requisite

- Create an account with [DockerHub](https://hub.docker.com)
- Open [PWD](https://labs.play-with-docker.com/) Platform on your browser 
- Click on **Add New Instance** on the left side of the screen to bring up Alpine OS instance on the right side
- Create a swarm cluster 

### Check docker network in host mode
```
$ docker network ls
NETWORK ID          NAME                DRIVER              SCOPE
e2ff8b7516b8        bridge              bridge              local
2bbb99678f58        host                host                local
04212f972673        none                null                local
```

### Setting up a swarm
```
$ docker swarm init --advertise-addr=<Manager_Private_IP> --listen-addr=<Manager_Private_IP>:2377
```
Once swarm is ready lets check network

### Network in swarm mode
```
$ docker network ls
NETWORK ID          NAME                DRIVER              SCOPE
e2ff8b7516b8        bridge              bridge              local
6a424c3904d1        docker_gwbridge     bridge              local
2bbb99678f58        host                host                local
s0ty6ay3lgdx        ingress             overlay             swarm
04212f972673        none                null                local
```
You will see the default overlay network <b>ingress</b> has been created on both hosts (Worker and Manager). But when you create a custom overlay network, Only on manager node the network will get created on host node once the task is assigned then on the custom network will get created. 


# Lab #2: Create an Overlay network

In this lab we are going to create a user defined <b>Overlay network</b>.

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
    <td class="tg-yw4l"><b>2</b></td>
    <td class="tg-yw4l"><b>5 min</b></td>
    
  </tr>
  
</table>

## Pre-requisite

- Create an account with [DockerHub](https://hub.docker.com)
- Open [PWD](https://labs.play-with-docker.com/) Platform on your browser 
- Click on **Add New Instance** on the left side of the screen to bring up Alpine OS instance on the right side
- Create a swarm cluster 

#### Create an overlay network called myoverlay0
```
$ docker network create --driver=overlay --subnet=192.168.1.0/24 --gateway=192.168.1.100 myoverlay0
```
#### Listout the networks in the host
```
$ docker network ls
NETWORK ID          NAME                DRIVER              SCOPE
7bbea9e2f1c4        bridge              bridge              local
99e0866a81c5        docker_gwbridge     bridge              local
180292624b34        host                host                local
pp47xrb8x4da        ingress             overlay             swarm
1o0u8kqharpe        myoverlay0          overlay             swarm
e7e3f13ebea6        none                null                local
```
#### View the details of network myoverlay0
```
$ docker network inspect myoverlay0
```
#### Create an encrypted overlay network
By default application data is not encrypted, to encrypt application data as well, we need to add <b>--opt encrypted</b> while creating Overlaynetwork.
```
$ docker network create -d overlay --opt encrypted encrypted_overlay
```


# Lab #3: Create a service

In this lab we will be looking to different option to connect service with user defined Overlay network. 

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
    <td class="tg-yw4l"><b>2</b></td>
    <td class="tg-yw4l"><b>5 min</b></td>
    
  </tr>
  
</table>

## Pre-requisite

- Create an account with [DockerHub](https://hub.docker.com)
- Open [PWD](https://labs.play-with-docker.com/) Platform on your browser 
- Click on **Add New Instance** on the left side of the screen to bring up Alpine OS instance on the right side
- Swarm cluster 

#### Create service on overlay network myoverlay0
```
$ docker service create --name testWeb -p 80:80 --network=myoverlay0 --replicas 3 httpd
```

#### Checking Network ID for the service 
```
$ docker service inspect --format={{.Endpoint.VirtualIPs}} testWeb
```
### Connect an existing service to an overlay network
#### Createing A new service with name testApp
```
$ docker service create --name testApp -p 8081:80 --replicas 3 nginx:alpine
```
#### Checking the current network for the service
```
$ docker service inspect --format={{.Endpoint.VirtualIPs}} testApp
```
#### Connecting service to userdefined network myoverlay0
```
$ docker service update --network-add myoverlay0 testApp
```
#### Checking the current network Endpoint for the service
```
$ docker service inspect --format={{.Endpoint.VirtualIPs}} testApp
```
#### Removing user defined network myoverlay0 for service testApp
```
$ docker service update --network-rm myoverlay0 testApp
```


# Lab #5: Test Service Discovery
Service Discovery which allows containers on the <b>same network</b> can access each other by name. Service Discovery is achive through Docker’s embedded DNS server(DNS IP 127.0.0.11). Embedded DNS server which provides built-in service discovery for any container created with a <b>valid name</b>(--name) or net-alias(--network-alias) or aliased by link. Service discovery which wont work on default networks.

## Pre-requisite:

## Tested Infrastructure

<table class="tg">
  <tr>
    <th class="tg-yw4l"><b>Platform</b></th>
    <th class="tg-yw4l"><b>Number of Instance</b></th>
    <th class="tg-yw4l"><b>Reading Time</b></th>
    
  </tr>
  <tr>
    <td class="tg-yw4l"><b>Play with Docker</b></td>
    <td class="tg-yw4l"><b>2</b></td>
    <td class="tg-yw4l"><b>10 min</b></td>
    
  </tr>
  
</table>

## Pre-requisite

- Create an account with [DockerHub](https://hub.docker.com)
- Open [PWD](https://labs.play-with-docker.com/) Platform on your browser 
- Click on **Add 

### Testing service discovery in default network
#### Running an nginx server 
```
$ docker container run -d --rm --name default_ntwrk nginx:alpine
```
#### Testing wehther able to resolve using service name
```
$ docker run --rm byrnedo/alpine-curl default_ntwrk
% Total    % Received % Xferd  Average Speed   Time    Time     Time  Current Dload  Upload   Total   Spent    Left  Speed
  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0curl: (6) Could not resolve host: default_ntwrk
```
We are getting error that <b>Could not resolve host: default_ntwrk</b> 

#### Creating a bridge network
```
$ docker network create --driver=bridge --subnet=192.168.1.0/24 --gateway=192.168.1.250 my_bridge
```
#### Running an nginx server in user defined network
```
$ docker container run -d --rm --name usr_ntwrk --network my_bridge nginx:alpine
```
### Testing service discovery in User defined network
```
$ docker run --rm --network my_bridge byrnedo/alpine-curl usr_ntwrk
```
You will be getting nginx homepage on success.

### Testing service discovery in Swarm Mode

#### Creating an nginx service on default overlay(ingress)
```
$ docker service create --name myWeb --replicas 2 --publish 8080:80 nginx:alpine
```
#### Creating another Service myCentos
```
$ docker service create --replicas 2 --name myCentos centos sleep 1d
```
#### Getting container ID of Centos
```
$ docker container ls
```
#### Testing wehther able to resolve using service name from centos
```
$ docker exec -it <Container_ID> curl myWeb
```
You will be getting error <b>curl: (6) Could not resolve host: myWeb; Unknown error</b>

Lets remove the Services
```
$ docker service rm myWeb myCentos
```
#### Create a Overlay network
```
$ docker network create -d overlay --opt encrypted CustomOverlay
```
#### Create nginx service with CustomOverlay network
```
$ docker service create --name myWeb --replicas 2 --publish 8080:80 --network=CustomOverlay  nginx:alpine
```
#### Creating another Service myCentos with CustomOverlay network
```
docker service create --replicas 2 --name myCentos --network=CustomOverlay centos sleep 1d
```
#### Getting container ID of Centos
```
$ docker container ls
```
#### Testing wehther able to resolve using service name from centos
```
$ docker exec -it <Container_ID> curl myWeb
```
Now you will get response of nginx home page 


# Lab #6: Test Routing Mesh

Docker swarm by default use ingress mode layer 4 routing mesh. The routing mesh enables each node in the swarm to accept connections on published ports for any service running in the swarm, even if there’s no task running on the node. You can bypass the routing mesh, using <b>host mode</b> when you create the service. Then you will able to access the service only from the node where task is running.

## Pre-requisite:

## Tested Infrastructure

<table class="tg">
  <tr>
    <th class="tg-yw4l"><b>Platform</b></th>
    <th class="tg-yw4l"><b>Number of Instance</b></th>
    <th class="tg-yw4l"><b>Reading Time</b></th>
    
  </tr>
  <tr>
    <td class="tg-yw4l"><b>Play with Docker</b></td>
    <td class="tg-yw4l"><b>1</b></td>
    <td class="tg-yw4l"><b>5 min</b></td>
    
  </tr>
  
</table>

## Pre-requisite

- Create an account with [DockerHub](https://hub.docker.com)
- Open [PWD](https://labs.play-with-docker.com/) Platform on your browser 
- Click on **Add 

### Create a service in ingress mode
```
$ docker service create --name myWebApp --publish published=80,target=80,mode=ingress nginx:alpine
```
Checking Current PublishMode
```
$ docker service inspect --format "{{json .Endpoint.Ports}}" myWebApp

[{"Protocol":"tcp","TargetPort":80,"PublishedPort":80,"PublishMode":"ingress"}]
```


### Bypass the routing mesh by host Mode
```
$ docker service create --name bypassRM --publish published=8080,target=80,mode=host nginx:alpine
```
Checking Current PublishMode
```
$ docker service inspect --format "{{json .Endpoint.Ports}}" bypassRM

[{"Protocol":"tcp","TargetPort":80,"PublishedPort":8080,"PublishMode":"host"}
```

# Lab #7: Test standalone containers in Overlay Network
The overlay network driver creates a distributed network among multiple Docker daemon hosts and which are used commonly in docker swarm.
In this lab we are going to attach containers in Overlay network make them to communicate with container in another host.

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
    <td class="tg-yw4l"><b>2</b></td>
    <td class="tg-yw4l"><b>5 min</b></td>
    
  </tr>
  
</table>

## Pre-requisite

- Create an account with [DockerHub](https://hub.docker.com)
- Open [PWD](https://labs.play-with-docker.com/) Platform on your browser 
- Click on **Add New Instance** on the left side of the screen to bring up Alpine OS instance on the right side
## Bring up a swarm mode cluster

### Try to attach a container on default docker overlay(ingress) network 
```
$ docker container run --network=ingress -d nginx:alpine
docker: Error response from daemon: Could not attach to network ingress: rpc error: code = PermissionDenied desc = network ingress not manually attachable.
```
We failed to attach, since by default attachable flag is disabled.<br>
To create an overlay network which can be used by swarm services or standalone containers to communicate with other standalone containers running on other Docker daemons, we should add the <b>--attachable</b> flag while creating an overlay network.

### Create an attachable overlay network
```
$ docker network create --driver overlay --attachable myOverlay
```
### Launch a container on Manager node with network myOverlay
```
$ docker container run --network=myOverlay --name=manager-host -d nginx:alpine
```
### Launch a container on Worker node with network myOverlay
```
$ docker container run --network=myOverlay --name=worker-host -d httpd:alpine
```
### Testing able to communicate (From worker Node)
```
$ docker exec -it worker-host sh -c "wget manager-host; cat index.html
```
We will be getting nginx default home page, which the container running on master node.


