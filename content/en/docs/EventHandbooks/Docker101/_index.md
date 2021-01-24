---
title: "Docker101"
linkTitle: "Docker101"
weight: 30
description: >-
     Docker Workshops for Beginners
---

## Docker101 Workshop Handbook

This handbook will help you run a Docker 101 workshop from A to Z. This will cover every aspect of conducting workshop starting from setting up an event page till the completion of the successful workshop. 

### Characteristics of this workshop

- Audience : 5 to 100
- Technical Skills Required : Basic knowledge of Linux, Basic concepts of Docker
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
5 | [Conducting Attendee Survey](/housekeeping/attendeesurvey/README.md) |  ☑️ |

### After the workshop

S.No. | Name of Objectives | Status | 
:------------ | :-------------| :-------------|
6 | [Post-Event FollowUp](/housekeeping/postevent/README.md) |  ☑️ |
7 | [Community Leader Survey](/housekeeping/clsurvey/README.md)  |  ☑️ |
8 | [Attendee Survey](/housekeeping/attendeesurvey/README.md)  |  ☑️ |

## Recommended Agenda

| Description | Timing |
| --- | --- |
| Welcome | 8:45 AM to 9:00 AM |
| [Creating a DockerHub Account](dockerhub/dockerhub.md) | 9:00 AM to 9:15 AM |
| [Getting Started with Docker Image](#getting-started-with-docker-image---1-hour) | 9:15 AM to 10:15 AM |
| [Accessing & Managing Docker Container](#accessing--managing-docker-container---1-hour) | 10:15 AM to 11:15 AM |
| Coffee/Tea Break | 11:15 AM to 11:30 AM |
| [Getting Started with Dockerfile - Part 1](#getting-started-with-dockerfile---3-hours) | 11:30 AM to 1:00 PM|
| Lunch | 1:00 PM to 2:00 PM |
| [Getting Started with Dockerfile - Part 2](#getting-started-with-dockerfile---3-hours)| 2:00 PM to 3:30 PM |
| [Creating Private Docker Registry](#creating-private-docker-registry---30-min) | 3:30 PM to 4:00 PM|
| [Docker Volumes](#docker-volumes---30-min) | 4:00 PM to 4:30 PM |
| Coffee/Tea Break | 4:00 PM to 4:30 PM |
| [Docker Networking](#docker-networking---1-hour) | 4:45 PM to 5:45 PM |
| Quiz/Prize/Certificate Distribution | 5:45 PM to 6:00 PM |



## Pre-requisite:

- [Creating Your DockerHub Account](dockerhub/dockerhub.md) - 15 min

### Getting Started with Docker Image - 1 hour

- [Running Hello World Example](/helloworld/README.md)  
- [Working with Docker Image](/beginners/workingwithdockerimage/workingwithdockerimage.md) 
- [Saving Images and Containers as Tar Files for Sharing](/beginners/saving-images-as-tar/README.md)
- [Building Your First Alpine Docker Image and Push it to DockerHub](/building/building-your-first-alpine-container.md)
- [Test Your Knowledge](/beginners/quiz1/README.md)

###  Accessing & Managing Docker Container - 1 hour

- [Accessing the Container Shell](/beginners/accessing-the-container/README.md)
- [Running a Command inside running Container](/beginners/running-command-inside-running-container/README.md)
- [Managing Docker Containers](/beginners/managing-containers/README.md)
- [Test Your Knowledge](/beginners/quiz2/README.md)

### Getting Started with Dockerfile - 3 hours

- [What is a Dockerfile?](/beginners/dockerfile/what-is-dockerfile/README.md)
- [Understanding Layering Concept with Dockerfile](/beginners/dockerfile/layering-dockerfile/README.md)
- Creating Docker Image with
   - [Installing GIT](/beginners/dockerfile/lab-create-image/01-with-git.md)
   - [ADD instruction](/beginners/dockerfile/lab-create-image/02-with-ADD.md)
   - [COPY instruction](/beginners/dockerfile/lab-create-image/03-with-COPY.md)
   - [CMD instruction](/beginners/dockerfile/lab-create-image/04-with-CMD.md)
   - [ENTRYPOINT instruction](/beginners/dockerfile/lab-create-image/05-with-ENTRYPOINT.md)
   - [WORKDIR instruction](/beginners/dockerfile/lab-create-image/06-with-WORKDIR.md)
   - [RUN instruction](/beginners/dockerfile/lab-create-image/07-with-EXPOSE.md)
   - [ARG instruction](/beginners/dockerfile/lab-create-image/08-with-ARG.md)
   - [ENV instruction](/beginners/dockerfile/lab-create-image/09-with-ENV.md)
   - [VOLUME instruction](/beginners/dockerfile/lab-create-image/10-with-VOLUME.md)
   - [EXPOSE instruction](/beginners/dockerfile/lab-create-image/11-with-EXPOSE.md)
   - [LABEL instruction](/beginners/dockerfile/lab-create-image/12-with-LABEL.md)
   - [ONBUILD instruction](/beginners/dockerfile/lab-create-image/13-with-ONBUILD.md)
   - [HEALTHCHECK instruction](/beginners/dockerfile/lab-create-image/14-with-HEALTHCHECK.md)
   - [SHELL instruction](/beginners/dockerfile/lab-create-image/15-with-SHELL.md)
   - [USER instruction](/beginners/dockerfile/lab-create-image/16-with-USER.md)
- [ENTRYPOINT vs RUN](/beginners/dockerfile/entrypoint-vs-run/)
- [Writing Dockerfile with Hello Python Script Added](/beginners/dockerfile/lab_dockerfile_python/)
- [Test Your Knowledge](/beginners/dockerfile/quiz3/README.md)

### Creating Private Docker Registry - 30 min

- [Building a Private Docker Registry](/beginners/docker-registry/README.md)
- [Test Your Knowledge](/beginners/docker-registry/quiz4/README.md)

### Docker Volumes - 30 min

- [Managing volumes through Docker CLI](/beginners/volume/manage-via-cli/README.md)
- [Creating Volume Mount from **docker run** command & sharing same Volume Mounts among multiple containers](/beginners/volume/with-docker-run/README.md)
- [Test Your Knowledge](/beginners/volume/quiz5/README.md)

### Docker Networking - 1 hour

 - [The docker network Command](/beginners/networking/using-docker-network/README.md)
 - [Lab #1: Listing the Networks](/beginners/networking/using-docker-network/A1-network-basics.md#step-2-list-networks)
 - [Lab #2: Inspecting a Network](/beginners/networking/using-docker-network/A1-network-basics.md#step-3-inspect-a-network)
 - [Lab #3: List network driver plugins](/beginners/networking/using-docker-network/A1-network-basics.md#step-4-list-network-driver-plugins)
 - [Lab #4: Docker Bridge Networking](/beginners/networking/using-docker-network/A2-bridge-networking.md)
   - [Lab #5: Basics of Docker Bridge Networking](/beginners/networking/using-docker-network/A2-bridge-networking.md#step-1-the-default-bridge-network)
   - [Lab #6: Connect a Docker container to bridge network](/beginners/networking/using-docker-network/A2-bridge-networking.md#step-2-connect-a-container)
   - [Lab #7: Test Network Connectivity](/beginners/networking/using-docker-network/A2-bridge-networking.md#step-3-test-network-connectivity)
   - [Lab #8: Configure NAT for external connectivity](/beginners/networking/using-docker-network/A2-bridge-networking.md#step-4-configure-nat-for-external-connectivity)
 - [Test Your Knowledge](/beginners/networking/quiz6/README.md)


## Getting Familiar with Bevy Virtual

