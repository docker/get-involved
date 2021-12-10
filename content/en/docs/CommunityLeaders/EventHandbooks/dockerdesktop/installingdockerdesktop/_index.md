---
title: "Installing Docker Desktop"
linkTitle: "Installing Docker Desktop"
weight: 912
description: "" 
---

Before you get started, you should know that Docker Desktop is free for small businesses (fewer than 250 employees AND less than $10 million in annual revenue), personal use, education, and non-commercial open source projects.
You can read more about the subscription service agreement [here][1].

Now, let's get you onboard with Docker Desktop. :)

Visit the Docker Desktop [product page][2] and download the installer based on your system requirements. Launch the installer and follow the instructions. The example below shows the installation on Mac.

![Docker Desktop Launcher](launcher.png "Installing Docker Desktop")

Once the installation completes, launch Docker Desktop from the applications.
You should then see Docker icon in the tray.
As you click on the icon, you will be able to login into or create a Dockerhub account using the Docker ID and password.

![Docker Desktop Icon](tray-icon.png "Docker Desktop Icon")

![Docker Login](docker-login.png "Docker Login")

Once you login, you should be able to see your user account as you click the whale icon in the tray.
Now, from the options select Dashboard and you should see the following screen:

![Dashboard](dashboard.png "Dashboard")

Copy the docker run command you see on the dashboard and run it on a terminal.

![Docker Run](docker-run.png "Docker Run")

You should now be able to see a running container listed on the dashboard.
From the options on the right, select the first one to access the application in browser.

![Application](application.png "Application")

Congratulations!! You have successfully run your first container application with Docker Desktop.

[1]: https://www.docker.com/legal/docker-subscription-service-agreement
[2]: https://www.docker.com/products/docker-desktop

