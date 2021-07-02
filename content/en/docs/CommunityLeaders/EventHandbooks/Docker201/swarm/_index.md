---
title: "Getting Started with Docker Swarm"
linkTitle: "Getting Started with Docker Swarm"
weight: 97
description: >-
     Page description for Getting Started with Docker Swarm
---

- Docker Swarm is a container orchestration tool built and managed by Docker, Inc. 
- It is the native clustering tool for Docker. 
- Swarm uses the standard Docker API, i.e., containers can be launched using normal docker run commands and Swarm will take care of selecting an appropriate host to run the container on. 
- The tools that use the Docker API—such as Compose and bespoke scripts—can use Swarm without any changes and take advantage of running on a cluster rather than a single host.

![My image](https://raw.githubusercontent.com/collabnix/dockerlabs/master/intermediate/swarm/swarm-orchestration.png)


# But why do we need Container orchestration System?

Imagine that you had to run hundreds of containers. You can easily see that if they are running in a distributed mode, there are multiple features that you will need from a management angle to make sure that the cluster is up and running, is healthy and
more.

Some of these necessary features include:

● Health Checks on the Containers <br>
● Launching a fixed set of Containers for a particular Docker image<br>
● Scaling the number of Containers up and down depending on the load<br>
● Performing rolling update of software across containers<br>
● and more…<br>

Docker Swarm has capabilities to help us implement all those great features - all through simple CLIs.


# Does Docker Swarm require 3rd Party tool to be installed?

Docker Swarm Mode comes integrated with Docker Platform. Starting 1.12, Docker Swarm Mode is rightly integrated which means that you don't need to install anything outside to run Docker Swarm. Just initialize it and you can get started.

# Does Docker Swarm work with Docker Machine & Docker Compose?

Yes, it works very well with the Docker command line tools like docker and docker-machine, and provides the basic ability to deploy a Docker container to a collection of machines running the Docker Engine. Docker Swarm does differ in scope, however, from what we saw when reviewing Amazon ECS.

# How does Swarm Cluster look like?

![My image](https://raw.githubusercontent.com/collabnix/dockerlabs/master/intermediate/swarm/swarm-arch.png)

The basic architecture of Swarm is fairly straightforward: each host runs a Swarm agent and one host runs a Swarm manager (on small test clusters this host may also run an agent). The manager is responsible for the orchestration and scheduling of containers on the hosts. Swarm can be run in a high-availability mode where one of etcd, Consul or ZooKeeper is used to handle fail-over to a back-up manager. There are several different methods for how hosts are found and added to a cluster, which is known as discovery in Swarm. By default, token based discovery is used, where the addresses of hosts are kept in a list stored on the Docker Hub.


A swarm is a group of machines that are running Docker and joined into a cluster. After that has happened, we continue to run the Docker commands we’re used to, but now they are executed on a cluster by a swarm manager. The machines in a swarm can be physical or virtual. After joining a swarm, they are referred to as nodes.

Swarm managers are the only machines in a swarm that can execute your commands, or authorize other machines to join the swarm as workers. Workers are just there to provide capacity and do not have the authority to tell any other machine what it can and cannot do.

Up until now, you have been using Docker in a single-host mode on your local machine. But Docker also can be switched into swarm mode, and that’s what enables the use of swarms. Enabling swarm mode instantly makes the current machine a swarm manager. From then on, Docker runs the commands you execute on the swarm you’re managing, rather than just on the current machine.

Swarm managers can use several strategies to run containers, such as “emptiest node” -- which fills the least utilized machines with containers. Or “global”, which ensures that each machine gets exactly one instance of the specified container. 

A swarm is made up of multiple nodes, which can be either physical or virtual machines. The basic concept is simple enough: run docker swarm init to enable swarm mode and make our current machine a swarm manager, then run docker swarm join on other machines to have them join the swarm as workers. 


## Getting Started with Docker Swarm

To get started with Docker Swarm, you can use "Play with Docker", aka PWD. 
It's free of cost and open for all.
You get maximum of 5 instances of Linux system to play around with Docker.

- Open [Play with Docker labs](https://labs.play-with-docker.com) on your browser

- Click on Icon near to Instance to choose 3 Managers & 2 Worker Nodes

![My image](https://raw.githubusercontent.com/collabnix/dockerlabs/master/images/pwd_1.png)

- Wait for few seconds to bring up 5-Node Swarm Cluster

We recommend you start with one of our Beginners Guides, and then move to intermediate and expert level tutorials that cover most of the features of Docker. For a comprehensive approach to understanding Docker, I have categorized it as shown below:

# A Bonus... Docker Swarm Visualizer

Swarm Visualizer is a fancy tool which visualized the Swarm Cluster setup. It displays containers running on each node in the form of visuals. If you are conducting Docker workshop, it's a perfect way to show your audience how the containers are placed under each node. Go..try it out..

## Clone the Repository

```docker
git clone https://github.com/dockersamples/docker-swarm-visualizer
```

```docker
cd docker-swarm-visualizer
docker-compose up -d
```

![My image](https://raw.githubusercontent.com/collabnix/dockerlabs/master/images/visualizer.png)

To run in a docker swarm:

```docker
$ docker service create \
  --name=viz \
  --publish=8080:8080/tcp \
  --constraint=node.role==manager \
  --mount=type=bind,src=/var/run/docker.sock,dst=/var/run/docker.sock \
  dockersamples/visualizer
```


# Lab01 - Create Overlay Network under Docker Swarm

The overlay network is used to enable containers on different hosts to communicate. Under this lab exercise, we will see how to create Overlay network.

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
    <td class="tg-yw4l"><b>5</b></td>
    <td class="tg-yw4l"><b>5 min</b></td>
    
  </tr>
  
</table>

## Pre-requisite

- Create an account with [DockerHub](https://hub.docker.com)
- Open [PWD](https://labs.play-with-docker.com/) Platform on your browser 
- Create 5 Node Instances by clicking on "hammer" sign on the left side of the UI interface

The following command will create a new overlay network called collabnet. All containers registered to this network can communicate with 
each other, regardless of which node they are deployed onto.

```
docker network create -d overlay collabnet
```

## Displaying the overlay network

```
docker network ls
```

## Inspecting the overlay network

```
docker network inspect collabnet
```


# Lab2 - Deploy Service

By default, Docker uses a spread replication model for deciding which containers should run on which hosts. 
The spread approach ensures that containers are deployed across the cluster evenly. This means that if one of the nodes is removed from 
the cluster,  the instances would be already running on the other nodes. There workload on the removed node would be rescheduled across 
the remaining available nodes.

A new concept of Services is used to run containers across the cluster. This is a higher-level concept than containers.
A service allows you to define how applications should be deployed at scale. By updating the service, Docker updates the container 
required in a managed way.

## Task

In this case, we are deploying the Docker Image ajeetraina/hellowhale. We are defining a friendly name of a service called 
http and that it should be attached to the newly created collabnet network.

For ensuring replication and availability, we are running two instances, of replicas, of the container across our cluster.

Finally, we load balance these two containers together on port 80. Sending an HTTP request to any of the nodes in the cluster will process the request by one of the containers within the cluster.
The node which accepted the request might not be the node where the container responds. Instead, Docker load-balances requests across all available containers.

```
docker service create --name http --network collabnet --replicas 2 -p 80:80 ajeetraina/hellowhale
```

You can view the services running on the cluster using the CLI command docker service ls

As containers are started you will see them using the ps command. You should see one instance of the container on each host.

List containers on the first host - 

```
docker ps
```

List containers on the second host - 

```
docker ps
```

If we issue an HTTP request to the public port, it will be processed by the two containers  

```
 curl your_machine_ip:80
```

# Lab03 - Inspecting State

The Service concept allows you to inspect the health and state of your cluster and the running applications.

## Task

You can view the list of all the tasks associated with a service across the cluster. 
In this case, each task is a container, 

```
docker service ps http
```

You can view the details and configuration of a service via 

```
docker service inspect --pretty http
```

On each node, you can ask what tasks it is currently running. Self refers to the manager node Leader: 

```
docker node ps self
```

Using the ID of a node you can query individual hosts 

```
docker node ps $(docker node ls -q | head -n1)
```

In the next step, we will scale the service to run more instances of the container.

# Lab4 - Scale Service

A Service allows us to scale how many instances of a task is running across the cluster. 
As it understands how to launch containers and which containers are running, it can easily start, or remove, containers as required. 
At the moment the scaling is manual. However, the API could be hooked up to an external system such as a metrics dashboard.

# Task

At present, we have two load-balanced containers running, which are processing our requests curl docker

The command below will scale our http service to be running across five containers.

```
docker service scale http=5
```

```
 docker service scale http=5
http scaled to 5
overall progress: 5 out of 5 tasks
1/5: running   [==================================================>]
2/5: running   [==================================================>]
3/5: running   [==================================================>]
4/5: running   [==================================================>]
5/5: running   [==================================================>]
verify: Waiting 4 seconds to verify that tasks are stable...
verify: Service converged
[manager1] (local) root@192.168.0.4 ~
$
[manager1] (local) root@192.168.0.4 ~
```

On each host, you will see additional nodes being started docker ps

The load balancer will automatically be updated. Requests will now be processed across the new containers. 
Try issuing more commands via 

```
curl your_machine_ip:80
```

Try scaling the service down to see the result.

```
docker service scale http=2
```

# Lab #5 - Deploy the application components as Docker services

Our sleep application is becoming very popular on the internet (due to hitting Reddit and HN). 
People just love it. So, you are going to have to scale your application to meet peak demand. 
You will have to do this across multiple hosts for high availability too. 
We will use the concept of Services to scale our application easily and manage many containers as a single entity.

Services were a new concept in Docker 1.12. They work with swarms and are intended for long-running containers.

Let’s deploy sleep as a Service across our Docker Swarm.



```
$ docker service create --name sleep-app ubuntu sleep infinity
k70j90k9cp5n2bxsq72tjdmxs
overall progress: 1 out of 1 tasks
1/1: running
verify: Service converged
```

Verify that the service create has been received by the Swarm manager.

```
$ docker service ls
ID                  NAME                MODE                REPLICAS            IMAGE
     PORTS
k70j90k9cp5n        sleep-app           replicated          1/1                 ubuntu:latest

```

The state of the service may change a couple times until it is running. The image is being downloaded from Docker Store to the other engines in the Swarm. Once the image is downloaded the container goes into a running state on one of the three nodes.

At this point it may not seem that we have done anything very differently than just running a docker run. We have again deployed a single container on a single host. The difference here is that the container has been scheduled on a swarm cluster.

Well done. You have deployed the sleep-app to your new Swarm using Docker services.


# Scaling the Application

Demand is crazy! Everybody loves your sleep app! It’s time to scale out.

One of the great things about services is that you can scale them up and down to meet demand. In this step you’ll scale the service up and then back down.

You will perform the following procedure from node1.

Scale the number of containers in the sleep-app service to 7 with the docker service update --replicas 7 sleep-app command. Replicas is the term we use to describe identical containers providing the same service.

```
$ docker service update --replicas 7 sleep-app
sleep-app
overall progress: 7 out of 7 tasks
1/7: running
2/7: running
3/7: running
4/7: running
5/7: running
6/7: running
7/7: running
verify: Service converged
```

```
$ docker service ls
ID                  NAME                MODE                REPLICAS            IMAGE     PORTS
k70j90k9cp5n        sleep-app           replicated          7/7                 ubuntu:latest
```

The Swarm manager schedules so that there are 7 sleep-app containers in the cluster. These will be scheduled evenly across the Swarm members.

We are going to use the docker service ps sleep-app command. If you do this quick enough after using the --replicas option you can see the containers come up in real time.

```
$ docker service ps sleep-app
ID                  NAME                IMAGE               NODE                DESIRED STATE     CURRENT STATE                ERROR               PORTS
bv6ofc6x6moq        sleep-app.1         ubuntu:latest       manager1            Running     Running 6 minutes ago
5gj1ql7sjt14        sleep-app.2         ubuntu:latest       manager2            Running     Running about a minute ago
p01z0tchepwa        sleep-app.3         ubuntu:latest       worker2             Running     Running about a minute ago
x3kwnjcwxnb0        sleep-app.4         ubuntu:latest       worker2             Running     Running about a minute ago
c98vxyeefmru        sleep-app.5         ubuntu:latest       manager1            Running     Running about a minute ago
kwmey288bkhp        sleep-app.6         ubuntu:latest       manager3            Running     Running about a minute ago
vu78hp6bhauq        sleep-app.7         ubuntu:latest       worker1             Running     Running about a minute ago
```

Notice that there are now 7 containers listed. It may take a few seconds for the new containers in the service to all show as RUNNING. The NODE column tells us on which node a container is running.

Scale the service back down to just four containers with the docker service update --replicas 4 sleep-app command.

```
$ docker service update --replicas 4 sleep-app
sleep-app
overall progress: 4 out of 4 tasks
1/4: running
2/4: running
3/4: running
4/4: running
verify: Service converged
```

```
[manager1] (local) root@192.168.0.9 ~/dockerlabs/intermediate/swarm
$ docker service ps sleep-app
ID                  NAME                IMAGE               NODE                DESIRED STATE     CURRENT STATE           ERROR               PORTS
bv6ofc6x6moq        sleep-app.1         ubuntu:latest       manager1            Running     Running 7 minutes ago
5gj1ql7sjt14        sleep-app.2         ubuntu:latest       manager2            Running     Running 2 minutes ago
p01z0tchepwa        sleep-app.3         ubuntu:latest       worker2             Running     Running 2 minutes ago
kwmey288bkhp        sleep-app.6         ubuntu:latest       manager3            Running     Running 2 minutes ago
```

You have successfully scaled a swarm service up and down.


# Lab6 - Drain a node and reschedule the containers

Your sleep-app has been doing amazing after hitting Reddit and HN. It’s now number 1 on the App Store! You have scaled up during the holidays and down during the slow season. Now you are doing maintenance on one of your servers so you will need to gracefully take a server out of the swarm without interrupting service to your customers.

Take a look at the status of your nodes again by running docker node ls on node1.

```
$ docker node ls
ID                            HOSTNAME            STATUS              AVAILABILITY        MANAGER STATUS      ENGINE VERSION
swfk8vsyfe4z2zbtianz5gh2p *   manager1            Ready               Active              Leader              18.09.3
sgyr3vxu1n99vyce9al67alwt     manager2            Ready               Active              Reachable           18.09.3
ud3ghz1zlrmn3fbv9j930ldja     manager3            Ready               Active              Reachable           18.09.3
v57fk367d1lw4e1ufis3jwa2h     worker1             Ready               Active               18.09.3
uinkvr56fq7zb711ycbifhf4f     worker2             Ready               Active               18.09.3
```

You will be taking worker2 out of service for maintenance.

Let’s see the containers that you have running on worker2.

We are going to take the ID for worker2 and run docker node update --availability drain worker2. 
We are using the worker2 host ID as input into our drain command. Replace yournodeid with the id of worker2.

```
$ docker node update --availability drain worker2
worker2
```

```
$ docker node ls
ID                            HOSTNAME            STATUS              AVAILABILITY        MANAGER STATUS      ENGINE VERSION
swfk8vsyfe4z2zbtianz5gh2p *   manager1            Ready               Active              Leader              18.09.3
sgyr3vxu1n99vyce9al67alwt     manager2            Ready               Active              Reachable           18.09.3
ud3ghz1zlrmn3fbv9j930ldja     manager3            Ready               Active              Reachable           18.09.3
v57fk367d1lw4e1ufis3jwa2h     worker1             Ready               Active               18.09.3
uinkvr56fq7zb711ycbifhf4f     worker2             Ready               Drain
```


Node worker2 is now in the Drain state.

Switch back to node2 and see what is running there by running docker ps.

```
$ docker ps
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS     PORTS               NAMES
```

worker2 does not have any containers running on it.

Lastly, check the service again on node1 to make sure that the container were rescheduled. 
You should see all four containers running on the remaining two nodes.

```
$ docker service ps sleep-app
ID                  NAME                IMAGE               NODE                DESIRED STATE     CURRENT STATE            ERROR               PORTS
bv6ofc6x6moq        sleep-app.1         ubuntu:latest       manager1            Running     Running 18 minutes ago
5gj1ql7sjt14        sleep-app.2         ubuntu:latest       manager2            Running     Running 12 minutes ago
5aqy7jv9ojmn        sleep-app.3         ubuntu:latest       worker1             Running     Running 3 minutes ago
p01z0tchepwa         \_ sleep-app.3     ubuntu:latest       worker2             Shutdown     Shutdown 3 minutes ago
kwmey288bkhp        sleep-app.6         ubuntu:latest       manager3            Running     Running 12 minutes ago
```

```
[manager1] (local) root@192.168.0.9 ~/dockerlabs/intermediate/swarm
$ docker node inspect --pretty worker2
ID:                     uinkvr56fq7zb711ycbifhf4f
Hostname:               worker2
Joined at:              2019-03-08 15:12:03.102015148 +0000 utc
Status:
 State:                 Ready
 Availability:          Drain
 Address:               192.168.0.10
Platform:
 Operating System:      linux
 Architecture:          x86_64
Resources:
 CPUs:                  8
 Memory:                31.4GiB
Plugins:
 Log:           awslogs, fluentd, gcplogs, gelf, journald, json-file, local, logentries, splunk
, syslog
 Network:               bridge, host, ipvlan, macvlan, null, overlay
 Volume:                local
Engine Version:         18.09.3
TLS Info:
 TrustRoot:
-----BEGIN CERTIFICATE-----
MIIBajCCARCgAwIBAgIUcfR/4dysEv9qsbuPTFuIn00WbmowCgYIKoZIzj0EAwIw
EzERMA8GA1UEAxMIc3dhcm0tY2EwHhcNMTkwMzA4MTUwNzAwWhcNMzkwMzAzMTUw
NzAwWjATMREwDwYDVQQDEwhzd2FybS1jYTBZMBMGByqGSM49AgEGCCqGSM49AwEH
A0IABPo7tm+Vxk+CIw9AJEGTlyW/JPotQuVqrbvi34fuK6Ak4cWYU6T1WSiJMHI0
nEGS/1zFIWQzJY0WQbT8eMaqX4ijQjBAMA4GA1UdDwEB/wQEAwIBBjAPBgNVHRMB
Af8EBTADAQH/MB0GA1UdDgQWBBQ6OEYmo8HUfpFnSxJDHWkjf/wWmTAKBggqhkjO
PQQDAgNIADBFAiBy39e7JLpHBH0bONWU8rQZPmY2dtkfHjPOUQNLFBdlkAIhAIpD
Lb6ZrhbEJDcIhlnozKRcPSJi7RWy4/16THIUJdpM
-----END CERTIFICATE-----

 Issuer Subject:        MBMxETAPBgNVBAMTCHN3YXJtLWNh
 Issuer Public Key:     MFkwEwYHKoZIzj0CAQYIKoZIzj0DAQcDQgAE+ju2b5XGT4IjD0AkQZOXJb8k+i1C5Wqtu+Lfh+4roCThxZhTpPVZKIkwcjScQZL/XMUhZDMljRZBtPx4xqpfiA==
 ```
 
 Run docker node update --availability active <NODE-ID> to return the drained node to an active state:
 
 ```
 $ docker node update --availability active worker2
worker2
[manager1] (local) root@192.168.0.9 ~/dockerlabs/intermediate/swarm
$ docker node inspect --pretty worker2
ID:                     uinkvr56fq7zb711ycbifhf4f
Hostname:               worker2
Joined at:              2019-03-08 15:12:03.102015148 +0000 utc
Status:
 State:                 Ready
 Availability:          Active
 Address:               192.168.0.10
Platform:
 Operating System:      linux
 Architecture:          x86_64
Resources:
 CPUs:                  8
 Memory:                31.4GiB
Plugins:
 Log:           awslogs, fluentd, gcplogs, gelf, journald, json-file, local, logentries, splunk, syslog
 Network:               bridge, host, ipvlan, macvlan, null, overlay
 Volume:                local
Engine Version:         18.09.3
TLS Info:
 TrustRoot:
-----BEGIN CERTIFICATE-----
MIIBajCCARCgAwIBAgIUcfR/4dysEv9qsbuPTFuIn00WbmowCgYIKoZIzj0EAwIw
EzERMA8GA1UEAxMIc3dhcm0tY2EwHhcNMTkwMzA4MTUwNzAwWhcNMzkwMzAzMTUw
NzAwWjATMREwDwYDVQQDEwhzd2FybS1jYTBZMBMGByqGSM49AgEGCCqGSM49AwEH
A0IABPo7tm+Vxk+CIw9AJEGTlyW/JPotQuVqrbvi34fuK6Ak4cWYU6T1WSiJMHI0
nEGS/1zFIWQzJY0WQbT8eMaqX4ijQjBAMA4GA1UdDwEB/wQEAwIBBjAPBgNVHRMB
Af8EBTADAQH/MB0GA1UdDgQWBBQ6OEYmo8HUfpFnSxJDHWkjf/wWmTAKBggqhkjO
PQQDAgNIADBFAiBy39e7JLpHBH0bONWU8rQZPmY2dtkfHjPOUQNLFBdlkAIhAIpD
Lb6ZrhbEJDcIhlnozKRcPSJi7RWy4/16THIUJdpM
-----END CERTIFICATE-----

 Issuer Subject:        MBMxETAPBgNVBAMTCHN3YXJtLWNh
 Issuer Public Key:     MFkwEwYHKoZIzj0CAQYIKoZIzj0DAQcDQgAE+ju2b5XGT4IjD0AkQZOXJb8k+i1C5Wqtu+Lfh+4roCThxZhTpPVZKIkwcjScQZL/XMUhZDMljRZBtPx4xqpfiA==
 ```
     
     
 # Lab7 - Cleaning Up

Execute the docker service rm sleep-app command on manager1 to remove the service called sleep-app.

```
$ docker service rm sleep-app
sleep-app
[manager1] (local) root@192.168.0.9 ~/dockerlabs/intermediate/swarm
$ docker service ls
ID                  NAME                MODE                REPLICAS            IMAGE     PORTS
```

Execute the docker ps command on node1 to get a list of running containers.

```
docker ps
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
044bea1c2277        ubuntu              "sleep infinity"    17 minutes ago      17 minutes ag                           distracted_mayer
```


You can use the docker kill <CONTAINER ID> command on node1 to kill the sleep container we started at the beginning.

```
docker kill yourcontainerid
```

Finally, let’s remove node1, node2, and node3 from the Swarm. We can use the docker swarm leave --force command to do that.

Lets run docker swarm leave --force on all the nodes to leave swarm cluster.

```
docker swarm leave --force
```

Congratulations! You’ve completed this lab. You now know how to build a swarm, deploy applications as collections of services, and scale individual services up and down.
