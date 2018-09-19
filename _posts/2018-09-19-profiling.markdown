---
layout: post

date:   2018-09-19 22:25:52 +0100
categories: jekyll update
---
Profiling Ansible
=================

In order to do realistic and effective performance optimisation, one
must always profile. This is true for all development. Collecting basic
benchmarks from a test run and identifying slow and often-run sections
is a key technique for improving performance, and also applies to
Ansible.

If you are lucky enough to use Ansible 2, there's already a profiler
built in - you can enable it in your playbook with:

    callback_whitelist = profile_tasks

If you are using Ansible 1.x, you can install a callback plugin. I
prefer to put this in  /.ansible/callback\_plugins/ so that it's used on
all my projects. To install it from
<https://github.com/jlafon/ansible-profile> with these instructions:

    mkdir callback\_plugins
    cd callback\_plugins
    wget https://raw.githubusercontent.com/jlafon/ansible-profile/master/callback_plugins/profile_tasks.py

The next run of Ansible will then give a detailed breakdown of the steps
and how long each one has taken. You can use this to find the slow
runners and change them to work quicker, or to alter general Ansible
configuration to improve performance.
