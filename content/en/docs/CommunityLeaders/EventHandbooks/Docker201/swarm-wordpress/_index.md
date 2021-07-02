---
title: "Building Wordpress application using Docker Swarm"
linkTitle: "Building Wordpress application using Docker Swarm"
weight: 100
description: >-
     Page description for Building Wordpress application using Docker Swarm
---

# Running Dockerized WordPress Application in 5-Node Docker Swarm Mode Cluster


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
- Click on "Template" sign near to Instance on the left side of the PWD window.
- Select 3 Managers and 2 worker nodes template from drop-down menu
- This will bring up 5-Node Docker Swarm Mode cluster for you.


## Create a WordPress Docker Compose file for Docker Swarm


```
version: '3.6'

services:
  db:
    image: mysql:5.7
    volumes:
      - db_data:/var/lib/mysql
    restart: always
    environment:
      MYSQL_ROOT_PASSWORD: wordpress
      MYSQL_DATABASE: wordpress
      MYSQL_USER: wordpress
      MYSQL_PASSWORD: wordpress
    deploy:
      placement:
          constraints: [node.role == worker]
      replicas: 1
      update_config:
        parallelism: 2
        delay: 10s
      restart_policy:
        condition: on-failure

  wordpress:
    depends_on:
      - db
    image: wordpress:latest
    ports:
      - "8000:80"
    restart: always
    environment:
      WORDPRESS_DB_HOST: db:3306
      WORDPRESS_DB_PASSWORD: wordpress
    deploy:
      placement:
          constraints: [node.role == worker]
      replicas: 1
      update_config:
        parallelism: 2
        delay: 10s
      restart_policy:
        condition: on-failure

volumes:
    db_data:
```

Save the file with a name "stack.yml".

## Bring up WordPress Application Stack

```
$ docker stack deploy -c stack.yml myapp4

Creating network myapp4_default
Creating service myapp4_db
Creating service myapp4_wordpress
```

A Port 8000 will appear instantly. Wait for 20 seconds and then click it to open WordPress App.
