---
title: "Dockerize Multi-Container Go Application Using Docker Compose"
linkTitle: "Dockerize Multi-Container Go Application Using Docker Compose"
weight: 615
description: >-
     Dockerize Multi-Container Go Application Using Docker Compose
---




The app fetches the quote of the day from a public API hosted at http://quotes.rest/, then it caches the result in Redis. For subsequent API calls, the app will return the result from Redis cache instead of fetching it from the public API

 create following file structure :
 
 ```
 go-docker-compose
	↳ model
		↳ quote.go
	↳ app.go
 
 
 ```
 {{< codenew file="/Golang/go-docker-compose/app.go" >}}
 
 {{< codenew file="/Golang/go-docker-compose/model/quote.go" >}}
 

# Run Go application 

```
git clone https://github.com/docker-community-leaders/dockercommunity/
cd /content/en/examples/Golang/go-docker-compose
go mod init https://github.com/docker-community-leaders/dockercommunity/content/en/examples/Golang/go-docker-compose
go build
```
# Run binaries 

```
$ ./go-docker-compose
2019/02/02 17:19:35 Starting Server
$ curl http://localhost:8080/qod
The free soul is rare, but you know it when you see it - basically because you feel good, very good, when you are near or with them.

```

# Dockerize above go application 


 {{< codenew file="/Golang/go-docker-compose/Dockerfile" >}}


# application;s services via Docker Compose 

Our application consists of two services -

- App service that contains the API to display the “quote of the day”.
- Redis which is used by the app to cache the “quote of the day”.

Let’s define both the services in a `docker-compose.yml` file 

 {{< codenew file="/Golang/go-docker-compose/docker-compose.yml" >}}
 
 # Running the application with docker compose

```
$ docker-compose up
Starting go-docker-compose_redis_1 ... done
Starting go-docker-compose_app_1   ... done
Attaching to go-docker-compose_redis_1, go-docker-compose_app_1
redis_1  | 1:C 02 Feb 2019 12:32:45.791 # oO0OoO0OoO0Oo Redis is starting oO0OoO0OoO0Oo
redis_1  | 1:C 02 Feb 2019 12:32:45.791 # Redis version=5.0.3, bits=64, commit=00000000, modified=0, pid=1, just started
redis_1  | 1:C 02 Feb 2019 12:32:45.791 # Warning: no config file specified, using the default config. In order to specify a config file use redis-server /path/to/redis.conf
redis_1  | 1:M 02 Feb 2019 12:32:45.792 * Running mode=standalone, port=6379.
redis_1  | 1:M 02 Feb 2019 12:32:45.792 # WARNING: The TCP backlog setting of 511 cannot be enforced because /proc/sys/net/core/somaxconn is set to the lower value of 128.
redis_1  | 1:M 02 Feb 2019 12:32:45.792 # Server initialized
redis_1  | 1:M 02 Feb 2019 12:32:45.792 # WARNING you have Transparent Huge Pages (THP) support enabled in your kernel. This will create latency and memory usage issues with Redis. To fix this issue run the command 'echo never > /sys/kernel/mm/transparent_hugepage/enabled' as root, and add it to your /etc/rc.local in order to retain the setting after a reboot. Redis must be restarted after THP is disabled.
redis_1  | 1:M 02 Feb 2019 12:32:45.793 * DB loaded from disk: 0.000 seconds
redis_1  | 1:M 02 Feb 2019 12:32:45.793 * Ready to accept connections
app_1    | 2019/02/02 12:32:46 Starting Server

```

The docker-compose up command starts all the services defined in the `docker-compose.yml` file. 
You can interact with the Go service using curl -

```
$ curl http://localhost:8080/qod
A show of confidence raises the bar

```

# Stopping all the services with docker compose

```
$ docker-compose down

```




