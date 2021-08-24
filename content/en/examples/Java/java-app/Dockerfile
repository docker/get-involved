# Dockerfile
FROM alpine
WORKDIR /root/hello-world
COPY HelloWorld.java /root/hello-world/


# Install JDK
RUN apk add openjdk11

ENV PATH $PATH:$JAVA_HOME/bin

# Compile our Hello World
RUN javac HelloWorld.java

ENTRYPOINT java HelloWorld