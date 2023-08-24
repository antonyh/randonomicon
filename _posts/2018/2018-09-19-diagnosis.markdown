---
layout: post
title: Docker - diagnosing issues
date:   2018-09-19 22:25:52 +0100
categories: docker
---
Diagnosing issues with Docker
=============================

Sometimes, things go awry. Fact. Happily, there's an arsenal of tools
available to help figure out what is going down with Docker, and
although some of them are slightly cryptic it's possible to get a vast
body of data and information on the images, containers, and the
environment in the mighty quest to make things run smoothly, or at the
very least run correctly.

The first thing to do is to collect some basic information from Docker
and the containers it is running.

docker version
--------------

This will tell you what version of Docker you are using, both client
version and server (daemon) version. It will also tell you if you can
connect - it fails if there's a connection problem.

docker inspect
--------------

'docker inspect' is a powerful tool. It produces massive amounts of
information on a container. In some ways, too much, which is why it's
important to learn how to find useful values from the output.

#### How to inspect specific values

The output from 'docker inspect' can be somewhat overwhelming. The
in-built Go template system allows the extraction of a single key. For
example, is the last run container still running?
{% raw %}
    docker inspect --format '{{.State.Running}}' $(docker ps -lq)  
{% endraw %}

#### How to find the path to the underlying volume

This example also inspects the last run container, but instead of run
state it tells you the mapped volumes.
{% raw %}
    docker inspect --format '{{.Volumes}}' $(docker ps -lq)  
{% endraw %}

docker events
-------------

Docker will stream events in a format that tells you when it creates,
starts, stops, and destroys containers and images. In it's simplest
form, it's invoked without any options:

    docker events 

It also keeps a history and can filter the output. To get all events
since the epoch, use this command:

    docker events --since="0" 

To filter the output to show container starts only:

    docker events --since="0" --filter="event=start" 

This is a useful tool to track interactions with Docker and find out
what is going on behind the curtain.

docker logs
-----------

Docker offers a mechanism to get the logs of the running container. Many
applications take advantage of the fact that by default this is the
stdout and stderr streams, making it trivial to send output to the
Docker daemon for capture and later analysis. A lot of services do this
by default, such as Apache Tomcat, and it's an option in the logging
framework log4j for example.

#### A better Docker ps format

If you pipe the Docker ps output to 'less -S' it prevents it from
wrapping the table rows.

    docker ps -a | less -S  

#### Watching the Docker logs

When using the 'docker logs' commaind, you can ask it to follow the
output in the same way as the tail command using -F :

    docker logs <containerid> -F  

docker exec
-----------

Docker has the facility to run additional processes in the container
using 'docker exec' eliminating sshd installations from containers. This
can invoke an interactive shell to inspect the container and be used to
fix problems such as changing setting or adjusting log levels.
