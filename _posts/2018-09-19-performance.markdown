---
layout: post

date:   2018-09-19 22:25:52 +0100
categories: jekyll update
---
Performance
===========

In order to get the best out of Docker, it's important to measure and
collect some metrics and identify areas that are bottlenecks and can be
improved.

Docker Filesystem performance 
------------------------------

This article discusses the different storage mechanisms and how they
affect creating Docker containers en masse. Some of the newer options
are considerably quicker and should be used if they are available. Avoid
AUFS.

<http://developerblog.redhat.com/2014/09/30/overview-storage-scalability-docker/>

### Benchmarking IO performance

    docker run -it antonyh/cucumber dd if=/dev/zero \ 
    of=outfile bs=1M count=2000 oflag=direct \
    && iostat|grep sdc 

This tests the disk IO performance of the docker server.

Run an Apache Benchmark using Docker
------------------------------------

#### 

Apache Bench, sometimes known as 'ab' after the command used to invoke
it, is a tool to measure the time taken to serve a single page at a
given level of concurrency. As it's part of Apache HTTPd, it's very easy
to run a test using Docker:

    docker run --rm httpd ab http://1.2.3.4:1234/path/to/page

If the image had the 'man command (it doesn't), you could have viewed
the 'ab' manual via docker, but sadly this doesn't work.

    docker run --rm httpd man ab

The next best bet to get instructions if you need them is the internet,
directly from Apache:
<http://httpd.apache.org/docs/2.4/programs/ab.html> although be aware
this might be a different version to the docker image.
