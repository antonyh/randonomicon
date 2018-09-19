---
layout: post

date:   2018-09-19 22:25:52 +0100
categories: jekyll update
---
The 'docker' command
====================

Having a Dockerfile is great but it does nothing by itself - it's just a
plain text file. To use it you will need to invoke 'docker' and ask it
to build the image you want to use.

#### docker run

This starts a new container using an image. A very simple example of
this is:

    docker run -it ubuntu /bin/bash

This tells docker to:

1.  run a container from an image

2.  the '-it' instructs it to be interactive and use the TTY; this is so
    we can type commands and get responses.

3.  use image 'ubuntu'

4.  start the command /bin/bash

The image will be downloaded from hub.docker.com if you don't already
have one labelled 'ubuntu'

#### docker build

As you might expect, this builds an image from a Dockerfile. It doesn't
upload it anywhere, it just assembles it for use as containers.

    docker build -t antonyh/sprocketserver ./sprocketserver

This will build an image as follows:

1.  'build' is the command to Docker

2.  the -t sets the tag name; we need this to create the container

3.  look for a Dockerfile in directory ./sprocketserver or in other
    words, use ./sprocketserver/Dockerfile as the source to build the
    image.

This loads up the Dockerfile, processes it, and records the image as
'antonyh/sprocketserver'. We can start this in the background with a -d
flag:

    docker run -d antonyh/sprocketserver

Note that we don't have to tell it what command to run; this is set in
the Dockerfile, although we could still override it here if we wanted
to. The '-d' tells Docker to 'detach', so it runs in the background and
the output from Docker is the container ID instead of log output.

#### docker ps

You can list the running dockers with 'docker ps' or all containers
including terminated with 'docker ps -a'. You'll use this command a lot
to get container IDs.

#### docker logs

If you started Docker as a detached process, this will give you the log
(stdout / stderr) output so you can find out what the container is
doing. There's an option to 'follow' the logs just like the 'tail' shell
command:

    docker logs -f <containerid>

#### docker stop

This is a useful command for obvious reasons. You need to stop
containers before you can remove them.

#### docker rm

Stopped containers can be removed with 'docker rm'. Note that data
volumes will be dropped if this is the last container that references
them, so be careful not to lose data when removing unwanted containers.

#### docker images

Using 'docker images' will give a list of all the local images available
together with some information such as size.

#### docker rmi

Removing images is possible with 'docker rmi'.

#### docker help

The help provided with Docker is your friend, and is the equivalent to
'man' pages. Use it liberally, there's a lot of information available
and will be current to your version of Docker. On the downside, I
personally find it a little dry.
