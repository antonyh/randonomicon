---
layout: post

date:   2018-09-19 22:25:52 +0100
categories: jekyll update
---
The Dockerfile
==============

We will cover the basics and introduce ourselves to Docker, then we can
look at some of the more interesting topics and explore some of the ways
we can build images and containers.

In brief
--------

This is a plain text file defining the docker image. Hash marks a line
as a comment. The first line is usually FROM, and the final lines are
often CMD or ENTRYPOINT.

#### FROM

The FROM line tells docker what you intend to base this docker on. This
is the docker you are adding to with your docker. You can base your
docker on any other docker, such as 'scratch' (an empty docker),
'ubuntu' 'centos' 'debian' (base Linux distros), or other dockers that
provide something you need, like 'ruby' or 'java'. These values are
known as tags.

The most basic possible Docker file is:

    FROM scratch

Unfortunately, this is a blank empty Docker that won't do much. A better
example is

    FROM busybox

or to use Ubuntu 14.04 as the basis of the Docker you would use:

    FROM ubuntu:14.04

Just using a FROM line by itself is rarely useful, you will usually want
to add files to the image, install tools, and set a command to start.

#### About image tags

In Docker, the tag is the name of a docker image. At their most basic
they are in the format creator/container:version. Examples include
'ruby:1.9.3', and 'antonyh/cucumber'. It's recommended that you always
include the version otherwise Docker assumes 'latest' with hopefully
obvious side-effects.

#### RUN

This will run a command. You might want to create a directory or a user
account, install software with apt-get or yum, or download a file with
wget or curl. The options are limitless as this will do whatever is
installed inside the image at the point in time when the RUN is invoked.

#### ADD and COPY

These directives place files into the container. ADD has other
'benefits' depending on what you are trying to achieve, including
expanding compressed files such as ZIPs.

#### ONBUILD

This modifier tells Docker not to run the command now, but to run it
when this docker is used in the FROM within another dockerfile. You'll
only use this in base images, but it's good to be aware of it so you
understand what is happening when you encounter it in other peoples
files.

#### ENTRYPOINT

The entrypoint is the thing that runs the CMD statement, normally

    /bin/sh -c

This may be an over-simplification, but maybe this is accurate for most
uses of this. Conceptually, the ENTRYPOINT is the runtime for the
container, and CMD is the command you wish to invoke.

#### CMD

This defines the command to run. It's important that the command is not
a daemon or a background process as the container will stop when this
finishes. The process should run in the foreground until it has
completed.

Base images
-----------

#### Docker build from a Git repo

A docker container is often built from a local file. Alternatively, the
'docker build' command will accept a Git repository URL. Docker will
clone the repo and use the Dockerfile inside.

#### Package management inside containers

The default images have no package lists as this makes them smaller.
This is why there is a call to 'apt-get update' in pretty much any
Dockerfile based on Ubuntu, and why it's followed up with 'apt-get
clean'.

#### Package versions

When a layer is built, it 'freezes' the version of installed software.
This has two effects. Firstly that layer may remain a long time and lack
vital security updates and bug fixes. Secondly, if the container is
rebuilt from scratch it may end up with different versions. Because of
this, it's important to be as explicit as possible when specifying the
versions of packages whether they are installed via tools such as
apt-get or yum, or downloaded in the Dockerfile using wget or curl.

#### Minimal base images

The smallest possible base image is available via docker hub, and is
named 'scratch'. You can find a 'hello world' example that uses this
here: <https://github.com/docker-library/hello-world>

    FROM scratch

The smallest useful base image is more likely to be busybox - the
so-called 'swiss army knife of embedded linux'.

    FROM busybox

Most base images seem to be based on a linux distro that has a package
management system, such as Ubuntu, Centos, or Debian.

    FROM ubuntu
    FROM centos
    FROM debian

As with the advice over package versions, the same needs to apply to
base container version. Docker FROM declarations use tags to identify
they version they reference.

    FROM ubuntu:14.04
    FROM centos:7
    FROM debian:wheezy

#### FROM defaults to latest

Tags without versions in the FROM line of your dockerfile will assume
you mean 'latest'. As I'm sure you can imagine this gives a great deal
of uncertainty and the possibility of unexpected consequences. If it's
possible, always set a version.

Adding to the base image
------------------------

#### Running commands in the dockerfile

You can set commands to run in the docker container using the keywords
RUN and CMD. RUN will build a layer and make it part of the image. CMD
is used when the container is executed. The command itself can be either
a simple line such as \"mvn install\" or an array of command and
parameters such as \[ \"mvn\", \"install\" \]. The difference between
the two is a simple string is executed using 'sh -c' whereas the array
uses go exec to run the command. Whether this makes any real difference
depends on your needs and use-case, but it's useful to know about the
alternative and understand it when you find it in dockerfiles others
have created.

#### The difference between ADD and COPY keywords

COPY is a simple tool for copying files and folders without
modification. ADD does extras such as unzipping and untarring archives,
and has the ability to add external files by URL. If in doubt, use COPY.

#### Working directory and environment variables

WORKDIR is somewhat akin to shell cd command, and ENV sets environment
variables (again, similar to shell variables).

#### The container runtime command

Conceptually, the ENTRYPOINT is the runtime for the container, and CMD
is the command you wish to invoke. If that sounds a little cryptic,
consider that the default ENTRYPOINT is 'sh -c' so the CMD is a command
that you might type into a console such as:

    curl -I http://server:port/path/to/page.html 

Redefining the ENTRYPOINT to something else allows great flexibility.
What if you set it to 'curl -I'? All you would need to do is define CMD
to be the URL to use, or run the container as

    docker run curly http://server:port/path/to/page.html

Our CMD becomes the parameter, and all 'curly' can do is show http
headers using curl. This isn't the most useful example, but I think it
helps illustrate this point.

#### Use ADD as late as you can

Another way to word this: do the most static things first. Take
advantage of caching as much as possible. Also be careful with '.' and
other wildcards - they may add files that change frequently and this
will also add significant time to your build, especially if you need to
do a post-ADD action such as 'bundle install'.
