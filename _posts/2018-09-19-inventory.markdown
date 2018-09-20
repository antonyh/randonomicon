---
layout: post

date:   2018-09-19 22:25:52 +0100
categories: ansible, revise
---
Inventory
=========

What is an inventory? Seriously? If you have to ask\... An inventory is
a collection of hosts organised into groups. With Ansible, that's a poor
answer though. There's a lot more nuance to inventories than just a
simple list.

Playbooks apply roles to a group in the inventory. Each group is
referenced in the playbook as a named entity, but in actual use the
playbook is applied to each server in the list. This mechanism separates
the 'what' from the 'where' so that the roles in the playbook can be
applied to many servers.

In database parlance, this establishes a many-to-many relationship
between roles and inventory entries. Each server can have many roles,
and each role can be applied to many servers.

Continuing with the Wordpress server example, the inventory file might
look something like this:

    [wordpress-server]
    webserver2

It's an 'INI' style format; a heading (the group name) and a simple list
of hosts. More headers provide more groups, and more hosts equates to
more servers.

There's a whole bunch of other options available such as using multiple
inventories, groups of groups, patterns for defining many servers, and
dynamic inventories. It's also possible to add server-specific variable
in the inventory file.
