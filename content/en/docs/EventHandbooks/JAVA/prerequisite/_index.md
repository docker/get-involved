---
title: "Pre-requisite"
linkTitle: "Pre-requisite"
weight: 302
description: >-
     Pre-requisite
---



### [Setting up Infrastructure](#setting-up-infrastructure) - 30 min

- [Setup a Docker Environment](#setup-a-docker-environment)

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
