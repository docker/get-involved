---
title: "Prerequisite"
linkTitle: "Prerequisite"
weight: 606
description: >-
     Installing Python on Linux, Mac and Windows
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

- Install [git](https://git-scm.com)
- Install [Python](https://www.python.org/downloads/)
- Download and install a code editor of your choice:
   - [Visual Studio Code](https://code.visualstudio.com/download)
   - [PyCharm](https://www.jetbrains.com/pycharm/download/)
   - [Sublime Text](https://www.sublimetext.com/3)

- Download and install Python IDE of your choice:

S.No. | Name of Software | Link to Follow | 
:------------ | :-------------| :-------------|
1 |  Git | [Link](https://git-scm.com)  |
2 |  Python | [Link](hhttps://www.python.org/downloads/)  |
3 |  Visual Studio Code | [Link](https://code.visualstudio.com/download)  |
4 |  PyCharm | [Link](https://www.jetbrains.com/pycharm/download/)  |
5 |  Sublime Text 3 | [Link](https://www.sublimetext.com/3)  |

# Download Python 

You can download the latest version of Python from the below links:

- [Windows](https://www.python.org/downloads/windows/)
- [MacOS ](https://www.python.org/downloads/mac-osx/)
- [Linux](https://www.python.org/downloads/source/)
- [Using Source](https://www.python.org/downloads/source/)


# Install Python

Select the tab for your computer's operating system below, then follow its installation instructions.


{{< tabs name="Install Python" >}}
{{% tab name="Linux" %}}

- 1. Open the terminal check if Python is already installed by using the following command. If it's already above 3.7 skip the next steps

```
python3 --version
```

- 2. Install Python using apt-get

```
sudo apt-get install python3.8
```

- 3. Verify that you've installed Python by opening a command prompt and typing the following command:

```bash

$ python3.8 --version

```
4. Confirm that the command prints the installed version of Python.

{{% /tab %}}

{{% tab name="Mac" %}}



- 1. Open the terminal check if Python is already installed by using the following command. If it's already above 3.7 skip the next steps

```
python3 --version
```

- 2. Go to [Python's official downlaod page](https://www.python.org/downloads/) and click on download.
- 3. Once the pkg file is downloaded open it and follow the installation steps
- 4. On completetion open terminal to verify if the installation is successful using the following command

```
python3 --version
```


{{% /tab %}}

{{% tab name="Windows" %}}



- 1. Download the latest version of Python from [here](https://www.python.org/downloads/)
     
- 2. Open the downloaded installer file. Ensure that you check `Add Python 3.x to PATH`
- 3. Click on `Install Now`
- 4. In the Command Prompt window that appears, type the following command: <br>

```bash

$ python3 --version

```
- 3. Confirm that the command prints the installed version of Python.

{{% /tab %}}

{{< /tabs >}}

