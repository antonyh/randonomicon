---
layout: post
title: Ansible general configuration
date:   2018-09-19 22:25:52 +0100
categories: ansible
---
Ansible general configuration
=============================

There's a file names 'ansible.cfg'. Here you set preferences in these
sections:

-   defaults - some basic values and general settings

-   paramiko connection - pure Python SSH connectivity, if you are
    forced to used this

-   ssh connection settings

-   'accelerate' options, for legacy setups

Nearly all of these values can be reset in the playbook or on the
command line.

Mostly these defaults should be left as defaults. In some cases,
particularly with constrained shells, it may be necessary to change sudo
options, the shell executable if /bin/sh is not permitted, and options
around pseudo tty and require tty.

There's also some performance options that may need to be adjusted to
conform with the SSH requirements, such as 'ssh\_args' and 'pipelining'.

Paramiko is a native Python SSH client library that is automatically
used if the SSH tools installed are outdated. Paramiko is slow. It's 10
times slower than OpenSSH. Avoid if possible, but if you have no choice
then you can configure it here.

The 'accelerate' options are outdated (in Ansible 1.9) and can be
ignored in favour of SSH pipelining.
