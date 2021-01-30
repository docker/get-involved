---
title: "Building and Running a Docker Container"
linkTitle: "Building and Running a Docker Container"
weight: 304
description: >-
     Building and Running a Docker Container
---


- [Build a Docker Image](#build-a-docker-image)
 - [Running a Docker Container](#run-a-docker-container)
- [Build and Run a Docker Container with JDK 15](#build-and-run-a-docker-container-with-jdk-15)
 
## Build a Docker Image

This section explains how to create a Docker image.

## Dockerfile

Docker build images by reading instructions from a _Dockerfile_. A _Dockerfile_ is a text document that contains all the commands a user could call on the command line to assemble an image. `docker image build` command uses this file and executes all the commands in succession to create an image.

`build` command is also passed a context that is used during image creation. This context can be a path on your local filesystem or a URL to a Git repository.

Dockerfile is usually called Dockerfile. The complete list of commands that can be specified in this file are explained at https://docs.docker.com/reference/builder/. The common commands are listed below:

## Common commands for Dockerfile

| Command | Purpose | Example |
:------------ | :-------------| :-------------|
| FROM | First non-comment instruction in _Dockerfile_ | `FROM ubuntu`
| COPY | Copies mulitple source files from the context to the file system of the container at the specified path | `COPY .bash_profile /home`
| ENV | Sets the environment variable | `ENV HOSTNAME=test`
| RUN | Executes a command | `RUN apt-get update`
| CMD | Defaults for an executing container | `CMD ["/bin/echo", "hello world"]`
| EXPOSE | Informs the network ports that the container will listen on | `EXPOSE 8093`
|==================

## Create your first image

Create a new directory `hellodocker`.

In that directory, create a new text file `Dockerfile`. Use the following contents:

```
FROM ubuntu:latest

CMD ["/bin/echo", "hello world"]
```

This image uses `ubuntu` as the base image. `CMD` command defines the command that needs to run. It provides a different entry point of `/bin/echo` and gives the argument "`hello world`".

## Build the image using the command:

```
  docker image build . -t helloworld
```

`.` in this command is the context for the command `docker image build`. `-t` adds a tag to the image.

The following output is shown:

```
Sending build context to Docker daemon  2.048kB
Step 1/2 : FROM ubuntu:latest
latest: Pulling from library/ubuntu
9fb6c798fa41: Pull complete 
3b61febd4aef: Pull complete 
9d99b9777eb0: Pull complete 
d010c8cf75d7: Pull complete 
7fac07fb303e: Pull complete 
Digest: sha256:31371c117d65387be2640b8254464102c36c4e23d2abe1f6f4667e47716483f1
Status: Downloaded newer image for ubuntu:latest
 ---> 2d696327ab2e
Step 2/2 : CMD /bin/echo hello world
 ---> Running in 9356a508590c
 ---> e61f88f3a0f7
Removing intermediate container 9356a508590c
Successfully built e61f88f3a0f7
Successfully tagged helloworld:latest
```

## List the images available using `docker image ls`:

```
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
helloworld          latest              e61f88f3a0f7        3 minutes ago       122MB
ubuntu              latest              2d696327ab2e        4 days ago          122MB
```

Other images may be shown as well but we are interested in these two images for now.

Run the container using the command:

```
docker container run helloworld
```

to see the output:

```
hello world
```

If you do not see the expected output, check your Dockerfile that the content exactly matches as shown above. Build the image again and now run it.

Change the base image from `ubuntu` to `busybox` in `Dockerfile`. Build the image again:

```  
docker image build -t helloworld:2 .
```

and view the images using `docker image ls` command:


```
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
helloworld          2                   7fbedda27c66        3 seconds ago       1.13MB
helloworld          latest              e61f88f3a0f7        5 minutes ago       122MB
ubuntu              latest              2d696327ab2e        4 days ago          122MB
busybox             latest              54511612f1c4        9 days ago          1.13MB
```

`helloworld:2` is the format that allows to specify the image name and assign a tag/version to it separated by `:`.



## Create a simple Java application



### Create a new Java project:

Ensure that you have maven package installed in your system

```
brew install maven
```


```
mvn archetype:generate -DgroupId=org.examples.java -DartifactId=helloworld -DinteractiveMode=false
```

Wait for 40 seconds till you get the below results:

```
Downloaded from central: https://repo.maven.apache.org/maven2/org/apache/maven/archetypes/maven-archetype-quickstart/1.0/maven-archetype-quickstart-1.0.jar (4.3 kB at 17 kB/s)
[INFO] ----------------------------------------------------------------------------
[INFO] Using following parameters for creating project from Old (1.x) Archetype: maven-archetype-quickstart:1.0
[INFO] ----------------------------------------------------------------------------
[INFO] Parameter: basedir, Value: /Users/ajeetraina/dockercommunity/jdk15
[INFO] Parameter: package, Value: org.examples.java
[INFO] Parameter: groupId, Value: org.examples.java
[INFO] Parameter: artifactId, Value: helloworld
[INFO] Parameter: packageName, Value: org.examples.java
[INFO] Parameter: version, Value: 1.0-SNAPSHOT
[INFO] project created from Old (1.x) Archetype in dir: /Users/ajeetraina/dockercommunity/jdk15/helloworld
[INFO] ------------------------------------------------------------------------
[INFO] BUILD SUCCESS
[INFO] ------------------------------------------------------------------------
[INFO] Total time:  01:11 min
[INFO] Finished at: 2021-01-30T03:18:41+05:30
```




## Build the project:

```
cd helloworld
mvn package
```

## Run the Java class:

```
java -cp target/helloworld-1.0-SNAPSHOT.jar org.examples.java.App
```

This shows the output:

```
Hello World!
```

Let's package this application as a Docker image.

## Java Docker image

Run the OpenJDK container in an interactive manner:

```
$ docker container run -it openjdk 
Unable to find image 'openjdk:latest' locally
latest: Pulling from library/openjdk
a73adebe9317: Pull complete 
8b73bcd34cfe: Pull complete 
1227243b28c4: Pull complete 
Digest: sha256:7ada0d840136690ac1099ce3172fb02787bbed83462597e0e2c9472a0a63dea5
Status: Downloaded newer image for openjdk:latest
Jan 29, 2021 12:24:47 PM java.util.prefs.FileSystemPreferences$1 run
INFO: Created user preferences directory.
|  Welcome to JShell -- Version 15.0.2
|  For an introduction type: /help intro
```

This will open a terminal in the container. Check the version of Java:

```
root@8d0af9da5258:/# java --version
openjdk 15.0.2 2021-01-19
OpenJDK Runtime Environment (build 15.0.2+7-27)
OpenJDK 64-Bit Server VM (build 15.0.2+7-27, mixed mode, sharing)
```

A different JDK version may be shown in your case. 

Exit out of the container by typing `exit` in the container shell.

## Package and run Java application as Docker image

Create a new Dockerfile in `helloworld` directory and use the following content:

```
FROM openjdk:latest

COPY target/helloworld-1.0-SNAPSHOT.jar /usr/src/helloworld-1.0-SNAPSHOT.jar

CMD java -cp /usr/src/helloworld-1.0-SNAPSHOT.jar org.examples.java.App
```

## Build the image:

```
docker image build -t hello-java:latest .
```
Run the image:

```
docker container run hello-java:latest
```

This displays the output:

```
Hello World!
```

This shows the exactly same output that was printed when the Java class was invoked using Java CLI.

## Package and run Java Application using Docker Maven Plugin

[Docker Maven Plugin](https://github.com/fabric8io/docker-maven-plugin) allows you to manage Docker images and containers using Maven. It comes with predefined goals:

| S. No | Goal | Description |
:------------ | :-------------| :-------------|
| 1| `docker:build` | Build images | 
| 2 |`docker:start` | Create and start containers| 
| 3 |`docker:stop` | Stop and destroy containers| 
| 4 |`docker:push` | Push images to a registry| 
| 5 |`docker:remove` | Remove images from local docker host| 
| 6 | `docker:logs` | Show container logs | 
|==================



Clone the sample code from https://github.com/arun-gupta/docker-java-sample/.

Create the Docker image:

```
mvn -f docker-java-sample/pom.xml package -Pdocker
```

This will show an output like:

```
[INFO] Copying files to /Users/argu/workspaces/docker-java-sample/target/docker/hellojava/build/maven
[INFO] Building tar: /Users/argu/workspaces/docker-java-sample/target/docker/hellojava/tmp/docker-build.tar
[INFO] DOCKER> [hellojava:latest]: Created docker-build.tar in 87 milliseconds
[INFO] DOCKER> [hellojava:latest]: Built image sha256:6f815
[INFO] ------------------------------------------------------------------------
[INFO] BUILD SUCCESS
[INFO] ------------------------------------------------------------------------
```

The list of images can be checked using the command `docker image ls | grep hello-java`:

```
hello-java                            latest              ea64a9f5011e        5 seconds ago       643 MB
```

## Run the Docker container:

```
mvn -f docker-java-sample/pom.xml install -Pdocker
```

This will show an output like:

```
[INFO] DOCKER> [hellojava:latest]: Start container 30a08791eedb
30a087> Hello World!
[INFO] DOCKER> [hellojava:latest]: Waited on log out 'Hello World!' 510 ms
```

This is similar output when running the Java application using `java` CLI or the Docker container using `docker container run` command.

The container is running in the foreground. Use `Ctrl` + `C` to interrupt the container and return back to terminal.

Only one change was required in the project to enable Docker packaging and running. A Maven profile is added in `pom.xml`:

```
<profiles>
    <profile>
        <id>docker</id>
        <build>
            <plugins>
                <plugin>
                    <groupId>io.fabric8</groupId>
                    <artifactId>docker-maven-plugin</artifactId>
                    <version>0.22.1</version>
                    <configuration>
                        <images>
                            <image>
                                <name>hello-java</name>
                                <build>
                                    <from>openjdk:latest</from>
                                    <assembly>
                                        <descriptorRef>artifact</descriptorRef>
                                    </assembly>
                                    <cmd>java -cp maven/${project.name}-${project.version}.jar org.examples.java.App</cmd>
                                </build>
                                <run>
                                    <wait>
                                        <log>Hello World!</log>
                                    </wait>
                                </run>
                            </image>
                        </images>
                    </configuration>
                    <executions>
                        <execution>
                            <id>docker:build</id>
                            <phase>package</phase>
                            <goals>
                                <goal>build</goal>
                            </goals>
                        </execution>
                        <execution>
                            <id>docker:start</id>
                            <phase>install</phase>
                            <goals>
                                <goal>start</goal>
                                <goal>logs</goal>
                            </goals>
                        </execution>
                    </executions>
                </plugin>
            </plugins>
        </build>
    </profile>
</profiles>
```

## Dockerfile Command Design Patterns

### Difference between CMD and ENTRYPOINT

*TL;DR* `CMD` will work for most of the cases.

Default entry point for a container is `/bin/sh`, the default shell.

Running a container as `docker container run -it ubuntu` uses that command and starts the default shell. The output is shown as:

```
docker container run -it ubuntu
root@88976ddee107:/#
```

`ENTRYPOINT` allows to override the entry point to some other command, and even customize it. For example, a container can be started as:

```
docker container run -it --entrypoint=/bin/cat ubuntu /etc/passwd
root:x:0:0:root:/root:/bin/bash
daemon:x:1:1:daemon:/usr/sbin:/usr/sbin/nologin
bin:x:2:2:bin:/bin:/usr/sbin/nologin
sys:x:3:3:sys:/dev:/usr/sbin/nologin
. . .
```

This command overrides the entry point to the container to `/bin/cat`. The argument(s) passed to the CLI are used by the entry point.

## Difference between ADD and COPY

*TL;DR* `COPY` will work for most of the cases.

`ADD` has all capabilities of `COPY` and has the following additional features:

. Allows tar file auto-extraction in the image, for example, `ADD app.tar.gz /opt/var/myapp`.
. Allows files to be downloaded from a remote URL. However, the downloaded files will become part of the image. This causes the image size to bloat. So its recommended to use `curl` or `wget` to download the archive explicitly, extract, and remove the archive.

### Import and export images

Docker images can be saved using `image save` command to a `.tar` file:

```
docker image save helloworld > helloworld.tar
```
These tar files can then be imported using `load` command:

```
docker image load -i helloworld.tar
```

## Run a Docker Container

The first step in running an application using Docker is to run a container. If you can think of an open source software, there is a very high likelihood that there will be a Docker image available for it at https://store.docker.com[Docker Store]. Docker client can simply run the container by giving the image name. The client will check if the image already exists on Docker Host. If it exists then it'll run the container, otherwise the host will first download the image.

## Pull Image

Let's check if any images are available:

```
docker image ls
```

At first, this list is empty. If you've already downloaded the images as specified in the setup chapter, then all the images will be shown here. 

List of images can be seen again using the `docker image ls` command. This will show the following output:

```
REPOSITORY                   TAG                 IMAGE ID            CREATED             SIZE
hellojava                    latest              8d76bf5691c4        32 minutes ago      740MB
hello-java                   latest              93b1180c5d91        36 minutes ago      740MB
helloworld                   2                   7fbedda27c66        41 minutes ago      1.13MB
helloworld                   latest              e61f88f3a0f7        About an hour ago   122MB
mysql                        latest              b4e78b89bcf3        3 days ago          412MB
ubuntu                       latest              2d696327ab2e        4 days ago          122MB
jboss/wildfly                latest              9adbdb00cded        8 days ago          592MB
openjdk                      latest              6077adce18ea        8 days ago          740MB
busybox                      latest              54511612f1c4        9 days ago          1.13MB
tailtarget/hadoop            2.7.2               ee6b539c886e        6 months ago        1.15GB
tailtarget/jenkins           2.32.3              71a7d9bcfe2b        6 months ago        859MB
arungupta/couchbase          travel              7929a80707db        7 months ago        583MB
arungupta/couchbase-javaee   travel              2bb52abaad5f        7 months ago        595MB
arungupta/javaee7-hol        latest              da5c9d4f85ca        2 years ago         582MB
```

More details about the image can be obtained using `docker image history jboss/wildfly` command:

```
IMAGE               CREATED             CREATED BY                                      SIZE                COMMENT
9adbdb00cded        8 days ago          /bin/sh -c #(nop)  CMD ["/opt/jboss/wildfl...   0B                  
<missing>           8 days ago          /bin/sh -c #(nop)  EXPOSE 8080/tcp              0B                  
<missing>           8 days ago          /bin/sh -c #(nop)  USER [jboss]                 0B                  
<missing>           8 days ago          /bin/sh -c #(nop)  ENV LAUNCH_JBOSS_IN_BAC...   0B                  
<missing>           8 days ago          /bin/sh -c cd $HOME     && curl -O https:/...   163MB               
<missing>           8 days ago          /bin/sh -c #(nop)  USER [root]                  0B                  
<missing>           8 days ago          /bin/sh -c #(nop)  ENV JBOSS_HOME=/opt/jbo...   0B                  
<missing>           8 days ago          /bin/sh -c #(nop)  ENV WILDFLY_SHA1=9ee3c0...   0B                  
<missing>           8 days ago          /bin/sh -c #(nop)  ENV WILDFLY_VERSION=10....   0B                  
<missing>           8 days ago          /bin/sh -c #(nop)  ENV JAVA_HOME=/usr/lib/...   0B                  
<missing>           8 days ago          /bin/sh -c #(nop)  USER [jboss]                 0B                  
<missing>           8 days ago          /bin/sh -c yum -y install java-1.8.0-openj...   204MB               
<missing>           8 days ago          /bin/sh -c #(nop)  USER [root]                  0B                  
<missing>           8 days ago          /bin/sh -c #(nop)  MAINTAINER Marek Goldma...   0B                  
<missing>           8 days ago          /bin/sh -c #(nop)  USER [jboss]                 0B                  
<missing>           8 days ago          /bin/sh -c #(nop) WORKDIR /opt/jboss            0B                  
<missing>           8 days ago          /bin/sh -c groupadd -r jboss -g 1000 && us...   296kB               
<missing>           8 days ago          /bin/sh -c yum update -y && yum -y install...   28.7MB              
<missing>           8 days ago          /bin/sh -c #(nop)  MAINTAINER Marek Goldma...   0B                  
<missing>           8 days ago          /bin/sh -c #(nop)  CMD ["/bin/bash"]            0B                  
<missing>           8 days ago          /bin/sh -c #(nop)  LABEL name=CentOS Base ...   0B                  
<missing>           8 days ago          /bin/sh -c #(nop) ADD file:1ed4d1a29d09a63...   197MB               
```

## Run Container

### Interactively

Run WildFly container in an interactive mode.

```
docker container run -it jboss/wildfly
```

This will show the output as:

```
=========================================================================

  JBoss Bootstrap Environment

  JBOSS_HOME: /opt/jboss/wildfly

  JAVA: /usr/lib/jvm/java/bin/java

. . .

00:26:27,455 INFO  [org.jboss.as] (Controller Boot Thread) WFLYSRV0060: Http management interface listening on http://127.0.0.1:9990/management
00:26:27,456 INFO  [org.jboss.as] (Controller Boot Thread) WFLYSRV0051: Admin console listening on http://127.0.0.1:9990
00:26:27,457 INFO  [org.jboss.as] (Controller Boot Thread) WFLYSRV0025: WildFly Full 10.1.0.Final (WildFly Core 2.2.0.Final) started in 3796ms - Started 331 of 577 services (393 services are lazy, passive or on-demand)
```

This shows that the server started correctly, congratulations!

By default, Docker runs in the foreground. `-i` allows to interact with the STDIN and `-t` attach a TTY to the process. Switches can be combined together and used as `-it`.

Hit Ctrl+C to stop the container.

### Detached container

Restart the container in detached mode:

```
docker container run -d jboss/wildfly
254418caddb1e260e8489f872f51af4422bc4801d17746967d9777f565714600
```

`-d`, instead of `-it`, runs the container in detached mode.

The output is the unique id assigned to the container. Logs of the container can be seen using the command `docker container logs <CONTAINER_ID>`, where `<CONTAINER_ID>` is the id of the container.

Status of the container can be checked using the `docker container ls` command:

```
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS               NAMES
254418caddb1        jboss/wildfly       "/opt/jboss/wildfl..."   2 minutes ago       Up 2 minutes        8080/tcp            gifted_haibt
```

Also try `docker container ls -a` to see all the containers on this machine.

###  With default port

If you want the container to accept incoming connections, you will need to provide special options when invoking `docker run`. The container, we just started, can't be accessed by our browser. We need to stop it again and restart with different options.

```
docker container stop `docker container ps | grep wildfly | awk '{print $1}'`
```

Restart the container as:

```
docker container run -d -P --name wildfly jboss/wildfly
```

`-P` map any exposed ports inside the image to a random port on Docker host. In addition, `--name` option is used to give this container a name. This name can then later be used to get more details about the container or stop it. This can be verified using `docker container ls` command:

```
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                     NAMES
89fbfbceeb56        jboss/wildfly       "/opt/jboss/wildfl..."   9 seconds ago       Up 8 seconds        0.0.0.0:32768->8080/tcp   wildfly
```

The port mapping is shown in the `PORTS` column. Access WildFly server at http://localhost:32768. Make sure to use the correct port number as shown in your case.

NOTE: Exact port number may be different in your case.

The page would look like:

![My Image)(wildfly-first-run-default-page.png)

## With specified port

Stop and remove the previously running container as:

```
docker container stop wildfly
docker container rm wildfly
```

Alternatively, `docker container rm -f wildfly` can be used to stop and remove the container in one command. Be careful with this command because `-f` uses `SIGKILL` to kill the container.

## Restart the container as:

```
docker container run -d -p 8080:8080 --name wildfly jboss/wildfly
```

The format is `-p hostPort:containerPort`. This option maps a port on the host to a port in the container. This allows us to access the container on the specified port on the host.

Now we're ready to test http://localhost:8080. This works with the exposed port, as expected.

Let's stop and remove the container as:

```
docker container stop wildfly
docker container rm wildfly
```

## Deploy a WAR file to application server

Now that your application server is running, lets see how to deploy a WAR file to it.

Create a new directory `hellojavaee`. Create a new text file and name it `Dockerfile`. Use the following contents:

```
FROM jboss/wildfly:latest

RUN curl -L https://github.com/javaee-samples/javaee7-simple-sample/releases/download/v1.10/javaee7-simple-sample-1.10.war -o /opt/jboss/wildfly/standalone/deployments/javaee-simple-sample.war
```

## Create an image:

```
docker image build -t javaee-sample .
```

Start the container:

```
docker container run -d -p 8080:8080 --name wildfly javaee-sample
```

## Access the endpoint:

```
curl http://localhost:8080/javaee-simple-sample/resources/persons
```

See the output:

```
<persons>
	<person>
		<name>
		Penny
		</name>
	</person>
	<person>
		<name>
		Leonard
		</name>
	</person>
	<person>
		<name>
		Sheldon
		</name>
	</person>
	<person>
		<name>
		Amy
		</name>
	</person>
	<person>
		<name>
		Howard
		</name>
	</person>
	<person>
		<name>
		Bernadette
		</name>
	</person>
	<person>
		<name>
		Raj
		</name>
	</person>
	<person>
		<name>
		Priya
		</name>
	</person>
</persons>
```

Optional: `brew install XML-Coreutils` will install XML formatting utility on Mac. This output can then be piped to `xml-fmt` to display a formatted result.

## Stop container

Stop a specific container by id or name:

```
docker container stop <CONTAINER ID>
docker container stop <NAME>
```

## Stop all running containers:

```
docker container stop $(docker container ps -q)
```

## Stop only the exited containers:

```
docker container ps -a -f "exited=-1"
```

## Remove container

Remove a specific container by id or name:

```
docker container rm <CONTAINER_ID>
docker container rm <NAME>
```

## Remove containers meeting a regular expression

```
docker container ps -a | grep wildfly | awk '{print $1}' | xargs docker container rm
```

## Remove all containers, without any criteria

```
docker container rm $(docker container ps -aq)
```

##  Additional ways to find port mapping

The exact mapped port can also be found using `docker port` command:

```
docker container port <CONTAINER_ID> or <NAME>
```

This shows the output as:

```
8080/tcp -> 0.0.0.0:8080
```

Port mapping can be also be found using `docker inspect` command:

```
docker container inspect --format='{{(index (index .NetworkSettings.Ports "8080/tcp") 0).HostPort}}' <CONTAINER ID>
```

## Build and Run a Docker Container with JDK 15

This chapter explains how to create a Docker image with JDK 15.

## Create a Docker Image using JDK 15

Create a new directory, for example `docker-jdk15`.

In that directory, create a new text file `jdk-15-debian-slim.Dockerfile`.
Use the following contents:

```
# A JDK 15 with Debian slim
FROM buildpack-deps:buster-scm

RUN set -eux; \
	apt-get update; \
	apt-get install -y --no-install-recommends \
		bzip2 \
		unzip \
		xz-utils \
		\
# utilities for keeping Debian and OpenJDK CA certificates in sync
		ca-certificates p11-kit \
		\
# jlink --strip-debug on 13+ needs objcopy: https://github.com/docker-library/openjdk/issues/351
# Error: java.io.IOException: Cannot run program "objcopy": error=2, No such file or directory
		binutils \
# java.lang.UnsatisfiedLinkError: /usr/local/openjdk-11/lib/libfontmanager.so: libfreetype.so.6: cannot open shared object file: No such file or directory
# java.lang.NoClassDefFoundError: Could not initialize class sun.awt.X11FontManager
# https://github.com/docker-library/openjdk/pull/235#issuecomment-424466077
		fontconfig libfreetype6 \
	; \
	rm -rf /var/lib/apt/lists/*

# Default to UTF-8 file.encoding
ENV LANG C.UTF-8

ENV JAVA_HOME /usr/local/openjdk-15
ENV PATH $JAVA_HOME/bin:$PATH

# backwards compatibility shim
RUN { echo '#/bin/sh'; echo 'echo "$JAVA_HOME"'; } > /usr/local/bin/docker-java-home && chmod +x /usr/local/bin/docker-java-home && [ "$JAVA_HOME" = "$(docker-java-home)" ]

# https://jdk.java.net/
# >
# > Java Development Kit builds, from Oracle
# >
ENV JAVA_VERSION 15.0.2

RUN set -eux; \
	\
	arch="$(dpkg --print-architecture)"; \
# this "case" statement is generated via "update.sh"
	case "$arch" in \
# arm64v8
		arm64 | aarch64) \
			downloadUrl=https://download.java.net/java/GA/jdk15.0.2/0d1cfde4252546c6931946de8db48ee2/7/GPL/openjdk-15.0.2_linux-aarch64_bin.tar.gz; \
			downloadSha256=3958f01858f9290c48c23e7804a0af3624e8eca6749b085c425df4c4f2f7dcbc; \
			;; \
# amd64
		amd64 | i386:x86-64) \
			downloadUrl=https://download.java.net/java/GA/jdk15.0.2/0d1cfde4252546c6931946de8db48ee2/7/GPL/openjdk-15.0.2_linux-x64_bin.tar.gz; \
			downloadSha256=91ac6fc353b6bf39d995572b700e37a20e119a87034eeb939a6f24356fbcd207; \
			;; \
# fallback
		*) echo >&2 "error: unsupported architecture: '$arch'"; exit 1 ;; \
	esac; \
	\
	wget -O openjdk.tgz "$downloadUrl" --progress=dot:giga; \
	echo "$downloadSha256 *openjdk.tgz" | sha256sum --strict --check -; \
	\
	mkdir -p "$JAVA_HOME"; \
	tar --extract \
		--file openjdk.tgz \
		--directory "$JAVA_HOME" \
		--strip-components 1 \
		--no-same-owner \
	; \
	rm openjdk.tgz; \
	\
# update "cacerts" bundle to use Debian's CA certificates (and make sure it stays up-to-date with changes to Debian's store)
# see https://github.com/docker-library/openjdk/issues/327
#     http://rabexc.org/posts/certificates-not-working-java#comment-4099504075
#     https://salsa.debian.org/java-team/ca-certificates-java/blob/3e51a84e9104823319abeb31f880580e46f45a98/debian/jks-keystore.hook.in
#     https://git.alpinelinux.org/aports/tree/community/java-cacerts/APKBUILD?id=761af65f38b4570093461e6546dcf6b179d2b624#n29
	{ \
		echo '#!/usr/bin/env bash'; \
		echo 'set -Eeuo pipefail'; \
		echo 'if ! [ -d "$JAVA_HOME" ]; then echo >&2 "error: missing JAVA_HOME environment variable"; exit 1; fi'; \
# 8-jdk uses "$JAVA_HOME/jre/lib/security/cacerts" and 8-jre and 11+ uses "$JAVA_HOME/lib/security/cacerts" directly (no "jre" directory)
		echo 'cacertsFile=; for f in "$JAVA_HOME/lib/security/cacerts" "$JAVA_HOME/jre/lib/security/cacerts"; do if [ -e "$f" ]; then cacertsFile="$f"; break; fi; done'; \
		echo 'if [ -z "$cacertsFile" ] || ! [ -f "$cacertsFile" ]; then echo >&2 "error: failed to find cacerts file in $JAVA_HOME"; exit 1; fi'; \
		echo 'trust extract --overwrite --format=java-cacerts --filter=ca-anchors --purpose=server-auth "$cacertsFile"'; \
	} > /etc/ca-certificates/update.d/docker-openjdk; \
	chmod +x /etc/ca-certificates/update.d/docker-openjdk; \
	/etc/ca-certificates/update.d/docker-openjdk; \
	\
# https://github.com/docker-library/openjdk/issues/331#issuecomment-498834472
	find "$JAVA_HOME/lib" -name '*.so' -exec dirname '{}' ';' | sort -u > /etc/ld.so.conf.d/docker-openjdk.conf; \
	ldconfig; \
	\
# https://github.com/docker-library/openjdk/issues/212#issuecomment-420979840
# https://openjdk.java.net/jeps/341
	java -Xshare:dump; \
	\
# basic smoke test
	fileEncoding="$(echo 'System.out.println(System.getProperty("file.encoding"))' | jshell -s -)"; [ "$fileEncoding" = 'UTF-8' ]; rm -rf ~/.java; \
	javac --version; \
	java --version

# "jshell" is an interactive REPL for Java (see https://en.wikipedia.org/wiki/JShell)
CMD ["jshell"]
                                                   
```

This image uses `debian` slim as the base image and installs the OpenJDK build
of JDK for linux x64 

The image is configured by default to run `jshell` the Java REPL. Read more JShell at link:https://docs.oracle.com/javase/9/jshell/introduction-jshell.htm[Introduction to JShell]. 

## Build the image using the command:

```
docker image build -t jdk-15-debian-slim -f jdk-9-debian-slim.Dockerfile .
```


## List the images available using `docker image ls`:

```
REPOSITORY              TAG                 IMAGE ID            CREATED             SIZE
jdk-15-debian-slim      latest              0b9c1935cd20        9 hours ago         669MB
debian                  stable-slim         d30525fb4ed2        4 days ago          55.3MB
```



## Run the container using the command:

```
docker container run -m=200M -it --rm jdk-15-debian-slim
```

to see the output:

```
Jan 29, 2021 9:08:17 PM java.util.prefs.FileSystemPreferences$1 run
INFO: Created user preferences directory.
|  Welcome to JShell -- Version 15.0.2
|  For an introduction type: /help intro

jshell>
```

Query the available memory of the Java process by typing the following
expression into the Java REPL:

  Runtime.getRuntime().maxMemory() / (1 << 20)

to see the output:

```
jshell> Runtime.getRuntime().maxMemory() / (1 << 20)
$1 ==> 96
```

Notice that the Java process is honoring memory constraints (see the `--memory`
of `docker container run`) and will not allocate memory beyond that specified for the
container.


Type `Ctrl` + `D` to exit out of `jshell`.

To list all the Java modules distributed with JDK 15 run the following command:

```
docker container run -m=200M -it --rm jdk-9-debian-slim java --list-modules
```

This will show an output:

```
 docker container run -m=200M -it --rm jdk-15-debian-slim java --list-modules
java.base@15.0.2
java.compiler@15.0.2
java.datatransfer@15.0.2
java.desktop@15.0.2
java.instrument@15.0.2
java.logging@15.0.2
java.management@15.0.2
java.management.rmi@15.0.2
java.naming@15.0.2
java.net.http@15.0.2
java.prefs@15.0.2
java.rmi@15.0.2
java.scripting@15.0.2
...
jdk.internal.vm.ci@15.0.2
jdk.internal.vm.compiler@15.0.2
jdk.internal.vm.compiler.management@15.0.2
jdk.jartool@15.0.2
jdk.javadoc@15.0.2
jdk.jcmd@15.0.2
jdk.jconsole@15.0.2
jdk.jdeps@15.0.2
jdk.jdi@15.0.2
jdk.jdwp.agent@15.0.2
jdk.jfr@15.0.2
jdk.jlink@15.0.2
jdk.jshell@15.0.2
jdk.jsobject@15.0.2
jdk.jstatd@15.0.2
...
..
```

In total there should be 69 modules:

```
$ docker container run -m=200M -it --rm jdk-9-debian-slim java --list-modules | wc -l
      69
```

##  Create a Docker Image using JDK 15 and Alpine Linux

Instead of `debian` as the base image it is possible to use Alpine Linux
with an early access build of JDK 15 that is compatible with the muslc library
shipped with Alpine Linux.

Create a new text file `jdk-15-alpine.Dockerfile`.
Use the following contents:

```
# A JDK 15 with Alpine Linux
FROM alpine:3.12

RUN apk add --no-cache java-cacerts

ENV JAVA_HOME /opt/openjdk-16
ENV PATH $JAVA_HOME/bin:$PATH

# https://jdk.java.net/
# >
# > Java Development Kit builds, from Oracle
# >
ENV JAVA_VERSION 16-ea+32
# "For Alpine Linux, builds are produced on a reduced schedule and may not be in sync with the other platforms."

RUN set -eux; \
	\
	arch="$(apk --print-arch)"; \
# this "case" statement is generated via "update.sh"
	case "$arch" in \
# amd64
		x86_64) \
			downloadUrl=https://download.java.net/java/early_access/alpine/32/binaries/openjdk-16-ea+32_linux-x64-musl_bin.tar.gz; \
			downloadSha256=f9ec3071fdea08ca5be7b149d6c2f2689814e3ee86ee15b7981f5eed76280985; \
			;; \
# fallback
		*) echo >&2 "error: unsupported architecture: '$arch'"; exit 1 ;; \
	esac; \
	\
	wget -O openjdk.tgz "$downloadUrl"; \
	echo "$downloadSha256 *openjdk.tgz" | sha256sum -c -; \
	\
	mkdir -p "$JAVA_HOME"; \
	tar --extract \
		--file openjdk.tgz \
		--directory "$JAVA_HOME" \
		--strip-components 1 \
		--no-same-owner \
	; \
	rm openjdk.tgz; \
	\
# see "java-cacerts" package installed above (which maintains "/etc/ssl/certs/java/cacerts" for us)
	rm -rf "$JAVA_HOME/lib/security/cacerts"; \
	ln -sT /etc/ssl/certs/java/cacerts "$JAVA_HOME/lib/security/cacerts"; \
	\
# https://github.com/docker-library/openjdk/issues/212#issuecomment-420979840
# https://openjdk.java.net/jeps/341
	java -Xshare:dump; \
	\
# basic smoke test
	fileEncoding="$(echo 'System.out.println(System.getProperty("file.encoding"))' | jshell -s -)"; [ "$fileEncoding" = 'UTF-8' ]; rm -rf ~/.java; \
	javac --version; \
	java --version

# "jshell" is an interactive REPL for Java (see https://en.wikipedia.org/wiki/JShell)
CMD ["jshell"]
```

This image uses `alpine` 3.12 as the base image and installs the OpenJDK build
of JDK for Alpine Linux x64.

The image is configured in the same manner as for the `debian`-based image.

## Build the image using the command:

```
docker image build -t jdk-15-alpine -f jdk-15-alpine.Dockerfile .
```

## List the images available using `docker image ls`:

```
REPOSITORY              TAG                 IMAGE ID            CREATED             SIZE
jdk-15-debian-slim      latest              0b9c1935cd20        9 hours ago         669MB
jdk-15-alpine           latest              5d4557f836aa        6 minutes ago       324MB
debian                  stable-slim         d30525fb4ed2        4 days ago          55.3MB
alpine                  3.6                 7328f6f8b418        3 months ago        3.97MB
```

Notice the difference in image sizes.  Alpine Linux by design has been carefully
crafted to produce a minimal running OS image. 


