---
layout: post
title: Docker basics
date:   2018-09-19 22:25:52 +0100
categories: docker
---
Docker basics
==========

As with all such things that are not widely understood, it's often much
easier and definitely more productive to start with running rather than
walking.

For the truly lazy, use a Docker image, such as
<https://hub.docker.com/r/blinkmobile/apache-httpd/>

If you're not a Dockerino, or want to set it up yourself, one of these
is likely to install it for you:

    yum install mod_security
    apt-get install libapache2-modsecurity
    brew install homebrew/apache/mod_security

Or at least it appears to be something like this; go Google it, many
others have already walked your path. You'll also need to add a
LoadModule line to your Apache HTTPd configuration, which also may
depend on how you have installed the module.

Apparently, you will also need the `mod\_unique\_id` module too, as it's
needed by mod\_security.

Finally, include some configuration files to process your rule set (your
paths might be different, but then again maybe you should just put the
files in the right place if you can):

    <IfModule security2_module>
        Include conf/crs/modsecurity_crs_10_setup.conf
        Include conf/crs/activated_rules/*.conf
    </IfModule>

Enable some rules
-----------------

By default, mod\_security does nothing. Literally, nothing. Not a
pretend nothing, but a very real nothing-nothing. Then again, there are
some sneaky rules in the HTTPd module modsecurity.conf file, so even
this isn't strictly true.

In order to be effective, it needs rules to apply to the
request-response to make assertions and take actions. Ideally, you
should start with just the main rules in the CRS, just the 'base rules'.
This provides a lightweight start point of the most important defences
versus several common attack vectors. Everything beyond this depends on
your risk assessment, technology stack, and organisational policy.

Rule ID numbers
---------------

All rules are numbered. Each rule has a unique number. Each rule in the
CRS has an ID number that is the same on all copies of the CRS (unless
some fool has been tinkering).

By convention, your custom rules should be numbered between 1 and 99999.
This is a safe range for you to use. The rules in the CRS are numbered
900000 to 999999. Other ranges are reserved by various parties, and
should not be used. Feel free to look up the ranges if you so desire but
it's not terribly interesting. For example, the SpiderLabs Research
'slr\_rules' included in the CRS GitHub repository uses a range starting
at 2'000'000.

Within the CRS range you'll find further partitioning to help cognition
- indeed you should also group your rules too for the same reason. From
my own observations in CRS/2.2.9 they appear to be grouped as follows
but it doesn't seem especially consistent to me so it's quite possible
I'm mixed things up or made mistakes in my analysis. This is a rough
guide, and seems to hold true for the most part.

-   2000xx core rules in the modsecurity.conf file for HTTPd

-   90xxxx general rules, WAF behaviour

-   91xxxx information / logging rules

-   92xxxx information leakage / PCI failure

-   95xxxx malicous requests

-   958xxx protocol anomalies, bot detection

-   96xxxx core rules

-   960xxx protocol rules

-   9602xx limits

-   9603xx limits

-   9609xx multipart form

-   9612xx invalid uri

-   97xxxx outbound rules

-   9812xx correlation rules

-   981200 outbound blocking

-   990000 bad robots

Broadly speaking, under normal use you wouldn't generally want to
disable any rule in 95xxxx or 96xxxx.

You might want to check out
<https://www.atomicorp.com/wiki/index.php/Mod_security> for details on
ranges and some other useful information, although do be careful here as
some of the information provided doesn't seem to tally up with other
sources, and some of it appears to be specific to ASL - Atomic Secured
Linux.

In addition to numbering the rule IDs and having groups, the files
containing the rules are also numbered. This is partly because they are
loaded in correlation order and this gives them a sequence. Secondly, it
adds some structure:

-   mod\_security\_crs\_2\* - protocols

-   mod\_security\_crs\_3\* - policy

-   mod\_security\_crs\_4\* - attacks

-   mod\_security\_crs\_5\* - outbound rules

-   mod\_security\_crs\_6\* - correlation

Moving on to the 'optional' rules, we see the same pattern in the file
names, and also with the experimental rules. We will look at these
later, as they are non-essential rules and can bring complications if
they are included needlessly.
