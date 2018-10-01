---
layout: post
title: Varnish - The VCL language
date:   2018-09-19 22:25:52 +0100
categories: varnish
---
The VCL language
================

VCL version declaration
-----------------------

The first thing you need to have in your VCL file in Varnish 4, you need
a vcl format declarion.

    # this is a VCL file for Varnish 4.0
    vcl 4.0;

    # ... rest of VCL follows
    #
    #

Compilation will fail if this is missing, and this prevents Varnish from
starting. This appears to exist to prevent blindly using Varnish 3
configuration files, which are substantially different and utterly
incompatible. It would appear that in Varnish 4.1 the version in the
configuration files still needs to be set to 4.0.

Comments
--------

As is usual in most languages there are several ways to add comments and
temporarily remove code (comment-out non-executable sections) in VCL
files.

    # comment
    // comment
    /* comment */
    /* multi
       line
       comment */

Comments are contained within /\* \*/ or on lines starting with // or \#

Comments are not allowed on some lines, particularly in test blocks or
between lines that don't end in semicolons. However, the error message
the compiler gives is exceedingly explicit so don't worry too much about
this. It will be very clear when you do add a comment in a forbidden
place.

Getting and setting values
--------------------------

The ability to inspect values and alter them is essential to adding
behaviour to the cache. In order to get values from the objects, just
use the name instead of a static value or string. For example, to get
the value of the client IP address, just use 'client.ip'. There's no
need to add quote marks or otherwise delimit it. Setting values is just
as easy with the 'set' keyword.

Example 1: read the client IP address and assign it into a response
header.

    set resp.http.X-Client-IP = client.ip;

Example 2: setting response location, and a custom header.

    set resp.location = "http://antonyh.co.uk/book/";
    set resp.http.X-Author = "antonyh";

Note that the set command, the single equals, and the semicolon at the
end. Illegally setting a value on an object results in an error. For
safety and consistency, it's much better to assume that everything in
Varnish is case sensitive even though it's sometimes not. For example,
HTTP headers match regardless of case.

Example 3: you can't just create new objects or variables

    # This won't work
    set name = "thing";

    # nor will this
    set resp.something = "thing";

Aside from HTTP headers, there's no facility for just creating new
objects or variables. You'll find yourself at first frustrated by this,
then working around this by setting HTTP headers and clearing them just
prior to delivery. Finally, you'll start planning your code to avoid
this problem altogether - most of the time it's possible with careful
tests and occasional calls to restart.

Conditional code
----------------

You can test values and execute code based on conditions using blocks
within an if-test just like in most mainstream languages. There are
three basic forms:

    # The three variants of if-tests in Varnish
    # if block
    # if...else blocks
    # if...elsif...else 

    if(test){
      //...
    }

    if(test){
      //...
    }else{
      //...
    }

    if(test){
      //...
    }elsif(test){
      //...
    }else{
      //...
    }

There are a few things to note about conditional code using if-else
constructs in VCL files.

-   blocks are marked with squiggly braces, just like many languages

-   else is spelt 'else'

-   else-if is spelt 'elsif', 'elseif', or 'else if' - Varnish is happy
    with any of these

#### Types of test condition

In Varnish, the if-tests commonly use one of these operands:

-   == (exact equals)

-   != (not equals)

-   \~(regex match)

-   !\~(negated regex match)

The regex engine appears to conform to PCRE but has no concept of match
groups, and defaults to case-intolerant matching. There are separate
functions to do replacements (regsub and regsuball).

Including other .vcl files
--------------------------

It can be very helpful to break up the .vcl file into smaller, more
functionally focussed files by some criteria - you might like to have
each sub-routine as a separate file, or if you have multiple domains
then each might have a unique VCL file. I like to break out phases of
execution, so that initial settings like ACLs come first, then any
normalisation of the URLs or headers, routing between multiple backend
servers, then perhaps general logic including page-specific rules, and
finally ending up with delivery and removing any unwanted headers. Your
preference may be different to this.

To include a file, it's very simple:

    include "/path/to/file.vcl"; 

This directly includes a vcl file into this file, and absolute paths are
usually needed. Commonly, this is /usr/local/etc/varnish - the default
vcl\_dir - you'll need to check your system for the path you need.
