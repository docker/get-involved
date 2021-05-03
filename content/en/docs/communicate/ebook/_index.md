---
title: "Docker Community Book"
linkTitle: "Docker Community Book"
weight: 160
description: >-
     A Docker Book built by the Community
---

The Docker community has gathered together to create a book called "The Docker Community Book". This book is targeted at Beginners, intermediate as well as advanced users of Docker. It's not owned by a single author or any publisher. It's an open community book and dedicated to all Docker community members, contributors as well as community influencers.

## Table of Contents

## Introduction

- Who Should Read This Book?
- Command line Examples
- Q&A and Quizzes 
- Deep Dive & Architecture
- Conventions Used in this book



## [Chap 1.  Getting Started](https://github.com/docker/get-involved/tree/master/content/en/docs/communicate/ebook/chap1)

- What are containers & what are they used for?
- What is Docker?
- Difference between Docker & Container
- Difference between Docker & Virtual Machine
- Understanding Docker underlying technologies
- Architecture of Docker
- How do I install Docker
- Running the first “Hello World” container

## [Chap 2.Installing, Upgrading, and Maintaining Docker](https://github.com/docker/get-involved/tree/master/content/en/docs/communicate/ebook/chap2)

- Installing Docker on Linux
  - Ubuntu 
  - Debian
  - Red Hat Enterprise Linux
  - OpenSUSE
- Alpine OS
- Installing Docker on Cloud
  - AWS
  - Google Cloud
  - Microsoft Azure
  - Digitalocean
- Installing Docker on IoT
  - Raspberry Pi
  - NVIDIA Jetson Nano
  - Arduino
- Installing Docker on Pinebook Pro
- Installing Docker on NVIDIA Jetson Nano
- Installing Docker Desktop for Mac
- Installing Docker Desktop for Windows 
- Installing Docker on Windows Server

## [Chap 3.  Understanding Docker components](https://github.com/docker/get-involved/tree/master/content/en/docs/communicate/ebook/chap3)

- Docker Client-Server architecture
- Docker Daemon
- What is a Docker Image?
- Building Your Own Docker Image from Scratch
- What is a Docker container?
- Difference between Docker Image & Docker container
- What is a Docker registry?
- How to build a local private Docker registry?


## [Chap 4.  Working with Docker Image and container](https://github.com/docker/get-involved/tree/master/content/en/docs/communicate/ebook/chap4)

- Listing the Docker images
- Listing the Docker images by names and tags
- Listing the full-length Docker Image IDs
- Listing out the Docker images with filters
- Saving Docker images and containers as tar files for sharing
- Building your first Alpine images
- Pushing the Docker image to DockerHub
- Listing the Docker containers
- Accessing the container shell
- Executing a command in Docker container
- Managing Docker containers

## [Chap 5. Introduction to Docker Hub](https://github.com/docker/get-involved/tree/master/content/en/docs/communicate/ebook/chap5)

- What is Docker Hub?
- Installing the hub-CLI tool
- Managing Your Docker Hub Account
- Managing Your Docker Hub Org
- Managing Your Personal Access Tokens
- Managing Your Docker Hub Repositories
- Managing Your Docker Hub Tags

## [Chap 6.   Getting Started with Dockerfile](https://github.com/docker/get-involved/tree/master/content/en/docs/communicate/ebook/chap6)

- What is Dockerfile?
- Understanding Layering Concept with Dockerfile
- Installing GIT
- ADD instruction
- COPY instruction
- CMD instruction
- ENTRYPOINT instruction
- WORKDIR instruction
- RUN instruction
- ARG instruction
- ENV instruction
- VOLUME instruction
- EXPOSE instruction
- DEL instruction
- ONBUILD instruction
- HEALTHCHECK instruction
- SHELL instruction
- Entrypoint Vs RUN
- USER instruction
- Writing Dockerfile with Hello Python Script Added

## [Chap 7.  Docker networking](https://github.com/docker/get-involved/tree/master/content/en/docs/communicate/ebook/chap7)

- Introduction
- How does Docker networking work?
- Listing the Networks
- Inspecting a Network
- List network driver plugins
-  Docker Bridge Networking
-  Basics of Docker Bridge Networking
-  Connect a Docker container to bridge the network
-  Test Network Connectivity
-  Configure NAT for external connectivity
-  Overview of MACVLAN networking
-  Create an overlay network
-  Create a service
-  Test Service Discovery
-  Test Routing Mesh
-  Test standalone containersinOverlayNetwork


## [Chap 8. Docker Volume](https://github.com/docker/get-involved/tree/master/content/en/docs/communicate/ebook/chap8)

- Introduction to Docker volume
- Creating a volume
- Listing volumes
- Managing volumes
- Removing the volumes
- Start a container with a volume
- Use a volume with Docker Compose
- Sharing volume mounts among multiple containers
- Start service with Docker volume
- Populate a volume using Docker container

## [Chap 9.  Getting Started with Docker Compose](https://github.com/docker/get-involved/tree/master/content/en/docs/communicate/ebook/chap9)

- Introduction to Docker Compose
- Dockerfile Vs Docker compose
- How to Install Docker Compose?
   - version Command
   - help Command
   - Config Command
   - Build Command
   - Pull Command
   - Push Command
   - up Command
   - Images Command
   - ps Command
   - Stop Command
   - Start Command
   - Restart Command
   - pause Command
   - Unpause Command
   - Logs Command
   - Port Command
   - Run Command
   - Scale Command
   - Exec Command
   - Kill Command
   - Rm Command
   - Down Command
- Create the first docker-compose file with Ngnix and MySQL
- Use JSON instead of YAML compose file in Docker?
- A Simple WordPress Application running on Single Node using Docker Compose

## [Chap 10 Getting Started with Docker Swarm](https://github.com/docker/get-involved/tree/master/content/en/docs/communicate/ebook/chap10)

- What is Docker Swarm
- Docker Swarm: Terminology
- Docker Services | Scaling | Draining Node | Rescheduling Containers
- Creating Node Docker Swarm Cluster
- Creating Overlay Network
- Deploy Services
- Inspecting Docker Swarm Service States
- Scaling Docker Swarm Services
- Deploy the application components as Docker services
- Drain a node and reschedule the containers
- Cleaning Up

## Chap 11. Introduction to Docker Security

- Introduction to Docker Content Trust
- Pulling images by tag
- Pulling images by digest
- Docker Content Trust
- Official Images
- Extra for experts
- Enable Docker Content Trust
- Push & Sign an Image
- Cleaning Up

## Chap 12.  Docker Secrets Management

- Create a Secret
- Manage Secrets
- Access the secret within an app
- Clean-up

## Chap 13.  Docker Network Security
- Create an encrypted overlay network
- List networks
- Deploy a service
- Clean-up

## Chap 14.  Docker Security Scanning

- Create a private Hub repo
- Pull an image
- Tag and push an image
- View scan results
- Clean-up

## Chap 15.  Docker Swarm Mode Security

- Create a new Swarm
- Add a new Manager
- Add a new Worker
- Rotate Join Keys
- View certificates
- Rotate certificates

## Chap 16.  Using Docker Desktop

- Running Nginx application on Docker Desktop
- Running Kubernetes on Docker Desktop
- Running Elastic Slack on Docker Desktop
- Setting up Google Kubernetes Engine using Docker Desktop
- Building a spring boot application using Docker Desktop
- NFS volume sharing using Docker Desktop

## Chap 17.  Building Multi-architecture Docker Images using buildx

- What is buildx?

## Chap 18.  Use cases of Docker

- Building a WordPress application using Docker
- Building a sample voting application using Docker
- Building a CCTV camera using Docker on Raspberry Pi
- Running a visualizer tool using Docker

