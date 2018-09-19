---
layout: post

date:   2018-09-19 22:25:52 +0100
categories: jekyll update
---
Templates
=========

Ansible templates use Jinga2, a Python-based template system.

The 'templates' folder contains Jinja2 template files that the tasks can
use to generate files. These templates have the file extension .j2 and
are used to create files or set configuration that includes facts,
variables, or use loops.

The basics
----------

I'm going to keep this simple for now, before deep diving into the world
of Ansible facts and variables.

Templates in Ansible use the Jinja2 system as previously noted. This is
basically plain text files, with token replacements and some loop
controls. There's nothing overly special about this, that seems to be
commonplace amongst template systems, but it's worth nothing that it's
not logic-less.

One common token (and a good place to start) is the 'ansible\_managed'
value. For example, many configuration files will start with:

    # {{ ansible_managed }}

    # rest of file

The \# is a comment line as many readers will automatically realise.
'ansible\_managed' will drop in a message to show that the file has been
generated with Ansible and that manual changes are futile. It's good
practice to always use this. If you don't get why, then close the laptop
lid, sit in a darkened room, and think about it.

Beyond token replacements and the plain text contents included in the
output, there are a few other things you can do in template.

Loops
-----

You can use any of the loop constructs supported by Jinja2 in your
templates.

For example, you can use for-loops to iterate over collections.

    {% for item in items %}
      item = {{ item.name }}
    {% endfor %}

This is a highly convoluted example, but you get the drift.

Conditional blocks
------------------

Basic if-tests are easy in Jinja2. The only thing to watch out for (if
you're not a Python programmer) is you have to use 'elif' instead of
elseif.

    { % if thing.good %}
        Thing is good.
    { % elif thing.bad %}
        Thing is bad.
    { % else %}
        Thing is neither good nor bad.
    { % endif %}

Another dull example, but it gets the point across.

Defaults
--------

If you try to use a value in a template that hasn't been defined, you
will get a failure when using the template. It's better to define a
default where there is any doubt unless you deliberately want the
template to fail - for some values there simply are no useful defaults.

    {{ port_number | default(6081) }}

This fragment would use the 'port\_number' value if it's been set, with
a default if it hasn't been defined. Use this pattern liberally, as most
things will have sensible defaults that sometimes need to be overridden,
rather than forcing explicit declaration of all possible values.

This is an example of a filter - the variable is used, and the 'default'
filter is applied. There are other filters that can also be used, mostly
for formatting values, but this one I would expect to be the rather
prevalent.

More Jinja2
-----------

In most cases, a few loops, if-tests, and variables will cover the bulk
of your needs. If you want/need to learn more, then you can read the
documentation for the templating language here:
<http://jinja.pocoo.org/docs/dev/>

If you want to know more about the filters that are available for use in
the template you can find a guide for Ansible here:
<http://docs.ansible.com/ansible/playbooks_filters.html>
