---
title: "Prerequisite"
linkTitle: "Prerequisite"
weight: 606
description: >-
     Installing Go on Linux, Mac and Windows
---



## Setup Environment

This section describes the hardware and software needed for this workshop, and how to configure them.
This workshop is designed for a BYOL (Bring Your Own Laptop) style hands-on-lab.

### Hardware & Software

- Memory: At least 4 GB+, strongly preferred 8 GB
- Operating System: Mac OS X (10.10.3+), Windows 10 Pro+ 64-bit, Ubuntu 12+, CentOS 7+.

### Install Docker

Docker runs natively on Mac, Windows and Linux.
This lab will use [Docker Community Edition (CE)](https://www.docker.com/community-edition).
Download the Docker CE edition for your machine from the [Docker Store](https://store.docker.com/search?type=edition&offering=community).

_NOTE_: Docker CE requires a fairly recent operating system version.
If your machine does not meet the requirements, then you need to install [Docker Toolbox](https://www.docker.com/products/docker-toolbox).

This workshop is tested with Docker Community Edition `19.03.13-ce-rc10, build fec3683` on Ubuntu `20.04.1 LTS`.

### Docker Images

This tutorial uses a few Docker images and software.
Let's download them before we start the tutorial.

In order to download the Docker images we will be using `docker-compose`.
You can install `docker-compose` following the instructions provided in the doc [here](https://docs.docker.com/compose/install/).

Now, download the [docker-compose-pull-images.yml](https://raw.githubusercontent.com/docker-community-leaders/dockercommunity/master/content/en/docs/CommunityLeaders/EventHandbooks/Go/prerequisite/docker-compose-pull-images.yml) file and use the following command to pull the required images:

```
curl -O https://raw.githubusercontent.com/docker-community-leaders/alphasite/master/pages/handbooks/go/scripts/docker-compose-pull-images.yml
docker-compose -f docker-compose-pull-images.yml pull --parallel
```

### Other Software

The softwares in this section are specific to certain parts of the workshop.
Install them only if you plan to attempt them.

- Install [git](https://git-scm.com)
- Install [Go](https://golang.org/doc/install)
- Download and install a code editor of your choice:
   - [Visual Studio Code](https://code.visualstudio.com/download)
   - [GoLand](https://www.jetbrains.com/go/download/)
   - [Sublime Text](https://www.sublimetext.com/3)

- Download and install Java IDE of your choice:

S.No. | Name of Software | Link to Follow | 
:------------ | :-------------| :-------------|
1 |  Git | [Link](https://git-scm.com)  |
2 |  Go | [Link](https://golang.org/doc/install)  |
3 |  Visual Studio Code | [Link](https://code.visualstudio.com/download)  |
4 |  GoLand | [Link](https://www.jetbrains.com/go/download/)  |
5 |  Sublime Text 3 | [Link](https://www.sublimetext.com/3)  |

# Download Golang 

You can download the latest version of GoLang (Golang 15.7 ) from the below links:

- [Windows](https://golang.org/dl/go1.15.7.windows-amd64.msi)
- [MacOS ](https://golang.org/dl/go1.15.7.darwin-amd64.pkg)
- [Linux](https://golang.org/dl/go1.15.7.linux-amd64.tar.gz)
- [Using Source](https://golang.org/dl/go1.15.7.src.tar.gz)


# Install Golang

Select the tab for your computer's operating system below, then follow its installation instructions.


{{< tabs name="Install Golang" >}}
{{% tab name="Linux" %}}

- 1. if you have a previous version of Go installed, be sure to [remove it]()https://golang.org/doc/manage-install before installing another.

Download the archive and extract it into `/usr/local`, creating a Go tree in `/usr/local/go`.
For example, run the following as root or through sudo:

```bash
tar -C /usr/local -xzf go1.15.7.linux-amd64.tar.gz

```
- 2. Add `/usr/local/go/bin` to the PATH environment variable.
You can do this by adding the following line to your $HOME/.profile or /etc/profile (for a system-wide installation):

```
export PATH=$PATH:/usr/local/go/bin

```
{{< note >}}
 Changes made to a profile file may not apply until the next time you log into your computer. To apply the changes immediately, just run the shell commands directly or execute them from the profile using a command such as source `$HOME/.profile`.
{{< /note >}}

- 3. Verify that you've installed Go by opening a command prompt and typing the following command:

```bash

$ go version

```
4. Confirm that the command prints the installed version of Go.

{{% /tab %}}

{{% tab name="Mac" %}}



1.Open the package file you downloaded and follow the prompts to install Go.

The package installs the Go distribution to /usr/local/go. The package should put the /usr/local/go/bin directory in your PATH environment variable. You may need to restart any open Terminal sessions for the change to take effect.

```bash

$ go version
```
3. Confirm that the command prints the installed version of Go.


{{% /tab %}}

{{% tab name="Windows" %}}



- 1. Open the MSI file you downloaded and follow the prompts to install Go.
     By default, the installer will install Go to C:\Go. You can change the location as needed. After installing, you will need to close and reopen any open command prompts so that changes to the environment made by the installer are reflected at the command prompt.
     
- 2. Verify that you've installed Go.

1.In Windows, click the Start menu. <br>
2.In the menu's search box, type cmd, then press the Enter key. <br>
3.In the Command Prompt window that appears, type the following command: <br>

```bash

$ go version

```
- 3. Confirm that the command prints the installed version of Go.

{{% /tab %}}

{{< /tabs >}}

