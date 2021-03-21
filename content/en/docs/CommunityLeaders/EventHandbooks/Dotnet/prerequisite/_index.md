---
title: "Prerequisite"
linkTitle: "Prerequisite"
weight: 804
description: >-
     Installing Dotnet on Linux, Mac and Windows
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
- Install [Go](https://dotnet.microsoft.com)
- Download and install a code editor of your choice:
   - [Visual Studio Code](https://code.visualstudio.com/download)
   - [GoLand](https://www.jetbrains.com/go/download/)
   - [Sublime Text](https://www.sublimetext.com/3)

- Download and install Java IDE of your choice:

S.No. | Name of Software | Link to Follow | 
:------------ | :-------------| :-------------|
1 |  Git | [Link](https://git-scm.com)  |
2 |  Dotnet | [Link](https://dotnet.microsoft.com)  |
3 |  Visual Studio Code | [Link](https://code.visualstudio.com/download)  |
4 |  GoLand | [Link](https://www.jetbrains.com/go/download/)  |
5 |  Sublime Text 3 | [Link](https://www.sublimetext.com/3)  |

# Download Dotnet 

You can download the latest version of Dotnet (5.0) from the below links:

- [Windows](https://download.visualstudio.microsoft.com/download/pr/78a6328f-f563-4a7f-a478-3ed0f2ce8ec6/5beb762f64d8a018a5b9e590bc1531e0/dotnet-sdk-5.0.201-win-x64.exe)
- [MacOS ](https://download.visualstudio.microsoft.com/download/pr/de613120-9306-4867-b504-45fcc81ba1b6/2a03f18c549f52cf78f88afa44e6dc6a/dotnet-sdk-5.0.201-osx-x64.pkg)
- [Linux](https://docs.microsoft.com/dotnet/core/install/linux)


# Check Installation

Select the tab for your computer's operating system below, then follow its instructions.


{{< tabs name="Checking Installation" >}}
{{% tab name="Linux" %}}

After you've installed, open a new terminal and run the following command:

```bash
dotnet

```

You should be able to see the output like

```
Usage: dotnet [options]
Usage: dotnet [path-to-application]

Options:
-h|--help         Display help.
--info            Display .NET information.
--list-sdks       Display the installed SDKs.
--list-runtimes   Display the installed runtimes.

path-to-application:
The path to an application .dll file to execute.

```

{{% /tab %}}

{{% tab name="Mac" %}}


After you've installed, open a new terminal and run the following command:

```bash
dotnet

```

You should be able to see the output like

```
Usage: dotnet [options]
Usage: dotnet [path-to-application]

Options:
-h|--help         Display help.
--info            Display .NET information.
--list-sdks       Display the installed SDKs.
--list-runtimes   Display the installed runtimes.

path-to-application:
The path to an application .dll file to execute.

```
{{% /tab %}}

{{% tab name="Windows" %}}



After you've installed, open a new terminal and run the following command:

```bash
dotnet

```

You should be able to see the output like

```
Usage: dotnet [options]
Usage: dotnet [path-to-application]

Options:
-h|--help         Display help.
--info            Display .NET information.
--list-sdks       Display the installed SDKs.
--list-runtimes   Display the installed runtimes.

path-to-application:
The path to an application .dll file to execute.

```

{{% /tab %}}

{{< /tabs >}}

