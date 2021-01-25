---
title: "JAVA"
linkTitle: "JAVA"
weight: 40
description: >-
     Docker Workshop for JAVA Developers
---


## What is this handbook for?

This is a community leader handbook to run "Dockerizing Your Application for JAVA" workshop. This will cover every aspect of conducting workshop starting from setting up an event page till the completion of the successful workshop. 

### Features of this workshop

- Audience : 5 to 100
- Technical Skills Required : Basic knowledge of Linux & JAVA
- Length : 8 hours (including coffe and lunch breaks)


## Checklists 

### Before the workshop

S.No. | Name of Objectives | Status | 
:------------ | :-------------| :-------------|
1 | [Getting Familiar with Bevy Virtual](#getting-familiar-with-bevy-virtual) |  ☑️ |
2 | [Planning an Event Agenda](#planning-an-event-agenda) |  ☑️ |
3 | [Setting up Event Registration Page](#setting-up-event-registration-page) | ☑️ |
4 | [Sending confirmation email for workshop](#sending-confirmation-email-for-workshop) |  ☑️ |

### During the workshop

S.No. | Name of Objectives | Status | 
:------------ | :-------------| :-------------|
5 | [Conducting Attendee Survey](#conducting-attendee-survey) |  ☑️ |

### After the workshop

S.No. | Name of Objectives | Status | 
:------------ | :-------------| :-------------|
6 | [Post-Event FollowUp](#post-event-followup) |  ☑️ |
7 | [Community Leader Survey](#community-leader-survey)  |  ☑️ |
8 | [Attendee Survey](#attendee-survey)  |  ☑️ |

## Recommended Agenda


| Description | Timing |
| --- | --- |
| Welcome | 8:45 AM to 9:00 AM |
| [Setting up Infrastructure](#setting-up-infrastructure---30-min) | 9:00 AM to 9:30 AM |
| [Basics of Docker](#basics-of-docker---30-min) | 9:30 AM to 10:30 AM |
| [Building a Docker Image](#building-and-running-a-docker-container---1-hour) | 10:30 AM to 11:30 AM |
| Coffee/Tea Break | 11:30 AM to 11:45 AM |
| [Multi-container Application using Docker Compose](#multi-container-application-using-docker-compose---1-hour) | 11:45 PM to 1:00 PM|
| Lunch | 1:00 PM to 2:00 PM |
| [Deploy Application using Docker Swarm Mode](#deploy-application-using-docker-swarm-mode---1-hour) | 2:00 PM to 2:30 PM |
| [Docker & Netbeans](#docker--netbeans--1-hour) | 2:30 PM to 3:30 PM |
| Coffee/Tea Break | 3:30 PM to 3:45 PM |
| [Docker & IntelliJ](#docker-and-intellij-idea---1-hour) | 3:45 PM to 4:45 PM |




## Pre-requisite:

### [Setting up Infrastructure](#setting-up-infrastructure) - 30 min

- [Setup a Docker Environment](#setup-a-docker-environment)



### [Basics of Docker](#basics-of-docker) - 30 min
- [Main Components of Docker System](#main-components-of-docker-system)
- [Test Your Knowledge](#test-your-knowledge-quiz1)



### [Building and Running a Docker Container](#building-and-running-a-docker-container) - 1 hour
 - [Build a Docker Image](#build-a-docker-image)
 - [Running a Docker Container](#run-a-docker-container)
 - [Running a JAVA 11 Docker Container](#run-a-JAVA11-Docker-Container)



### [Multi-Container Application using Docker Compose](#multi-container-application-using-docker-compose) - 1 hour
- [What is Docker Compose](#what-is-docker-compose)
- [Configuration file](#configuration-file)
- [Start application](#start-application)
- [Verify application](#verify-application)
- [Shutdown application](#shutdown-application)

### [Deploy Application using Docker Swarm Mode](#deploy-application-using-docker-swarm-mode) - 1 hour
- [Initialize Swarm](#initialize-swarm)
- [Multi-container application](#multi-container-application)
- [Verify service and containers in application](#verify-service-and-containers-in-application)
- [Access application](#access-application)
- [Stop application](#stop-application)
- [Remove application completely](#remove-application-completely)



### [Docker & Netbeans](#docker-and-netbeans)- 1 hour
- [Configure Docker Host](#configure-docker-host)
- [Pull an Image](#pull-an-image)
- [Run a Container](#run-a-container)
- [Build an Image](#build-an-image)
 


### [Docker and IntelliJ IDEA](#docker-and-intelliJ) - 1 hour
- [Install Docker Plugin in IDEA](#install-docker-plugin-in-idea)
- [Pull an Image](#pull-an-image)
- [Run a Container](#run-a-container)
- [Build an Image](#build-an-image)


### [Docker & Eclipse](#docker-and-eclipse) - 1 hour
- [Install Docker Tooling in Eclipse](#install-docker-tooling-in-eclipse)
- [Docker Perspective and View](#docker-perspective-and-view)
- [Pull an Image](#pull-an-image)
- [Run a Container](#run-a-container)
- [Build an Image](#build-an-image)


## Getting Familiar with Bevy Virtual

Docker community leaders uses Bevy (https://events.docker.com) tool to conduct virtual Meetup events. Bevy is the tool that provides the MOST features to your Community, including:

- 2 way integration with Meetup.com (create your event in Bevy and it posts to your meetup page and RSVPs from your event on meetup sync with your Bevy events.docker.com page).
Note: The RSVP limits you set in Bevy do not translate to meetup. The best way to handle this is to keep a watchful eye on both platforms or communicate that seats are first come first serve. 

- Ability to check in guests.
- Mobile App
- RSVP as Guest
- Forms / Surveys
- Automatic Emails (customizable) 

It's important for all community leaders to be familiar with this tool to conduct virtual events successfully.


### Chapters | Events |  Analytics


- [Create a Chapter](https://help.bevylabs.com/article/454-create-a-chapter)
- [Create a new event](https://help.bevylabs.com/article/344-create-a-new-event)
- [Virtual Event Type](https://help.bevylabs.com/article/428-virtual-event-type)
- [Manage chapter members](https://help.bevylabs.com/article/389-manage-chapter-members)



### Bevy Virtual 

- [Using Bevy Virtual](https://help.bevylabs.com/article/457-using-bevy-virtual)
- [How to create a test event in Bevy Virtual](https://help.bevylabs.com/article/496-test-event-in-bevy-virtual)
- [Record in Bevy Virtual](https://help.bevylabs.com/article/470-record-in-bevy-virtual)
- [Screensharing in Bevy Virtual](https://help.bevylabs.com/article/492-screensharing-in-bevy-virtual)
- [Breakout Rooms](https://help.bevylabs.com/article/495-breakout-rooms)
- [Chat, DM's & Features](https://help.bevylabs.com/article/519-chat-features)


## Planning an Event Agenda

- Your event must be posted on your [city’s Chapter page](https://events.docker.com/chapters/)
- Try to create event 1 month before the event
- If you are unsure of how to use your chapter page [please watch this video](https://drive.google.com/file/d/1ld54sqzTTBMiygUzsjRD7B10XzWozbMl/view?usp=sharing)
- If you are having issues with your page, do not have a page or need admin permissions please contact William over Docker community Slack or send email to william.quiviger(AT)docker.com


## Setting up Event Registration Page

Every Community leader is expected to set up event registration page. While building an event registration page, ensure that the below list of information are captured:

- Title of the workshop
- Date of the workshop
- Short Description of the workshop
- Format of the workshop(whether it will be LIVE or recorded)
- Level of the audience(Beginners/Intermediate/Advanced)
- Name of the speakers
- A Form which ask users to supply:
   - First Name
   - Last Name
   - Email Address
   - Company Name
   - Job Function
   - Country
   
## Sending confirmation email for workshop

Once the user register for the event, Community Leaders need to ensure that the interested users should receive a confirmation email.

- A Thank you message for registering for this event 
- Ensure that the registered user should be able to add the events date to their calendar
- The email should carry workshop title and date of the workshop
- Gentle reminder as the date of workshop come closer

### Sample Confirmation email for the workshop

## Post-Event Followup

### #1  Send a Thank You email 

S.No. | Name of Objectives | Status | 
:------------ | :-------------| :-------------|
1 | “Thank you for attending” post on the social media channels |  ☑️ |
2 | "Thank you" email to all those who registered and attended the event |  ☑️ |
3 | Share the pics you took during the event and share it on social media(LinkedIn, Twitter, Facebook Public Docker Group etc |  ☑️ |
4 | Send thanks email to sponsor/vendors if this workshop is part of the Meetup event. |  ☑️ |
5 | Thank core team and volunteers who helped you with the workshop |  ☑️ |


### #2 Post-event Review

S.No. | Name of Objectives | Status | 
:------------ | :-------------| :-------------|
1 | Sit down with your team for a debrief session where you discuss how the event went |  ☑️ |
2 | Consider inviting at least some of the volunteers.  |  ☑️ |
3 | Evaluate whether the event was a success according to whatever goals you’ve set |  ☑️ |
4 | Have an open discussion about what worked well and what could be done better the next time around. |  ☑️ |
5 | Sit down with your team for a debrief session where you discuss how the event went |  ☑️ |



### #3 Ask for feedback

S.No. | Name of Objectives | Status | 
:------------ | :-------------| :-------------|
1 | While the event is still fresh in everyone’s mind, get their feedback about it. |  ☑️ |
2 | Be straightforward. Collect input is to send out an email link to a survey that people can fill out online.  |  ☑️ |
3 | Pick the one you like. If you can, add an incentive (free tickets to your next events, chance to win a gift card, and the like.).  |  ☑️ |
4 | Having everyone fill out the same survey makes it easy to compare their input and spot trends and areas that need improvement.   |  ☑️ |


### #4  Follow up on social media

S.No. | Name of Objectives | Status | 
:------------ | :-------------| :-------------|
1 |Online chatter about your event won’t immediately quiet down after the event is over. |  ☑️ |
2 |Follow the conversation and jump in where it make sense to chip in with your input, thank the guests, or answer questions.  |  ☑️ |
3 |Engaging in post-event social media chatter and keeping the buzz going will also help you build audience for your next event.  |  ☑️ |
4 |Online chatter about your event won’t immediately quiet down after the event is over. |  ☑️ |



### #5 Start planning your next event

S.No. | Name of Objectives | Status | 
:------------ | :-------------| :-------------|
1 |Start putting all of that to good use and begin jotting down ideas for your next fantastic event |  ☑️ |


## Setup a Docker Environment

This section describes the hardware and software needed for this workshop, and how to configure them.
This workshop is designed for a BYOL (Bring Your Own Laptop) style hands-on-lab.

### Hardware & Software

- Memory: At least 4 GB+, strongly preferred 8 GB
- Operating System: Mac OS X (10.15.7+), Windows 10 Pro+ 64-bit, Ubuntu 20.04+, CentOS 7/8+.

_NOTE_: An older version of the operating system may be used.
The installation instructions would differ slightly in that case and are explained in the next section.



### Install Docker

Docker runs natively on Mac, Windows and Linux.


S.No. | OS Environment | Link to Follow | 
:------------ | :-------------| :-------------|
1 | MacOS |  [Link](https://www.docker.com/products/docker-desktop)  |
2 | Windows |  [Link](https://www.docker.com/products/docker-desktop)  |
3 | Linux |  [Link](https://hub.docker.com/search?q=&type=edition&offering=community&operating_system=linux)  |

Most of the labs tutorials have been tested on Docker Desktop for Mac.

_NOTE_: Docker requires a fairly recent operating system version.



### Download Images

This tutorial uses a few Docker images and software.
Let's download them before we start the tutorial.

Download the file from [docker-compose-pull-images.yml](https://raw.githubusercontent.com/docker/labs/master/developer-tools/java/scripts/docker-compose-pull-images.yml) and use the following command to pull the required images:

```
curl -O https://raw.githubusercontent.com/docker/labs/master/developer-tools/java/scripts/docker-compose-pull-images.yml
docker-compose -f docker-compose-pull-images.yml pull --parallel
```

_NOTE_: For Linux, `docker-compose` and `docker` commands need `sudo` access.
So prefix all commands with `sudo`.

### Other Software

The software in this section is specific to certain parts of the workshop.
Install them only if you plan to attempt them.

S.No. | Name of Software | Link to Follow | 
:------------ | :-------------| :-------------|
1 | Git|  [Link](https://git-scm.com) |


- Download and install Java IDE of your choice:

S.No. | Name of Software | Link to Follow | 
:------------ | :-------------| :-------------|
1 |  NetBeans 12.2 `Java SE` version | [Link](https://netbeans.apache.org/download/index.html)  |
2 |  IntelliJ IDEA Community or Ultimate | [Link](https://www.jetbrains.com/idea/download/#section=mac)  |
3 |  Eclipse IDE for Java EE Developers | [Link](https://www.eclipse.org/downloads/packages/)  |
4 |  Apache Maven 3.6.3 | [Link](https://maven.apache.org/download.cgi)  |
5 |  JDK 15 for Linux x64 | [Link](https://download.java.net/java/GA/jdk15.0.1/51f4f36ad4ef43e39d0dfdbaf6549e32/9/GPL/openjdk-15.0.1_linux-x64_bin.tar.gz)  |


##  Basics of Docker

This section introduces the basic terminology of Docker.


Docker is a platform for developers and sysadmins to build, ship, and run applications. Docker lets you quickly assemble applications from components and eliminates the friction that can come when shipping code. Docker lets you test and deploy your code into production as fast as possible.

Docker simplifies software delivery by making it easy to build and share images that contain your application’s entire environment, or _application operating system_.

## What does it mean by an application operating system ?

Your application typically requires specific versions for your operating system, application server, JDK, and database server, may require to tune the configuration files, and similarly multiple other dependencies. The application may need binding to specific ports and certain amount of memory. The components and configuration together required to run your application is what is referred to as application operating system.

You can certainly provide an installation script that will download and install these components. Docker simplifies this process by allowing to create an image that contains your application and infrastructure together, managed as one component. These images are then used to create Docker containers which run on the container virtualization platform, provided by Docker.

## Main Components of Docker System

Docker has three main components:

- Images are the *build component* of Docker and are the read-only templates defining an application operating system.
- Containers are the *run component* of Docker and created from images. Containers can be run, started, stopped, moved, and deleted.
- Images are stored, shared, and managed in a registry and are the *distribution component* of Docker. 
- DockerHub is a publicly available registry and is available at http://hub.docker.com.

In order for these three components to work together, the *Docker Daemon* (or Docker Engine) runs on a host machine and does the heavy lifting of building, running, and distributing Docker containers. In addition, the *Client* is a Docker binary which accepts commands from the user and communicates back and forth with the Engine.

![My Image](docker-architecture.png)


The Client communicates with the Engine that is either co-located on the same host or on a different host. Client uses the `pull` command to request the Engine to pull an image from the registry. The Engine then downloads the image from Docker Store, or whichever registry is configured. Multiple images can be downloaded from the registry and installed on the Engine. Client uses the `run` run the container.

## Docker Image

We've already seen that Docker images are read-only templates from which Docker containers are launched. Each image consists of a series of layers. Docker makes use of union file systems to combine these layers into a single image. Union file systems allow files and directories of separate file systems, known as branches, to be transparently overlaid, forming a single coherent file system.

One of the reasons Docker is so lightweight is because of these layers. When you change a Docker image—for example, update an application to a new version— a new layer gets built. Thus, rather than replacing the whole image or entirely rebuilding, as you may do with a virtual machine, only that layer is added or updated. Now you don't need to distribute a whole new image, just the update, making distributing Docker images faster and simpler.

Every image starts from a base image, for example `ubuntu`, a base Ubuntu image, or `fedora`, a base Fedora image. You can also use images of your own as the basis for a new image, for example if you have a base Apache image you could use this as the base of all your web application images.

NOTE: By default, Docker obtains these base images from Docker Store.

Docker images are then built from these base images using a simple, descriptive set of steps we call instructions. Each instruction creates a new layer in our image. Instructions include actions like:

. Run a command
. Add a file or directory
. Create an environment variable
. Run a process when launching a container

These instructions are stored in a file called a Dockerfile. Docker reads this Dockerfile when you request a build of an image, executes the instructions, and returns a final image.

## Docker Container

A container consists of an operating system, user-added files, and meta-data. As we've seen, each container is built from an image. That image tells Docker what the container holds, what process to run when the container is launched, and a variety of other configuration data. The Docker image is read-only. When Docker runs a container from an image, it adds a read-write layer on top of the image (using a union file system as we saw earlier) in which your application can then run.

## Docker Engine

Docker Host is created as part of installing Docker on your machine. Once your Docker host has been created, it then allows you to manage images and containers. For example, the image can be downloaded and containers can be started, stopped and restarted.

### Docker Client

The client communicates with the Docker Host and let's you work with images and containers.

Check if your client is working using the following command:

```
docker -v
```

It shows the output:

```
Docker version 20.10.2, build 2291f61
```

NOTE: The exact version may differ based upon how recently the installation was performed.

The exact version of Client and Server can be seen using `docker version` command. This shows the output as:

```
 docker version
Client: Docker Engine - Community
 Cloud integration: 1.0.7
 Version:           20.10.2
 API version:       1.41
 Go version:        go1.13.15
 Git commit:        2291f61
 Built:             Mon Dec 28 16:12:42 2020
 OS/Arch:           darwin/amd64
 Context:           default
 Experimental:      true

Server: Docker Engine - Community
 Engine:
  Version:          20.10.2
  API version:      1.41 (minimum version 1.12)
  Go version:       go1.13.15
  Git commit:       8891c58
  Built:            Mon Dec 28 16:15:28 2020
  OS/Arch:          linux/amd64
  Experimental:     true
 containerd:
  Version:          1.4.3
  GitCommit:        269548fa27e0089a8b8278fc4fc781d7f65a939b
 runc:
  Version:          1.0.0-rc92
  GitCommit:        ff819c7e9184c13b7c2607fe6c30ae19403a7aff
 docker-init:
  Version:          0.19.0
  GitCommit:        de40ad0
ajeetraina@Ajeets-MacBook-Pro realtime-sensor-jetson % 
```

The complete set of commands can be seen using `docker --help`.


## Test Your Knowledge - Quiz 1


| S. No.   |    Question. |      Response
:--------| :--------------|:---------------|
| 1   | What is difference between Docker Image and Docker Container? | |
| 2   | Where are all Docker images stored? | |
| 3   | Is DockerHub a public or private Docker registry? | |
| 4   | What is the main role of Docker Engine? | |


## Build a Docker Image

This section explains how to create a Docker image.

## Dockerfile

Docker build images by reading instructions from a _Dockerfile_. A _Dockerfile_ is a text document that contains all the commands a user could call on the command line to assemble an image. `docker image build` command uses this file and executes all the commands in succession to create an image.

`build` command is also passed a context that is used during image creation. This context can be a path on your local filesystem or a URL to a Git repository.

Dockerfile is usually called Dockerfile. The complete list of commands that can be specified in this file are explained at https://docs.docker.com/reference/builder/. The common commands are listed below:

## Common commands for Dockerfile

| Command | Purpose | Example |
:------------ | :-------------| :-------------|
| FROM | First non-comment instruction in _Dockerfile_ | `FROM ubuntu`
| COPY | Copies mulitple source files from the context to the file system of the container at the specified path | `COPY .bash_profile /home`
| ENV | Sets the environment variable | `ENV HOSTNAME=test`
| RUN | Executes a command | `RUN apt-get update`
| CMD | Defaults for an executing container | `CMD ["/bin/echo", "hello world"]`
| EXPOSE | Informs the network ports that the container will listen on | `EXPOSE 8093`
|==================

## Create your first image

Create a new directory `hellodocker`.

In that directory, create a new text file `Dockerfile`. Use the following contents:

```
FROM ubuntu:latest

CMD ["/bin/echo", "hello world"]
```

This image uses `ubuntu` as the base image. `CMD` command defines the command that needs to run. It provides a different entry point of `/bin/echo` and gives the argument "`hello world`".

## Build the image using the command:

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

## List the images available using `docker image ls`:

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

## Create your first image using Java

### Create a simple Java application

Please Note: If you are running OpenJDK 9, `mvn package` may fail with

```
[ERROR] Failed to execute goal org.apache.maven.plugins:maven-compiler-plugin:3.1:compile (default-compile) on project helloworld: Compilation failure: Compilation failure:
[ERROR] Source option 1.5 is no longer supported. Use 1.6 or later.
[ERROR] Target option 1.5 is no longer supported. Use 1.6 or later.
```

because support for Java 5 http://openjdk.java.net/jeps/182[was dropped in JDK9].

You can add

```
  <properties>
    <maven.compiler.source>1.6</maven.compiler.source>
    <maven.compiler.target>1.6</maven.compiler.target>
  </properties>
```

to the generated `pom.xml` to target 1.6 instead. See also the link:chapters/ch03-build-image-java-9.adoc[Build a Docker Image for Java 9] chapter.


## Create a new Java project:

```
mvn archetype:generate -DgroupId=org.examples.java -DartifactId=helloworld -DinteractiveMode=false
```

## Build the project:

```
cd helloworld
mvn package
```

## Run the Java class:

```
java -cp target/helloworld-1.0-SNAPSHOT.jar org.examples.java.App
```

This shows the output:

```
Hello World!
```

Let's package this application as a Docker image.

## Java Docker image

Run the OpenJDK container in an interactive manner:

```
docker container run -it openjdk
```

This will open a terminal in the container. Check the version of Java:

```
root@8d0af9da5258:/# java -version
openjdk version "1.8.0_141"
OpenJDK Runtime Environment (build 1.8.0_141-8u141-b15-1~deb9u1-b15)
OpenJDK 64-Bit Server VM (build 25.141-b15, mixed mode)
```

A different JDK version may be shown in your case. 

Exit out of the container by typing `exit` in the container shell.

## Package and run Java application as Docker image

Create a new Dockerfile in `helloworld` directory and use the following content:

```
FROM openjdk:latest

COPY target/helloworld-1.0-SNAPSHOT.jar /usr/src/helloworld-1.0-SNAPSHOT.jar

CMD java -cp /usr/src/helloworld-1.0-SNAPSHOT.jar org.examples.java.App
```

## Build the image:

```
docker image build -t hello-java:latest .
```
Run the image:

```
docker container run hello-java:latest
```

This displays the output:

```
Hello World!
```

This shows the exactly same output that was printed when the Java class was invoked using Java CLI.

## Package and run Java Application using Docker Maven Plugin

[Docker Maven Plugin](https://github.com/fabric8io/docker-maven-plugin) allows you to manage Docker images and containers using Maven. It comes with predefined goals:

| S. No | Goal | Description |
:------------ | :-------------| :-------------|
| 1| `docker:build` | Build images | 
| 2 |`docker:start` | Create and start containers| 
| 3 |`docker:stop` | Stop and destroy containers| 
| 4 |`docker:push` | Push images to a registry| 
| 5 |`docker:remove` | Remove images from local docker host| 
| 6 | `docker:logs` | Show container logs | 
|==================




Complete set of goals are listed at https://github.com/fabric8io/docker-maven-plugin.

Clone the sample code from https://github.com/arun-gupta/docker-java-sample/.

Create the Docker image:

```
mvn -f docker-java-sample/pom.xml package -Pdocker
```

This will show an output like:

```
[INFO] Copying files to /Users/argu/workspaces/docker-java-sample/target/docker/hellojava/build/maven
[INFO] Building tar: /Users/argu/workspaces/docker-java-sample/target/docker/hellojava/tmp/docker-build.tar
[INFO] DOCKER> [hellojava:latest]: Created docker-build.tar in 87 milliseconds
[INFO] DOCKER> [hellojava:latest]: Built image sha256:6f815
[INFO] ------------------------------------------------------------------------
[INFO] BUILD SUCCESS
[INFO] ------------------------------------------------------------------------
```

The list of images can be checked using the command `docker image ls | grep hello-java`:

```
hello-java                            latest              ea64a9f5011e        5 seconds ago       643 MB
```

## Run the Docker container:

```
mvn -f docker-java-sample/pom.xml install -Pdocker
```

This will show an output like:

```
[INFO] DOCKER> [hellojava:latest]: Start container 30a08791eedb
30a087> Hello World!
[INFO] DOCKER> [hellojava:latest]: Waited on log out 'Hello World!' 510 ms
```

This is similar output when running the Java application using `java` CLI or the Docker container using `docker container run` command.

The container is running in the foreground. Use `Ctrl` + `C` to interrupt the container and return back to terminal.

Only one change was required in the project to enable Docker packaging and running. A Maven profile is added in `pom.xml`:

```
<profiles>
    <profile>
        <id>docker</id>
        <build>
            <plugins>
                <plugin>
                    <groupId>io.fabric8</groupId>
                    <artifactId>docker-maven-plugin</artifactId>
                    <version>0.22.1</version>
                    <configuration>
                        <images>
                            <image>
                                <name>hello-java</name>
                                <build>
                                    <from>openjdk:latest</from>
                                    <assembly>
                                        <descriptorRef>artifact</descriptorRef>
                                    </assembly>
                                    <cmd>java -cp maven/${project.name}-${project.version}.jar org.examples.java.App</cmd>
                                </build>
                                <run>
                                    <wait>
                                        <log>Hello World!</log>
                                    </wait>
                                </run>
                            </image>
                        </images>
                    </configuration>
                    <executions>
                        <execution>
                            <id>docker:build</id>
                            <phase>package</phase>
                            <goals>
                                <goal>build</goal>
                            </goals>
                        </execution>
                        <execution>
                            <id>docker:start</id>
                            <phase>install</phase>
                            <goals>
                                <goal>start</goal>
                                <goal>logs</goal>
                            </goals>
                        </execution>
                    </executions>
                </plugin>
            </plugins>
        </build>
    </profile>
</profiles>
```

## Dockerfile Command Design Patterns

### Difference between CMD and ENTRYPOINT

*TL;DR* `CMD` will work for most of the cases.

Default entry point for a container is `/bin/sh`, the default shell.

Running a container as `docker container run -it ubuntu` uses that command and starts the default shell. The output is shown as:

```
docker container run -it ubuntu
root@88976ddee107:/#
```

`ENTRYPOINT` allows to override the entry point to some other command, and even customize it. For example, a container can be started as:

```
docker container run -it --entrypoint=/bin/cat ubuntu /etc/passwd
root:x:0:0:root:/root:/bin/bash
daemon:x:1:1:daemon:/usr/sbin:/usr/sbin/nologin
bin:x:2:2:bin:/bin:/usr/sbin/nologin
sys:x:3:3:sys:/dev:/usr/sbin/nologin
. . .
```

This command overrides the entry point to the container to `/bin/cat`. The argument(s) passed to the CLI are used by the entry point.

## Difference between ADD and COPY

*TL;DR* `COPY` will work for most of the cases.

`ADD` has all capabilities of `COPY` and has the following additional features:

. Allows tar file auto-extraction in the image, for example, `ADD app.tar.gz /opt/var/myapp`.
. Allows files to be downloaded from a remote URL. However, the downloaded files will become part of the image. This causes the image size to bloat. So its recommended to use `curl` or `wget` to download the archive explicitly, extract, and remove the archive.

### Import and export images

Docker images can be saved using `image save` command to a `.tar` file:

```
docker image save helloworld > helloworld.tar
```
These tar files can then be imported using `load` command:

```
docker image load -i helloworld.tar
```

## Run a Docker Container

The first step in running an application using Docker is to run a container. If you can think of an open source software, there is a very high likelihood that there will be a Docker image available for it at https://store.docker.com[Docker Store]. Docker client can simply run the container by giving the image name. The client will check if the image already exists on Docker Host. If it exists then it'll run the container, otherwise the host will first download the image.

## Pull Image

Let's check if any images are available:

```
docker image ls
```

At first, this list is empty. If you've already downloaded the images as specified in the setup chapter, then all the images will be shown here. 

List of images can be seen again using the `docker image ls` command. This will show the following output:

```
REPOSITORY                   TAG                 IMAGE ID            CREATED             SIZE
hellojava                    latest              8d76bf5691c4        32 minutes ago      740MB
hello-java                   latest              93b1180c5d91        36 minutes ago      740MB
helloworld                   2                   7fbedda27c66        41 minutes ago      1.13MB
helloworld                   latest              e61f88f3a0f7        About an hour ago   122MB
mysql                        latest              b4e78b89bcf3        3 days ago          412MB
ubuntu                       latest              2d696327ab2e        4 days ago          122MB
jboss/wildfly                latest              9adbdb00cded        8 days ago          592MB
openjdk                      latest              6077adce18ea        8 days ago          740MB
busybox                      latest              54511612f1c4        9 days ago          1.13MB
tailtarget/hadoop            2.7.2               ee6b539c886e        6 months ago        1.15GB
tailtarget/jenkins           2.32.3              71a7d9bcfe2b        6 months ago        859MB
arungupta/couchbase          travel              7929a80707db        7 months ago        583MB
arungupta/couchbase-javaee   travel              2bb52abaad5f        7 months ago        595MB
arungupta/javaee7-hol        latest              da5c9d4f85ca        2 years ago         582MB
```

More details about the image can be obtained using `docker image history jboss/wildfly` command:

```
IMAGE               CREATED             CREATED BY                                      SIZE                COMMENT
9adbdb00cded        8 days ago          /bin/sh -c #(nop)  CMD ["/opt/jboss/wildfl...   0B                  
<missing>           8 days ago          /bin/sh -c #(nop)  EXPOSE 8080/tcp              0B                  
<missing>           8 days ago          /bin/sh -c #(nop)  USER [jboss]                 0B                  
<missing>           8 days ago          /bin/sh -c #(nop)  ENV LAUNCH_JBOSS_IN_BAC...   0B                  
<missing>           8 days ago          /bin/sh -c cd $HOME     && curl -O https:/...   163MB               
<missing>           8 days ago          /bin/sh -c #(nop)  USER [root]                  0B                  
<missing>           8 days ago          /bin/sh -c #(nop)  ENV JBOSS_HOME=/opt/jbo...   0B                  
<missing>           8 days ago          /bin/sh -c #(nop)  ENV WILDFLY_SHA1=9ee3c0...   0B                  
<missing>           8 days ago          /bin/sh -c #(nop)  ENV WILDFLY_VERSION=10....   0B                  
<missing>           8 days ago          /bin/sh -c #(nop)  ENV JAVA_HOME=/usr/lib/...   0B                  
<missing>           8 days ago          /bin/sh -c #(nop)  USER [jboss]                 0B                  
<missing>           8 days ago          /bin/sh -c yum -y install java-1.8.0-openj...   204MB               
<missing>           8 days ago          /bin/sh -c #(nop)  USER [root]                  0B                  
<missing>           8 days ago          /bin/sh -c #(nop)  MAINTAINER Marek Goldma...   0B                  
<missing>           8 days ago          /bin/sh -c #(nop)  USER [jboss]                 0B                  
<missing>           8 days ago          /bin/sh -c #(nop) WORKDIR /opt/jboss            0B                  
<missing>           8 days ago          /bin/sh -c groupadd -r jboss -g 1000 && us...   296kB               
<missing>           8 days ago          /bin/sh -c yum update -y && yum -y install...   28.7MB              
<missing>           8 days ago          /bin/sh -c #(nop)  MAINTAINER Marek Goldma...   0B                  
<missing>           8 days ago          /bin/sh -c #(nop)  CMD ["/bin/bash"]            0B                  
<missing>           8 days ago          /bin/sh -c #(nop)  LABEL name=CentOS Base ...   0B                  
<missing>           8 days ago          /bin/sh -c #(nop) ADD file:1ed4d1a29d09a63...   197MB               
```

## Run Container

### Interactively

Run WildFly container in an interactive mode.

```
docker container run -it jboss/wildfly
```

This will show the output as:

```
=========================================================================

  JBoss Bootstrap Environment

  JBOSS_HOME: /opt/jboss/wildfly

  JAVA: /usr/lib/jvm/java/bin/java

. . .

00:26:27,455 INFO  [org.jboss.as] (Controller Boot Thread) WFLYSRV0060: Http management interface listening on http://127.0.0.1:9990/management
00:26:27,456 INFO  [org.jboss.as] (Controller Boot Thread) WFLYSRV0051: Admin console listening on http://127.0.0.1:9990
00:26:27,457 INFO  [org.jboss.as] (Controller Boot Thread) WFLYSRV0025: WildFly Full 10.1.0.Final (WildFly Core 2.2.0.Final) started in 3796ms - Started 331 of 577 services (393 services are lazy, passive or on-demand)
```

This shows that the server started correctly, congratulations!

By default, Docker runs in the foreground. `-i` allows to interact with the STDIN and `-t` attach a TTY to the process. Switches can be combined together and used as `-it`.

Hit Ctrl+C to stop the container.

=== Detached container

Restart the container in detached mode:

```
docker container run -d jboss/wildfly
254418caddb1e260e8489f872f51af4422bc4801d17746967d9777f565714600
```

`-d`, instead of `-it`, runs the container in detached mode.

The output is the unique id assigned to the container. Logs of the container can be seen using the command `docker container logs <CONTAINER_ID>`, where `<CONTAINER_ID>` is the id of the container.

Status of the container can be checked using the `docker container ls` command:

```
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS               NAMES
254418caddb1        jboss/wildfly       "/opt/jboss/wildfl..."   2 minutes ago       Up 2 minutes        8080/tcp            gifted_haibt
```

Also try `docker container ls -a` to see all the containers on this machine.

=== With default port

If you want the container to accept incoming connections, you will need to provide special options when invoking `docker run`. The container, we just started, can't be accessed by our browser. We need to stop it again and restart with different options.

```
docker container stop `docker container ps | grep wildfly | awk '{print $1}'`
```

Restart the container as:

```
docker container run -d -P --name wildfly jboss/wildfly
```

`-P` map any exposed ports inside the image to a random port on Docker host. In addition, `--name` option is used to give this container a name. This name can then later be used to get more details about the container or stop it. This can be verified using `docker container ls` command:

```
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                     NAMES
89fbfbceeb56        jboss/wildfly       "/opt/jboss/wildfl..."   9 seconds ago       Up 8 seconds        0.0.0.0:32768->8080/tcp   wildfly
```

The port mapping is shown in the `PORTS` column. Access WildFly server at http://localhost:32768. Make sure to use the correct port number as shown in your case.

NOTE: Exact port number may be different in your case.

The page would look like:

![My Image)(wildfly-first-run-default-page.png)

## With specified port

Stop and remove the previously running container as:

```
docker container stop wildfly
docker container rm wildfly
```

Alternatively, `docker container rm -f wildfly` can be used to stop and remove the container in one command. Be careful with this command because `-f` uses `SIGKILL` to kill the container.

## Restart the container as:

```
docker container run -d -p 8080:8080 --name wildfly jboss/wildfly
```

The format is `-p hostPort:containerPort`. This option maps a port on the host to a port in the container. This allows us to access the container on the specified port on the host.

Now we're ready to test http://localhost:8080. This works with the exposed port, as expected.

Let's stop and remove the container as:

```
docker container stop wildfly
docker container rm wildfly
```

## Deploy a WAR file to application server

Now that your application server is running, lets see how to deploy a WAR file to it.

Create a new directory `hellojavaee`. Create a new text file and name it `Dockerfile`. Use the following contents:

```
FROM jboss/wildfly:latest

RUN curl -L https://github.com/javaee-samples/javaee7-simple-sample/releases/download/v1.10/javaee7-simple-sample-1.10.war -o /opt/jboss/wildfly/standalone/deployments/javaee-simple-sample.war
```

## Create an image:

```
docker image build -t javaee-sample .
```

Start the container:

```
docker container run -d -p 8080:8080 --name wildfly javaee-sample
```

## Access the endpoint:

```
curl http://localhost:8080/javaee-simple-sample/resources/persons
```

See the output:

```
<persons>
	<person>
		<name>
		Penny
		</name>
	</person>
	<person>
		<name>
		Leonard
		</name>
	</person>
	<person>
		<name>
		Sheldon
		</name>
	</person>
	<person>
		<name>
		Amy
		</name>
	</person>
	<person>
		<name>
		Howard
		</name>
	</person>
	<person>
		<name>
		Bernadette
		</name>
	</person>
	<person>
		<name>
		Raj
		</name>
	</person>
	<person>
		<name>
		Priya
		</name>
	</person>
</persons>
```

Optional: `brew install XML-Coreutils` will install XML formatting utility on Mac. This output can then be piped to `xml-fmt` to display a formatted result.

## Stop container

Stop a specific container by id or name:

```
docker container stop <CONTAINER ID>
docker container stop <NAME>
```

## Stop all running containers:

```
docker container stop $(docker container ps -q)
```

## Stop only the exited containers:

```
docker container ps -a -f "exited=-1"
```

## Remove container

Remove a specific container by id or name:

``
docker container rm <CONTAINER_ID>
docker container rm <NAME>
```

## Remove containers meeting a regular expression

```
docker container ps -a | grep wildfly | awk '{print $1}' | xargs docker container rm
```

## Remove all containers, without any criteria

```
docker container rm $(docker container ps -aq)
```

##  Additional ways to find port mapping

The exact mapped port can also be found using `docker port` command:

```
docker container port <CONTAINER_ID> or <NAME>
```

This shows the output as:

```
8080/tcp -> 0.0.0.0:8080
```

Port mapping can be also be found using `docker inspect` command:

```
docker container inspect --format='{{(index (index .NetworkSettings.Ports "8080/tcp") 0).HostPort}}' <CONTAINER ID>
```

## Build a Docker Image with JDK 9

This chapter explains how to create a Docker image with JDK 9.

The link:ch03-build-image.adoc[prior chapter] explained how, in general, to build a Docker image with Java.
This chapter expands on this topic and focuses on JDK 9 features.

## Create a Docker Image using JDK 9

Create a new directory, for example `docker-jdk9`.

In that directory, create a new text file `jdk-9-debian-slim.Dockerfile`.
Use the following contents:

```
# A JDK 9 with Debian slim
FROM debian:stable-slim
# Download from http://jdk.java.net/9/
# ADD http://download.java.net/java/GA/jdk9/9/binaries/openjdk-9_linux-x64_bin.tar.gz /opt
ADD openjdk-9_linux-x64_bin.tar.gz /opt
# Set up env variables
ENV JAVA_HOME=/opt/jdk-9
ENV PATH=$PATH:$JAVA_HOME/bin
CMD ["jshell", "-J-XX:+UnlockExperimentalVMOptions", \
               "-J-XX:+UseCGroupMemoryLimitForHeap", \
               "-R-XX:+UnlockExperimentalVMOptions", \
               "-R-XX:+UseCGroupMemoryLimitForHeap"]
```

This image uses `debian` slim as the base image and installs the OpenJDK build
of JDK for linux x64 (see the link:ch01-setup.adoc[setup section] for how to download this into the
current directory).

The image is configured by default to run `jshell` the Java REPL. Read more JShell at link:https://docs.oracle.com/javase/9/jshell/introduction-jshell.htm[Introduction to JShell]. The
experimental flag `-XX:+UseCGroupMemoryLimitForHeap` is passed to the REPL
process (the frontend Java process managing user input and the backend Java
process managing compilation).  This option will ensure container memory
constraints are honored.

## Build the image using the command:

```
docker image build -t jdk-9-debian-slim -f jdk-9-debian-slim.Dockerfile .
```


## List the images available using `docker image ls`:

```
REPOSITORY              TAG                 IMAGE ID            CREATED             SIZE
jdk-9-debian-slim       latest              023f6999d94a        4 hours ago         400MB
debian                  stable-slim         d30525fb4ed2        4 days ago          55.3MB
```

Other images may be shown as well but we are interested in these two images for
now.  The large difference in size is attributed to JDK 9, which is larger
in size than JDK 8 because it also explicitly provides Java modules that we
shall see more of later on in this chapter.

## Run the container using the command:

```
docker container run -m=200M -it --rm jdk-9-debian-slim
```

to see the output:

```
INFO: Created user preferences directory.
|  Welcome to JShell -- Version 9
|  For an introduction type: /help intro

jshell>
```

Query the available memory of the Java process by typing the following
expression into the Java REPL:

  Runtime.getRuntime().maxMemory() / (1 << 20)

to see the output:

```
jshell> Runtime.getRuntime().maxMemory() / (1 << 20)
$1 ==> 100
```

Notice that the Java process is honoring memory constraints (see the `--memory`
of `docker container run`) and will not allocate memory beyond that specified for the
container.

In a future release of the JDK it will no longer be necessary to specify an
experimental flag (`-XX:+UnlockExperimentalVMOptions`) once the mechanism by
which memory constraints are efficiently detected is stable.

JDK 9 supports the set CPUs constraint (see the `--cpuset-cpus` of
`docker container run`) but does not currently support other CPU constraints such as
CPU shares.  This is ongoing work http://openjdk.java.net/jeps/8182070[tracked]
in the OpenJDK project.

Note: the support for CPU sets and memory constraints have also been backported
to JDK 8 release 8u131 and above.

Type `Ctrl` + `D` to exit out of `jshell`.

To list all the Java modules distributed with JDK 9 run the following command:

```
docker container run -m=200M -it --rm jdk-9-debian-slim java --list-modules
```

This will show an output:

```
java.activation@9
java.base@9
java.compiler@9
java.corba@9
java.datatransfer@9
java.desktop@9
java.instrument@9
java.logging@9
java.management@9
java.management.rmi@9
java.naming@9
java.prefs@9
java.rmi@9
java.scripting@9
java.se@9
java.se.ee@9
java.security.jgss@9
java.security.sasl@9
java.smartcardio@9
java.sql@9
java.sql.rowset@9
java.transaction@9
java.xml@9
java.xml.bind@9
java.xml.crypto@9
java.xml.ws@9
java.xml.ws.annotation@9
jdk.accessibility@9
jdk.aot@9
jdk.attach@9
jdk.charsets@9
jdk.compiler@9
jdk.crypto.cryptoki@9
jdk.crypto.ec@9
jdk.dynalink@9
jdk.editpad@9
jdk.hotspot.agent@9
jdk.httpserver@9
jdk.incubator.httpclient@9
jdk.internal.ed@9
jdk.internal.jvmstat@9
jdk.internal.le@9
jdk.internal.opt@9
jdk.internal.vm.ci@9
jdk.internal.vm.compiler@9
jdk.jartool@9
jdk.javadoc@9
jdk.jcmd@9
jdk.jconsole@9
jdk.jdeps@9
jdk.jdi@9
jdk.jdwp.agent@9
jdk.jlink@9
jdk.jshell@9
jdk.jsobject@9
jdk.jstatd@9
jdk.localedata@9
jdk.management@9
jdk.management.agent@9
jdk.naming.dns@9
jdk.naming.rmi@9
jdk.net@9
jdk.pack@9
jdk.policytool@9
jdk.rmic@9
jdk.scripting.nashorn@9
jdk.scripting.nashorn.shell@9
jdk.sctp@9
jdk.security.auth@9
jdk.security.jgss@9
jdk.unsupported@9
jdk.xml.bind@9
jdk.xml.dom@9
jdk.xml.ws@9
jdk.zipfs@9
```

In total there should be 75 modules:

```
$ docker container run -m=200M -it --rm jdk-9-debian-slim java --list-modules | wc -l
      75
```

##  Create a Docker Image using JDK 9 and Alpine Linux

Instead of `debian` as the base image it is possible to use Alpine Linux
with an early access build of JDK 9 that is compatible with the muslc library
shipped with Alpine Linux.

Create a new text file `jdk-9-alpine.Dockerfile`.
Use the following contents:

```
# A JDK 9 with Alpine Linux
FROM alpine:3.6
# Add the musl-based JDK 9 distribution
RUN mkdir /opt
# Download from http://jdk.java.net/9/
# ADD http://download.java.net/java/jdk9-alpine/archive/181/binaries/jdk-9-ea+181_linux-x64-musl_bin.tar.gz
ADD jdk-9-ea+181_linux-x64-musl_bin.tar.gz /opt
# Set up env variables
ENV JAVA_HOME=/opt/jdk-9
ENV PATH=$PATH:$JAVA_HOME/bin
CMD ["jshell", "-J-XX:+UnlockExperimentalVMOptions", \
               "-J-XX:+UseCGroupMemoryLimitForHeap", \
               "-R-XX:+UnlockExperimentalVMOptions", \
               "-R-XX:+UseCGroupMemoryLimitForHeap"]
```

This image uses `alpine` 3.6 as the base image and installs the OpenJDK build
of JDK for Alpine Linux x64 (see the link:ch01-setup.adoc[Setup Environments]
chapter for how to download this into the current directory).

The image is configured in the same manner as for the `debian`-based image.

## Build the image using the command:

```
docker image build -t jdk-9-alpine -f jdk-9-alpine.Dockerfile .
```

## List the images available using `docker image ls`:

```
REPOSITORY              TAG                 IMAGE ID            CREATED             SIZE
jdk-9-debian-slim       latest              023f6999d94a        4 hours ago         400MB
jdk-9-alpine            latest              f5a57382f240        4 hours ago         356MB
debian                  stable-slim         d30525fb4ed2        4 days ago          55.3MB
alpine                  3.6                 7328f6f8b418        3 months ago        3.97MB
```

Notice the difference in image sizes.  Alpine Linux by design has been carefully
crafted to produce a minimal running OS image. A cost of such a design is
an alternative standard library https://www.musl-libc.org/[musl libc] that is
not compatible with the C standard library (libc).  As a result the JDK requires
modifications to run on Alpine Linux.  Such modifications have been proposed
by the OpenJDK http://openjdk.java.net/projects/portola/[Portola Project].


##  Create a Docker Image using JDK 9 and a Java application

Clone the GitHib project https://github.com/PaulSandoz/helloworld-java-9 that
contains a simple Java 9-based project:

```
git clone https://github.com/PaulSandoz/helloworld-java-9.git
```

(If you have a github account you may wish to fork it and then clone the fork
so you can make modifications.)

Enter the directory `helloworld-java-9` and build the project from within a
running Docker container with JDK 9 installed:

```
docker container run --volume $PWD:/helloworld-java-9 --workdir /helloworld-java-9 \
      -it --rm openjdk:9-jdk-slim \
      ./mvnw package
```

(If you have JDK 9 installed locally on the host system you can build directly
with `./mvnw package`.)

In this case we are using the `openjdk:9-jdk-slim` on Docker hub that has been
configured to work with SSL certificates so that the maven wrapper tool can
successfully download the maven tool.  This image is not produced or in anyway
endorsed by the OpenJDK project (unlike the JDK 9 distributions that were
previously required).  It is anticipated that future releases of the JDK from
the OpenJDK project will have root CA certificates (see issue
https://bugs.openjdk.java.net/browse/JDK-8189131[JDK-8189131])

To build Docker image for this application use the file `helloworld-jdk-9.Dockerfile` from the checked out repo to build your image. The contents of the file are shown below:

```
# Hello world application with JDK 9 and Debian slim
FROM jdk-9-debian-slim
COPY target/helloworld-1.0-SNAPSHOT.jar /opt/helloworld/helloworld-1.0-SNAPSHOT.jar
# Set up env variables
CMD java -XX:+UnlockExperimentalVMOptions -XX:+UseCGroupMemoryLimitForHeap \
  -cp /opt/helloworld/helloworld-1.0-SNAPSHOT.jar org.examples.java.App
```

Build a Docker image containing the simple Java application based of the Docker
image `jdk-9-debian-slim`:

```
docker image build -t helloworld-jdk-9 -f helloworld-jdk-9.Dockerfile .
```

## List the images available using `docker image ls`:

```
REPOSITORY              TAG                 IMAGE ID            CREATED              SIZE
helloworld-jdk-9        latest              eb0539e9529a        19 seconds ago       400MB
jdk-9-debian-slim       latest              023f6999d94a        5 hours ago          400MB
jdk-9-alpine            latest              f5a57382f240        5 hours ago          356MB
openjdk                 9-jdk-slim          6dca67f4790e        3 days ago           372MB
debian                  stable-slim         d30525fb4ed2        4 days ago           55.3MB
alpine                  3.6                 7328f6f8b418        3 months ago         3.97MB
```

Notice how large the application image `helloworld-jdk-9`.

Run the `jdeps` tool to see what modules the application depends on:

```
docker container run -it --rm helloworld-jdk-9 jdeps --list-deps /opt/helloworld/helloworld-1.0-SNAPSHOT.jar
```

and observe that the application only depends on the `java.base` module.

## Reduce the size of a Docker Image using JDK 9 and a Java application

The Java application is extremely simple and as a result uses very little of the
functionality shipped with JDK 9 distribution, specifically the application
only depends on functionality present in the `java.base` module.  We can create
a custom Java runtime that only contains the `java.base` module and include
that in application Docker image.

Create a custom Java runtime that is small and only contains the `java.base`
module:

```
docker container run --rm \
      --volume $PWD:/out \
      jdk-9-debian-slim \
      jlink --module-path /opt/jdk-9/jmods \
        --verbose \
        --add-modules java.base \
        --compress 2 \
        --no-header-files \
        --output /out/target/openjdk-9-base_linux-x64
```

This command exists as `create-minimal-java-runtime.sh` script in the repo earlier checked out from link:https://github.com/PaulSandoz/helloworld-java-9[helloworld-java-9].

The JDK 9 tool `jlink` is used to create the custom Java runtime. Read more jlink in the https://docs.oracle.com/javase/9/tools/jlink.htm[Tools Reference]. The tool
is executed from with the container containing JDK 9 and directory where the
modules reside, `/opt/jdk-9/jmods`, is declared in the module path.  Only the
`java.base` module is selected.

The custom runtime is output to the `target` directory:

```
$ du -k target/openjdk-9-base_linux-x64/
24      target/openjdk-9-base_linux-x64//bin
12      target/openjdk-9-base_linux-x64//conf/security/policy/limited
8       target/openjdk-9-base_linux-x64//conf/security/policy/unlimited
24      target/openjdk-9-base_linux-x64//conf/security/policy
68      target/openjdk-9-base_linux-x64//conf/security
76      target/openjdk-9-base_linux-x64//conf
44      target/openjdk-9-base_linux-x64//legal/java.base
44      target/openjdk-9-base_linux-x64//legal
72      target/openjdk-9-base_linux-x64//lib/jli
16      target/openjdk-9-base_linux-x64//lib/security
19824   target/openjdk-9-base_linux-x64//lib/server
31656   target/openjdk-9-base_linux-x64//lib
31804   target/openjdk-9-base_linux-x64/
```

To build Docker image for this application use the file `helloworld-jdk-9-base.Dockerfile` from the checked out repo. The contents of the file are shown below:

```
# Hello world application with custom Java runtime with just the base module and Debian slim
FROM debian:stable-slim
COPY target/openjdk-9-base_linux-x64 /opt/jdk-9
COPY target/helloworld-1.0-SNAPSHOT.jar /opt/helloworld/helloworld-1.0-SNAPSHOT.jar
# Set up env variables
ENV JAVA_HOME=/opt/jdk-9
ENV PATH=$PATH:$JAVA_HOME/bin
CMD java -XX:+UnlockExperimentalVMOptions -XX:+UseCGroupMemoryLimitForHeap \
  -cp /opt/helloworld/helloworld-1.0-SNAPSHOT.jar org.examples.java.App
```

Build a Docker image containing the simple Java application based of the Docker
image `debian:stable-slim`:

```
docker image build -t helloworld-jdk-9-base -f helloworld-jdk-9-base.Dockerfile .
```

## List the images available using `docker image ls`:

```
REPOSITORY              TAG                 IMAGE ID            CREATED             SIZE
helloworld-jdk-9-base   latest              7052483fdb77        24 seconds ago      87.7MB
helloworld-jdk9         latest              eb0539e9529a        17 minutes ago      400MB
jdk-9-debian-slim       latest              023f6999d94a        5 hours ago         400MB
jdk-9-alpine            latest              f5a57382f240        5 hours ago         356MB
openjdk                 9-jdk-slim          6dca67f4790e        3 days ago          372MB
debian                  stable-slim         d30525fb4ed2        4 days ago          55.3MB
alpine                  3.6                 7328f6f8b418        3 months ago        3.97MB
[source, text]
```

The `helloworld-jdk-9-base` is much smaller and could be reduced further if
Alpine Linux was used instead of Debian Slim.

A realistic application will depend on more JDK modules but it's still possible
to significantly reduce the Java runtime to only the required modules (for
example many applications will not require Corba or RMI nor the compiler tools).

## What is Docker Compose


Docker Compose is a tool for defining and running complex applications with Docker. With Compose, you define a multi-container application in a single file, then spin your application up in a single command which does everything that needs to be done to get it running.

An application using Docker containers will typically consist of multiple containers. With Docker Compose, there is no need to write shell scripts to start your containers. All the containers are defined in a configuration file using _services_, and then `docker-compose` script is used to start, stop, and restart the application and all the services in that application, and all the containers within that service. The complete list of commands is:

| Command | Purpose |
:------------ | :-------------| 
| `build` | Build or rebuild services |
| `help` | Get help on a command |
| `kill` | Kill containers|
| `logs` | View output from containers|
| `port` | Print the public port for a port binding|
| `ps` | List containers|
| `pull` | Pulls service images|
| `restart` | Restart services|
| `rm` | Remove stopped containers|
| `run` | Run a one-off command|
| `scale` | Set number of containers for a service|
| `start` | Start services|
| `stop` | Stop services|
| `up` | Create and start containers|
| `migrate-to-labels  Recreate containers to add labels|
|====

The application used in this section is a Java EE application talking to a database. The application publishes a REST endpoint that can be invoked using `curl. It is deployed using http://wildfly-swarm.io/[WildFly Swarm] that communicates to MySQL database.

WildFly Swarm and MySQL will be running in two separate containers, and thus making this a multi-container application.

## Configuration file

The entry point to Docker Compose is a Compose file, usually called `docker-compose.yml`. Create a new directory `javaee`. In that directory, create a new file `docker-compose.yml` in it. Use the following contents:

```
version: '3.3'
services:
  db:
    container_name: db
    image: mysql:8
    environment:
      MYSQL_DATABASE: employees
      MYSQL_USER: mysql
      MYSQL_PASSWORD: mysql
      MYSQL_ROOT_PASSWORD: supersecret
    ports:
      - 3306:3306
  web:
    image: arungupta/docker-javaee:dockerconeu17
    ports:
      - 8080:8080
      - 9990:9990
    depends_on:
      - db
```

In this Compose file:

- Two services in this Compose are defined by the name `db` and `web` attributes
- Image name for each service defined using `image` attribute
- The `mysql:8` image starts the MySQL server.
- `environment` attribute defines environment variables to initialize MySQL server.
  -  `MYSQL_DATABASE` allows you to specify the name of a database to be created on image startup.
  -  `MYSQL_USER` and `MYSQL_PASSWORD` are used in conjunction to create a new user and to set that user's password. This user will be granted superuser permissions for the database specified by the `MYSQL_DATABASE` variable.
  -  `MYSQL_ROOT_PASSWORD` is mandatory and specifies the password that will be set for the MySQL root superuser account.
- Java EE application uses the `db` service as specified in the `connection-url` as specified at https://github.com/arun-gupta/docker-javaee/blob/master/employees/src/main/resources/project-defaults.yml/.
- The `arungupta/docker-javaee:dockerconeu17` image starts WildFly Swarm application server. It consists of the Java EE application built from https://github.com/arun-gupta/docker-javaee. Clone that project if you want to build your own image.
- Port forwarding is achieved using `ports` attribute.
- `depends_on` attribute allows to express dependency between services. In this case, MySQL will be started before WildFly. Application-level health check are still user's responsibility.

## Start application

All services in the application can be started, in detached mode, by giving the command:

```
docker-compose up -d
```

An alternate Compose file name can be specified using `-f` option.

An alternate directory where the compose file exists can be specified using `-p` option.

This shows the output as:

```
docker-compose up -d
Creating network "javaee_default" with the default driver
Creating db ... 
Creating db ... done
Creating javaee_web_1 ... 
Creating javaee_web_1 ... done
```

The output may differ slightly if the images are downloaded as well.

Started services can be verified using the command `docker-compose ps`:

```
    Name                  Command               State                       Ports                     
------------------------------------------------------------------------------------------------------
db             docker-entrypoint.sh mysqld      Up      0.0.0.0:3306->3306/tcp                        
javaee_web_1   /bin/sh -c java -jar /opt/ ...   Up      0.0.0.0:8080->8080/tcp, 0.0.0.0:9990->9990/tcp
```

This provides a consolidated view of all the services, and containers within each of them.

Alternatively, the containers in this application, and any additional containers running on this Docker host can be verified by using the usual `docker container ls` command:

```
    Name                  Command               State                       Ports                     
------------------------------------------------------------------------------------------------------
db             docker-entrypoint.sh mysqld      Up      0.0.0.0:3306->3306/tcp                        
javaee_web_1   /bin/sh -c java -jar /opt/ ...   Up      0.0.0.0:8080->8080/tcp, 0.0.0.0:9990->9990/tcp
javaee $ docker container ls
CONTAINER ID        IMAGE                                   COMMAND                  CREATED             STATUS              PORTS                                            NAMES
e862a5eb9484        arungupta/docker-javaee:dockerconeu17   "/bin/sh -c 'java ..."   38 seconds ago      Up 36 seconds       0.0.0.0:8080->8080/tcp, 0.0.0.0:9990->9990/tcp   javaee_web_1
08792c20c066        mysql:8                                 "docker-entrypoint..."   39 seconds ago      Up 37 seconds       0.0.0.0:3306->3306/tcp                           db
```

Service logs can be seen using `docker-compose logs` command, and looks like:

```
Attaching to dockerjavaee_web_1, db
web_1  | 23:54:21,584 INFO  [org.jboss.msc] (main) JBoss MSC version 1.2.6.Final
web_1  | 23:54:21,688 INFO  [org.jboss.as] (MSC service thread 1-8) WFLYSRV0049: WildFly Core 2.0.10.Final "Kenny" starting
web_1  | 2017-10-06 23:54:22,687 INFO  [org.wildfly.extension.io] (ServerService Thread Pool -- 20) WFLYIO001: Worker 'default' has auto-configured to 8 core threads with 64 task threads based on your 4 available processors

. . .

web_1  | 2017-10-06 23:54:23,259 INFO  [org.jboss.as.connector.subsystems.datasources] (MSC service thread 1-3) WFLYJCA0001: Bound data source [java:jboss/datasources/ExampleDS]
web_1  | 2017-10-06 23:54:24,962 INFO  [org.jboss.as] (Controller Boot Thread) WFLYSRV0025: WildFly Core 2.0.10.Final "Kenny" started in 3406ms - Started 112 of 124 services (21 services are lazy, passive or on-demand)
web_1  | 2017-10-06 23:54:25,020 INFO  [org.wildfly.extension.undertow] (MSC service thread 1-4) WFLYUT0006: Undertow HTTP listener default listening on 0.0.0.0:8080
web_1  | 2017-10-06 23:54:26,146 INFO  [org.wildfly.swarm.runtime.deployer] (main) deploying docker-javaee.war
web_1  | 2017-10-06 23:54:26,169 INFO  [org.jboss.as.server.deployment] (MSC service thread 1-3) WFLYSRV0027: Starting deployment of "docker-javaee.war" (runtime-name: "docker-javaee.war")
web_1  | 2017-10-06 23:54:27,748 INFO  [org.jboss.as.jpa] (MSC service thread 1-2) WFLYJPA0002: Read persistence.xml for MyPU
web_1  | 2017-10-06 23:54:27,887 WARN  [org.jboss.as.dependency.private] (MSC service thread 1-7) WFLYSRV0018: Deployment "deployment.docker-javaee.war" is using a private module ("org.jboss.jts:main") which may be changed or removed in future versions without notice.

. . .

web_1  | 2017-10-06 23:54:29,128 INFO  [stdout] (ServerService Thread Pool -- 4) Hibernate: create table EMPLOYEE_SCHEMA (id integer not null, name varchar(40), primary key (id))
web_1  | 2017-10-06 23:54:29,132 INFO  [stdout] (ServerService Thread Pool -- 4) Hibernate: INSERT INTO EMPLOYEE_SCHEMA(ID, NAME) VALUES (1, 'Penny')
web_1  | 2017-10-06 23:54:29,133 INFO  [stdout] (ServerService Thread Pool -- 4) Hibernate: INSERT INTO EMPLOYEE_SCHEMA(ID, NAME) VALUES (2, 'Sheldon')
web_1  | 2017-10-06 23:54:29,133 INFO  [stdout] (ServerService Thread Pool -- 4) Hibernate: INSERT INTO EMPLOYEE_SCHEMA(ID, NAME) VALUES (3, 'Amy')
web_1  | 2017-10-06 23:54:29,133 INFO  [stdout] (ServerService Thread Pool -- 4) Hibernate: INSERT INTO EMPLOYEE_SCHEMA(ID, NAME) VALUES (4, 'Leonard')

. . .

web_1  | 2017-10-06 23:54:30,050 INFO  [org.wildfly.extension.undertow] (ServerService Thread Pool -- 4) WFLYUT0021: Registered web context: /
web_1  | 2017-10-06 23:54:30,518 INFO  [org.jboss.as.server] (main) WFLYSRV0010: Deployed "docker-javaee.war" (runtime-name : "docker-javaee.war")
web_1  | 2017-10-06 23:56:01,766 INFO  [stdout] (default task-1) Hibernate: select employee0_.id as id1_0_, employee0_.name as name2_0_ from EMPLOYEE_SCHEMA employee0_
db     | Initializing database

. . .

db     | 
db     | 
db     | MySQL init process done. Ready for start up.
db     | 

. . .

db     | 2017-10-06T23:54:29.434423Z 0 [Note] /usr/sbin/mysqld: ready for connections. Version: '8.0.3-rc-log'  socket: '/var/run/mysqld/mysqld.sock'  port: 3306  MySQL Community Server (GPL)
db     | 2017-10-06T23:54:30.281973Z 0 [Note] InnoDB: Buffer pool(s) load completed at 171006 23:54:30
```


`depends_on` attribute in the Compose definition file ensures the container start up order. But application-level start up needs to be ensured by the applications running inside container. In our case, this can be achieved by WildFly Swarm using `swarm.datasources.data-sources.KEY.stale-connection-checker-class-name` as defined at https://reference.wildfly-swarm.io/fractions/datasources.html.

## Verify application

Now that the WildFly Swarm and MySQL have been configured, let's access the application. You need to specify IP address of the host where WildFly is running (`localhost` in our case).

The endpoint can be accessed in this case as:

```
curl -v http://localhost:8080/resources/employees
```

The output is shown as:

```
curl -v http://localhost:8080/resources/employees
*   Trying ::1...
* TCP_NODELAY set
* Connected to localhost (::1) port 8080 (#0)
> GET /resources/employees HTTP/1.1
> Host: localhost:8080
> User-Agent: curl/7.51.0
> Accept: */*
> 
< HTTP/1.1 200 OK
< Connection: keep-alive
< Content-Type: application/xml
< Content-Length: 478
< Date: Sat, 07 Oct 2017 00:05:41 GMT
< 
* Curl_http_done: called premature == 0
* Connection #0 to host localhost left intact
<?xml version="1.0" encoding="UTF-8" standalone="yes"?><collection><employee><id>1</id><name>Penny</name></employee><employee><id>2</id><name>Sheldon</name></employee><employee><id>3</id><name>Amy</name></employee><employee><id>4</id><name>Leonard</name></employee><employee><id>5</id><name>Bernadette</name></employee><employee><id>6</id><name>Raj</name></employee><employee><id>7</id><name>Howard</name></employee><employee><id>8</id><name>Priya</name></employee></collection>
```

This shows the result from querying the database.

A single resource can be obtained:

```
curl -v http://localhost:8080/resources/employees/1
```

It shows the output:

```
curl -v http://localhost:8080/resources/employees/1
*   Trying ::1...
* TCP_NODELAY set
* Connected to localhost (::1) port 8080 (#0)
> GET /resources/employees/1 HTTP/1.1
> Host: localhost:8080
> User-Agent: curl/7.51.0
> Accept: */*
> 
< HTTP/1.1 200 OK
< Connection: keep-alive
< Content-Type: application/xml
< Content-Length: 104
< Date: Sat, 07 Oct 2017 00:06:33 GMT
< 
* Curl_http_done: called premature == 0
* Connection #0 to host localhost left intact
<?xml version="1.0" encoding="UTF-8" standalone="yes"?><employee><id>1</id><name>Penny</name></employee>
```

## Shutdown application

Shutdown the application using `docker-compose down`:

```
Stopping javaee_web_1 ... done
Stopping db           ... done
Removing javaee_web_1 ... done
Removing db           ... done
Removing network javaee_default
```

This stops the container in each service and removes all the services. It also deletes any networks that were created as part of this application.

## Deploy application using Swarm mode

Docker Engine includes swarm mode for natively managing a cluster of Docker Engines. The Docker CLI can be used to create a swarm, deploy application services to a swarm, and manage swarm behavior. Complete details are available at: https://docs.docker.com/engine/swarm/. It's important to understand the https://docs.docker.com/engine/swarm/key-concepts/[Swarm mode key concepts] before starting with this chapter.

Swarm is typically a cluster of multiple Docker Engines. But for simplicity we'll run a single node Swarm.

This section will deploy an application that will provide a CRUD/REST interface on a data bucket in https://www.mysql.com/[MySQL]. This is achieved by using a Java EE application deployed on http://wildfly.org[WildFly] to access the database.

## Initialize Swarm

Initialize Swarm mode using the following command:

    docker swarm init

This starts a Swarm Manager. By default, a manager node is also a worker but can be configured to be a manager-only.

Find some information about this one-node cluster using the command `docker info`

```
Containers: 0
 Running: 0
 Paused: 0
 Stopped: 0
Images: 17
Server Version: 17.09.0-ce
Storage Driver: overlay2
 Backing Filesystem: extfs
 Supports d_type: true
 Native Overlay Diff: true
Logging Driver: json-file
Cgroup Driver: cgroupfs
Plugins:
 Volume: local
 Network: bridge host ipvlan macvlan null overlay
 Log: awslogs fluentd gcplogs gelf journald json-file logentries splunk syslog
Swarm: active
 NodeID: p9a1tqcjh58ro9ucgtqxa2wgq
 Is Manager: true
 ClusterID: r3xdxly8zv82e4kg38krd0vog
 Managers: 1
 Nodes: 1
 Orchestration:
  Task History Retention Limit: 5
 Raft:
  Snapshot Interval: 10000
  Number of Old Snapshots to Retain: 0
  Heartbeat Tick: 1
  Election Tick: 3
 Dispatcher:
  Heartbeat Period: 5 seconds
 CA Configuration:
  Expiry Duration: 3 months
  Force Rotate: 0
 Autolock Managers: false
 Root Rotation In Progress: false
 Node Address: 192.168.65.2
 Manager Addresses:
  192.168.65.2:2377
Runtimes: runc
Default Runtime: runc
Init Binary: docker-init
containerd version: 06b9cb35161009dcb7123345749fef02f7cea8e0
runc version: 3f2f8b84a77f73d38244dd690525642a72156c64
init version: 949e6fa
Security Options:
 seccomp
  Profile: default
Kernel Version: 4.9.49-moby
Operating System: Alpine Linux v3.5
OSType: linux
Architecture: x86_64
CPUs: 4
Total Memory: 1.952GiB
Name: moby
ID: TJSZ:O44Y:PWGZ:ZWZM:SA73:2UHI:VVKV:KLAH:5NPO:AXQZ:XWZD:6IRJ
Docker Root Dir: /var/lib/docker
Debug Mode (client): false
Debug Mode (server): true
 File Descriptors: 35
 Goroutines: 142
 System Time: 2017-10-05T20:57:14.037442426Z
 EventsListeners: 1
Registry: https://index.docker.io/v1/
Experimental: true
Insecure Registries:
 127.0.0.0/8
Live Restore Enabled: false
```

This cluster has 1 node, and that is a manager. By default, the manager node is also a worker node. This means the containers can run on this node.

== Multi-container application

This section describes how to deploy a multi-container application using Docker Compose to Swarm mode use Docker CLI. 

Create a new directory and `cd` to it:

    mkdir webapp
    cd webapp

Create a new Compose definition `docker-compose.yml` using this link:ch05-compose.adoc#configuration-file[ configuration file].

This application can be started as:

    docker stack deploy --compose-file=docker-compose.yml webapp

This shows the output as:

```
Ignoring deprecated options:

container_name: Setting the container name is not supported.

Creating network webapp_default
Creating service webapp_db
Creating service webapp_web
```

WildFly Swarm and MySQL services are started on this node. Each service has a single container. If the Swarm mode is enabled on multiple nodes then the containers will be distributed across them.

A new overlay network is created. This can be verified using the command `docker network ls`. This network allows multiple containers on different hosts to communicate with each other.

== Verify service and containers in application

Verify that the WildFly and MySQL services are running using `docker service ls`:

```
ID                  NAME                MODE                REPLICAS            IMAGE                                   PORTS
j21lwelj529f        webapp_db           replicated          1/1                 mysql:8                                 *:3306->3306/tcp
m0m44axt35cg        webapp_web          replicated          1/1                 arungupta/docker-javaee:dockerconeu17   *:8080->8080/tcp,*:9990->9990/tcp
```

More details about the service can be obtained using `docker service inspect webapp_web`:

```
[
    {
        "ID": "m0m44axt35cgjetcjwzls7u9r",
        "Version": {
            "Index": 22
        },
        "CreatedAt": "2017-10-07T00:17:44.038961419Z",
        "UpdatedAt": "2017-10-07T00:17:44.040746062Z",
        "Spec": {
            "Name": "webapp_web",
            "Labels": {
                "com.docker.stack.image": "arungupta/docker-javaee:dockerconeu17",
                "com.docker.stack.namespace": "webapp"
            },
            "TaskTemplate": {
                "ContainerSpec": {
                    "Image": "arungupta/docker-javaee:dockerconeu17@sha256:6a403c35d2ab4442f029849207068eadd8180c67e2166478bc3294adbf578251",
                    "Labels": {
                        "com.docker.stack.namespace": "webapp"
                    },
                    "Privileges": {
                        "CredentialSpec": null,
                        "SELinuxContext": null
                    },
                    "StopGracePeriod": 10000000000,
                    "DNSConfig": {}
                },
                "Resources": {},
                "RestartPolicy": {
                    "Condition": "any",
                    "Delay": 5000000000,
                    "MaxAttempts": 0
                },
                "Placement": {
                    "Platforms": [
                        {
                            "Architecture": "amd64",
                            "OS": "linux"
                        }
                    ]
                },
                "Networks": [
                    {
                        "Target": "bwnp1nvkkga68dirhp1ue7qey",
                        "Aliases": [
                            "web"
                        ]
                    }
                ],
                "ForceUpdate": 0,
                "Runtime": "container"
            },
            "Mode": {
                "Replicated": {
                    "Replicas": 1
                }
            },
            "UpdateConfig": {
                "Parallelism": 1,
                "FailureAction": "pause",
                "Monitor": 5000000000,
                "MaxFailureRatio": 0,
                "Order": "stop-first"
            },
            "RollbackConfig": {
                "Parallelism": 1,
                "FailureAction": "pause",
                "Monitor": 5000000000,
                "MaxFailureRatio": 0,
                "Order": "stop-first"
            },
            "EndpointSpec": {
                "Mode": "vip",
                "Ports": [
                    {
                        "Protocol": "tcp",
                        "TargetPort": 8080,
                        "PublishedPort": 8080,
                        "PublishMode": "ingress"
                    },
                    {
                        "Protocol": "tcp",
                        "TargetPort": 9990,
                        "PublishedPort": 9990,
                        "PublishMode": "ingress"
                    }
                ]
            }
        },
        "Endpoint": {
            "Spec": {
                "Mode": "vip",
                "Ports": [
                    {
                        "Protocol": "tcp",
                        "TargetPort": 8080,
                        "PublishedPort": 8080,
                        "PublishMode": "ingress"
                    },
                    {
                        "Protocol": "tcp",
                        "TargetPort": 9990,
                        "PublishedPort": 9990,
                        "PublishMode": "ingress"
                    }
                ]
            },
            "Ports": [
                {
                    "Protocol": "tcp",
                    "TargetPort": 8080,
                    "PublishedPort": 8080,
                    "PublishMode": "ingress"
                },
                {
                    "Protocol": "tcp",
                    "TargetPort": 9990,
                    "PublishedPort": 9990,
                    "PublishMode": "ingress"
                }
            ],
            "VirtualIPs": [
                {
                    "NetworkID": "vysfza7wgjepdlutuwuigbws1",
                    "Addr": "10.255.0.5/16"
                },
                {
                    "NetworkID": "bwnp1nvkkga68dirhp1ue7qey",
                    "Addr": "10.0.0.4/24"
                }
            ]
        }
    }
]
```

Logs for the service can be seen using `docker service logs -f webapp_web`:

```
webapp_web.1.lf3y5k7pkpt9@moby    | 00:17:47,296 INFO  [org.jboss.msc] (main) JBoss MSC version 1.2.6.Final
webapp_web.1.lf3y5k7pkpt9@moby    | 00:17:47,404 INFO  [org.jboss.as] (MSC service thread 1-8) WFLYSRV0049: WildFly Core 2.0.10.Final "Kenny" starting
webapp_web.1.lf3y5k7pkpt9@moby    | 2017-10-07 00:17:48,636 INFO  [org.wildfly.extension.io] (ServerService Thread Pool -- 20) WFLYIO001: Worker 'default' has auto-configured to 8 core threads with 64 task threads based on your 4 available processors

. . .

webapp_web.1.lf3y5k7pkpt9@moby    | 2017-10-07 00:17:56,619 INFO  [org.jboss.resteasy.resteasy_jaxrs.i18n] (ServerService Thread Pool -- 12) RESTEASY002225: Deploying javax.ws.rs.core.Application: class org.javaee.samples.employees.MyApplication
webapp_web.1.lf3y5k7pkpt9@moby    | 2017-10-07 00:17:56,621 WARN  [org.jboss.as.weld] (ServerService Thread Pool -- 12) WFLYWELD0052: Using deployment classloader to load proxy classes for module com.fasterxml.jackson.jaxrs.jackson-jaxrs-json-provider:main. Package-private access will not work. To fix this the module should declare dependencies on [org.jboss.weld.core, org.jboss.weld.spi]
webapp_web.1.lf3y5k7pkpt9@moby    | 2017-10-07 00:17:56,682 INFO  [org.wildfly.extension.undertow] (ServerService Thread Pool -- 12) WFLYUT0021: Registered web context: /
webapp_web.1.lf3y5k7pkpt9@moby    | 2017-10-07 00:17:57,094 INFO  [org.jboss.as.server] (main) WFLYSRV0010: Deployed "docker-javaee.war" (runtime-name : "docker-javaee.war")
```

Make sure to wait for the last log statement to show.

## Access application

Now that the WildFly and MySQL servers have been configured, let's access the application. You need to specify IP address of the host where WildFly is running (`localhost` in our case).

The endpoint can be accessed in this case as:

    curl -v http://localhost:8080/resources/employees

The output is shown as:

```
*   Trying ::1...
* TCP_NODELAY set
* Connected to localhost (::1) port 8080 (#0)
> GET /resources/employees HTTP/1.1
> Host: localhost:8080
> User-Agent: curl/7.51.0
> Accept: */*
> 
< HTTP/1.1 200 OK
< Connection: keep-alive
< Content-Type: application/xml
< Content-Length: 478
< Date: Sat, 07 Oct 2017 00:22:59 GMT
< 
* Curl_http_done: called premature == 0
* Connection #0 to host localhost left intact
<?xml version="1.0" encoding="UTF-8" standalone="yes"?><collection><employee><id>1</id><name>Penny</name></employee><employee><id>2</id><name>Sheldon</name></employee><employee><id>3</id><name>Amy</name></employee><employee><id>4</id><name>Leonard</name></employee><employee><id>5</id><name>Bernadette</name></employee><employee><id>6</id><name>Raj</name></employee><employee><id>7</id><name>Howard</name></employee><employee><id>8</id><name>Priya</name></employee></collection>
```

This shows all employees stored in the database.

## Stop application

If you only want to stop the application temporarily while keeping any networks that were created as part of this application, the recommended way is to set the amount of service replicas to 0.

    docker service scale webapp_db=0 webapp_web=0

It shows the output:

```
webapp_db scaled to 0
webapp_web scaled to 0
Since --detach=false was not specified, tasks will be scaled in the background.
In a future release, --detach=false will become the default.
```

This is especially useful if the stack contains volumes and you want to keep the data. It allows you to simply start the stack again with setting the replicas to a number higher than 0.

== Remove application completely

Shutdown the application using `docker stack rm webapp`:

```
Removing service webapp_db
Removing service webapp_web
Removing network webapp_default
```

This stops the container in each service and removes the services. It also deletes any networks that were created as part of this application.


## Docker and NetBeans

This chapter will show you basic Docker tooling with NetBeans:

- Pull/Build Docker images
- Run/Start/Stop Docker containers

NOTE: NetBeans only supports configuring Docker Engine running using Docker Toolbox. This means that if you are running Docker for Mac or Docker for Windows then NetBeans cannot be used.

## Configure Docker Host

In "`Services`" window, right-click on "`Docker`", click on "`Add Docker...`"

![My Image](docker-netbeans-add-docker.png)

Specify Docker Machine coordinates, click on "`Test Connection`" to validate the connection:

![My Image](docker-netbeans-add-docker-instance.png)

NOTE: No support for Docker for Mac/Windows, filed as https://netbeans.org/bugzilla/show_bug.cgi?id=262398[#262398].

Click on "`Finish`" to see:

![My Image](docker-netbeans-added-docker-instance.png)

Expand the connection to see "`Images`" and "`Containers`".

## Pull an Image

Right-click on Docker node and select "`Pull...`".

![My Image](docker-netbeans-pull-image.png)

Type the image name to narrow down the search from Docker Store:

![My Image](docker-netbeans-search-image.png)

Click on "`Pull`" to pull the image.

Log is updated in the Output window:

![My Image](docker-netbeans-pull-image-output.png)

This image is now shown in Services tab

![My Image](docker-netbeans-pulled-image.png)

Any existing images on the Docker Host will be shown here as well.

## Run a Container

Select an image, right-click on it, and click on "`Run...`".

![My Image](docker-netbeans-run-container.png)

This brings up a dialog that allows the options that can be configured for running the container. Some of them are:

- Container name
- Override the command
- Keep STDIN open and allocate pseudo-TTY (`-it` on CLI)
- Publish ports on Docker host interface (`-P` or `-p` in `docker run` command)

![My Image](docker-netbeans-run-container-option1.png)

Click on "`Next>`" to see the options to configure exposed ports. Click on "`Add`" to explicitly map host port "`8091`" to container port "`8091`".

![My Image](docker-netbeans-run-container-option2.png)

Click on "`Finish`" to run the container. "`Services`" window is updated as:

![My Image](docker-netbeans-run-container-services.png)

Log is shown in the "`Output`" window:

![My Image](docker-netbeans-run-container-log.png)

Right-click on the container, select "`Show Log`" to show the log generated by the container. The container can be paused and stopped from here as well.

## Build an Image

On the configured Docker Host, right-click and select "`Build...`" to build a new image:

![My Image](docker-netbeans-build-image.png)

Specify a directory where `Dockerfile` exists, give the image name:

![My Image](docker-netbeans-build-image-option1.png)

Click on "`Next>`", choose the options that matter:

![My Image](docker-netbeans-build-image-option2.png)

Click on "`Finish`" to build the image. The image is shown in the "`Services`" window:

![My Image](docker-netbeans-build-image-services.png)


## Docker and IntelliJ IDEA

This chapter will show you basic Docker tooling with IntelliJ IDEA:

- Pull Docker images
- Run, stop, delete a Container
- Build an Image

## Install Docker Plugin in IDEA

Go to "`Preferences`", "`Plugins`", "`Install JetBrains plugin...`", search on "`docker`" and click on "`Install`"

![My Image](docker-intellij-plugin-install.png)

Restart IntelliJ IDEA to active plugin.

Click on "`Create New Project`", select "`Java`", "`Web Application`"

![My Image](docker-intellij-create-java-project.png)

Click on "`Next`", give the project a name "`dockercon`", click on "`Finish`". This will open up the project in IntelliJ window.

Go to "`Preferences`", "`Clouds`", add a new deployment by clicking on "`+`". Click on "`Import credentials from Docker Machine`", "`Detect`", and see a successful connection. You may have to check the IP address of your Docker Machine. Find the IP address of your Docker Machine as `docker-machine ip <machine-name>` and specify the correct IP address here.

![My Image](docker-intellij-cloud-connection.png)

Go to "`View`", "`Tool Windows`", "`Docker Tooling Window`". Click on "`Connect`"" to connect with Docker Machine. Make sure Docker Machine is running. 

WARNING: IDEA does not work with "`Docker for Mac`" at this time. (ADD BUG #)

![My Image](docker-intellij-tool-window.png)

## Pull an Image

Select top-level node with the name "`Docker`", click on "`Pull image`"

![My Image](docker-intellij-pull-image.png)

Type an image name, such as `arungupta/couchbase`, and "`OK`"

![My Image](docker-intellij-repository-name.png)

Expand "`Containers`" and "`Images`" to see existing running containers and images.

The specified image is now downloaded and shown as well.

## Run a Container

Select the downloaded image, click on "`Create container`"

Select "`After launch`" and enter the URL as `http://192.168.99.100:8091`. Make sure to match the IP address of your Docker Machine.

![My Image](docker-intellij-deployment-after-launch.png)

In "`Container`" tab, add "`Port bindings`" for `8091:8091`

![My Image](docker-intellij-container-ports.png)

Click on "`Run`" to run the container.

This will bring up the browser window and display the page http://192.168.99.100:8091 and looks like:

![My Image](docker-intellij-run-container-browser.png)

This image uses http://developer.couchbase.com/documentation/server/current/rest-api/rest-endpoints-all.html[Couchbase REST API] to configure the Couchbase server. 

Right-click on the running container, select "`Inspect`" to see more details about the container.

![My Image](docker-intellij-container-inspect.png)

Click on "`Stop container`" to stop the container and "`Delete container`" to delete the container.

## Build an Image

- Refer to the instructions https://www.jetbrains.com/help/idea/2016.1/docker.html

- Right-click on the project, create a new directory `docker-dir`
- Artifact
  - Click on top-right for "`Project Structure`"
  -  select "`Artifacts`"
  - change "`Type:`" to "`Web Application: Archive`"
  - change the name to `dockercon`
  - change `Output directory` to `docker-dir`
- Create "`Dockerfile`" in this directory. Use the contents


```
FROM jboss/wildfly

ADD dockercon.war /opt/jboss/wildfly/standalone/deployments/
```


- "`Run`", "`Edit Configurations`", add new "`Docker Deployment`"
  -  "`Deployment`" tab
     - Change the name to `dockercon`
     - Select "`After launch`", change the URL to "`http://192.168.99.100:18080/dockercon/index.jsp`"
     - In "`Before launch`", add "`Build Artifacts`" and select the artifact
   -  "`Container`" tab
     -  Add "`Port bindings`" for "`8080:18080`"
- View, Tool Windows, Docker, connect to it
- Run the project

# Docker and Eclipse

This chapter will show you basic Docker tooling with Eclipse:

- Pull/Push/Build Docker images
- Run/Start/Stop/Kill Docker containers
- Customize views

Watch a quick video explaining the key steps in https://www.youtube.com/watch?v=XmhEZiS26os.

## Install Docker Tooling in Eclipse

Download http://www.eclipse.org/downloads/eclipse-packages/[Eclipse IDE for Java EE Developers] and install.

Go to "`Help`" menu, "`Install New Software...`".

Select Eclipse update site for the release, search for Docker, select "`Docker Tooling`".

![My Image](docker-eclipse-update-site-selection.png)

Click on "`Next>`", "`Next>`", accept the license agreement, click on "`Finish`" to start the installation.

Restart Eclipse for the installation to complete.

## Docker Perspective and View

Go to "`Window`", "`Perspective`", "`Open Perspective`", "`Other...`", "`Docker Tooling`".

![My Image](docker-eclipse-docker-perspective.png)

Click on "`OK`" to see the perspective.

![My Image](docker-eclipse-docker-perspective-default-look.png)

This has three views:

- *Docker Explorer*: a tree view listing all connected Docker instances, with image and containers.
- *Docker Images*: a table view listing containers for selected Docker connection.
- *Docker Containers*: a table view listing containers for selected Docker connection

Click on the text in Docker Explorer to create a new connection. If you are on Mac/Windows, you are likely using Docker for Mac/Windows or Docker Toolbox to setup Docker Host. Eclipse allows to configure Docker Engine using both Docker for Mac/Windows and Docker Toolbox.

If you are using Docker for Mac/Windows, then the default values are shown:

![My Image](docker-eclipse-docker-connection.png)

Click on "`Test Connection`" to test the connection.

![My Image](docker-eclipse-docker-connection-test.png)

If you are using Toolbox, enter the values as shown:

![My Image](docker-eclipse-docker-connection-toolbox.png)

The exact value of TCP Connection can be found using `docker-machine ls` command. The path for authentication is the directory name where certificates for your Docker Machine, `couchbase` in this case, are stored.

Click on "`Test Connection`" to make sure the connection is successfully configured.

![My Image](docker-eclipse-docker-connection-test-toolbox.png)

In either case, the configuration can be completed once the connection is tested. Click on "`Finish`" to complete the configuration.

Docker Explorer is updated to show the connection.

Containers and Images configured for the Docker Machine are shown in tabs. They can be expanded to see the list in Explorer itself.

## Pull an Image

Expand the connection to see "`Containers`" and "`Images`".

Right-click on "`Images`" and select "`Pull...`".

Type the image name and click on "`Finish`".

![My Image](docker-eclipse-pull-image.png)

This image is now shown in Explorer and Docker Images tab.

![My Image](docker-eclipse-pulled-image.png)

Any existing images on the Docker Host will be shown here.

## Run a Container

Select an image, right-click on it, and click on "`Run...`". It shows the options that can be configured for running the container. Some of them are:

- Publish ports on Docker host interface (`-P` or `-p` in `docker run` command)
- Keep STDIN open and allocate pseudo-TTY (`-it` on CLI)
- Remove container after it exits (`--rm` on CLI)
- Volume mapping (`-v` on CLI)
- Environment variables (`-e` on CLI)

Uncheck "`Publish all exposed ports`" box to map to corresponding ports.

![My Image](docker-eclipse-run-container-config.png)

Click on "`Finish`" to run the container.

Right-click on the started container, select "`Display Log`" to show the log.

![My Image](docker-eclipse-container-display-log.png)

The container can be paused, stopped and killed from here as well.

To see more details about the container, right-click on the container, select "`Show In`", "`Properties`".

![My Image](docker-eclipse-container-properties.png)

## Build an Image

In Docker Images tab, click on the hammer icon on top right.

Give the image name, specify an empty directory, click on "`Edit Dockerfile`" to edit the contents of Dockerfile

![My Image](docker-eclipse-build-image.png)

Click on "`Save`" and "`Finish`" to create the image.



