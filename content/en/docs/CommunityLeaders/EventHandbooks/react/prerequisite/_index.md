---
title: "Prerequisite"
linkTitle: "Prerequisite"
weight: 1006
description: >-
  Installing NodeJS on Linux, Mac and Windows
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

### Other Software

The softwares in this section are specific to certain parts of the workshop.
Install them only if you plan to attempt them.

- Install [GIT](https://git-scm.com)
- Install [NodeJS](https://nodejs.org/en/)
- Download and install a code editor of your choice:

  - [Visual Studio Code](https://code.visualstudio.com/download)
  - [Sublime Text](https://www.sublimetext.com/3)

- Download and install Javascript IDE of your choice:

| S.No. | Name of Software   | Link to Follow                                 |
| :---- | :----------------- | :--------------------------------------------- |
| 1     | Git                | [Link](https://git-scm.com)                    |
| 2     | Node JS            | [Link](https://nodejs.org/en/)                 |
| 3     | Visual Studio Code | [Link](https://code.visualstudio.com/download) |
| 4     | Webstorm           | [Link](https://www.jetbrains.com/webstorm/)    |
| 5     | Sublime Text 3     | [Link](https://www.sublimetext.com/3)          |

# Download NodeJS

You can download the latest version of Node JS from the below links:

- [Windows](https://nodejs.org/en/)
- [MacOS ](https://nodejs.org/en/)
- [Linux](https://nodejs.org/en/)

# Install NodeJS

Select the tab for your computer's operating system below, then follow its installation instructions.

{{< tabs name="Install Node JS" >}}
{{% tab name="Linux" %}}

- 1. Open the terminal check if Node JS is already installed by using the following command.

```
node --version
```

- 2. Install NodeJS using apt-get

```
sudo apt-get install nodejs
```

- 3. Verify that you've installed NodeJS by opening a command prompt and typing the following command:

```bash

$ node --version

```

4. Confirm that the command prints the installed version of Node JS.

{{% /tab %}}

{{% tab name="Mac" %}}

- 1. Open the terminal check if Node JS is already installed by using the following command.

```
node --version
```

- 2. Go to [NodeJS's official downlaod page](https://nodejs.org/en/) and click on download.
- 3. Once the pkg file is downloaded open it and follow the installation steps
- 4. On completetion open terminal to verify if the installation is successful using the following command

```
node --version
```

{{% /tab %}}

{{% tab name="Windows" %}}

- 1. Download the latest version of Node JS from [here](https://nodejs.org/en/)
- 2. Click on `Install Now`
- 3. In the Command Prompt window that appears, type the following command: <br>

```bash

$ node --version

```

- 4. Confirm that the command prints the installed version of Node JS.

{{% /tab %}}

{{< /tabs >}}
