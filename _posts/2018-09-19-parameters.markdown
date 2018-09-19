---
layout: post

date:   2018-09-19 22:25:52 +0100
categories: jekyll update
---
Maven options
=============

Skip tests
----------

You can stop tests from running by setting a command line option when
invoking Maven:

    mvn install -Dmaven.test.skip=true 

There are plenty of reasons why you should avoid doing this, but the
most common reason to skip tests is when you are utterly convinced that
the change you should work but maybe it doesn't so rather than
committing to waiting for the test suite to run it's quicker to try it
and keep quickly hacking until it does. Beware of anyone who suggests
putting this option in the MAVEN\_OPTS as a default.

Using this on a frequent basis is a hint that the tests are broken and
need urgent attention; it's not so much as a code-smell as a full-on
stink.

Global Maven options
--------------------

If you need to make settings permanent and don't want to specify them
every time you call 'mvn' then the easiest way is to add them to your
.bashrc as MAVEN\_OPTS. This works in the same way as JAVA\_OPTS, and
allows you to send properties to the Java process used by Maven.

For example, if you wanted to enable assertions in the JVM, and set AWT
headless true then this export statement will set this for all calls to
'mvn':

    export MAVEN_OPTS="-ea -Djava.awt.headless=true"

On Windows, just add this to your environment variables and restart your
command line.
