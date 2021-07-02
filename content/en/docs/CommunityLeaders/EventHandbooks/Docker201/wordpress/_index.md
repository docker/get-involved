---
title: "Creating WordPress app using Docker Compose"
linkTitle: "Creating WordPress app using Docker Compose"
weight: 100
description: >-
     Page description for Creating WordPress app using Docker Compose
---

# Running Single Node WordPress Example


## Pre-requisite:

## Tested Infrastructure

<table class="tg">
  <tr>
    <th class="tg-yw4l"><b>Platform</b></th>
    <th class="tg-yw4l"><b>Number of Instance</b></th>
    <th class="tg-yw4l"><b>Reading Time</b></th>
    
  </tr>
  <tr>
    <td class="tg-yw4l"><b> Play with Docker</b></td>
    <td class="tg-yw4l"><b>1</b></td>
    <td class="tg-yw4l"><b>5 min</b></td>
    
  </tr>
  
</table>

## Pre-requisite

- Create an account with [DockerHub](https://hub.docker.com)
- Open [PWD](https://labs.play-with-docker.com/) Platform on your browser 
- Click on **Add New Instance** on the left side of the screen to bring up Alpine OS instance on the right side

# Steps
- Create a docker-compose.yml file
- Bringup the containers
- Stop the container of a single service
- Starting the stopped container

### Create a docker-compose.yml file



```
version: '3'
services:
   db:
     image: mysql:5.7
     volumes:
       - db_data:/var/lib/mysql
     restart: always
     environment:
       MYSQL_ROOT_PASSWORD: somewordpress
       MYSQL_DATABASE: wordpress
       MYSQL_USER: wordpress
       MYSQL_PASSWORD: wordpress
   wordpress:
     depends_on:
       - db
     image: wordpress:latest
     ports:
       - "8000:80"
     restart: always
     environment:
       WORDPRESS_DB_HOST: db:3306
       WORDPRESS_DB_USER: wordpress
       WORDPRESS_DB_PASSWORD: wordpress
volumes:
    db_data:
```



### Bringup the containers
```
$ docker-compose up -d
```

### Checking container status
```
$  docker-compose ps
 Name               Command             State                    Ports                  
----------------------------------------------------------------------------------------
Mysqldb   docker-entrypoint.sh mysqld   Up      0.0.0.0:3306->3306/tcp, 33060/tcp       
Nginx     nginx -g daemon off;          Up      0.0.0.0:443->443/tcp, 0.0.0.0:80->80/tcp
```

### Listout the services
```
$  docker-compose ps --services
webserver
dbserver
```

### Stop the container of a single service
```
$  docker-compose stop webserver
Stopping Nginx ... done
```
#### Checking container status
```
$  docker-compose ps
 Name               Command             State                  Ports              
----------------------------------------------------------------------------------
Mysqldb   docker-entrypoint.sh mysqld   Up       0.0.0.0:3306->3306/tcp, 33060/tcp
Nginx     nginx -g daemon off;          Exit 0                               
```

### Starting the stopped container
```
$  docker-compose start webserver
Starting webserver ... done
```

<b>NOTE:</b> You cant directly bringup/Start containers using `docker-compose start`.

