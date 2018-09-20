---
layout: post

date:   2018-09-19 22:25:52 +0100
categories: varnish
---
Built-in subroutines
====================

All the code in the VCL files used by Varnish go into sub-routines.
Varnish uses it's own procedural language called 'VCL' - Varnish Control
Language - and has a pre-defined set of routine names that are used
during the lifecycle of a request.

Subroutines are declared with 'sub'. It is possible to declare new
routines outside of the standard set, but they may not start with
'vcl\_' as this is reserved and would be highly confusing to others. If
you make a mistake it refuses to compile.

Mostly, you'll only need to customise two routines:

-   sub vcl\_recv is when the request is first received - you can
    manipulate the inbound request here to do things like remove headers
    or normalise character case.

-   sub vcl\_deliver happens when the response is about to be returned -
    you can set, remove, or replace headers in the response here.

The terminology is very clear; these are sub-routines. This isn't
\"Object-Oriented-Programming\". This harks back to the olden days, of
functions and routines, and the descriptions in the documentation alure
to this. Or maybe it's just the general naming that systems-level
developers use. Either way, forget classes and objects in that sense,
they don't apply here. This is far more low-level and direct. Apologies
for being so blunt, but this deals with the raw structure of the HTTP
request and response, and isn't attempting to model interactions. It's
based on a state model, which helps in how we understand how Varnish
works.

A full item of the routines in the current version of Varnish is here:
<https://www.varnish-cache.org/docs/trunk/users-guide/vcl-built-in-subs.html>

Care should be taken with using the right version of the documentation
as the subroutines have changed names significantly between major
versions of Varnish, and in some cases the old name now has an entirely
new meaning. Make sure you are using the right thing for the right
purpose, and be especially careful around web searches, blog posts, and
documentation that has neither version numbers or dates.

Client sub-routines
-------------------

These are used by calls from clients, in the sense of dealing with the
inbound request.

A key aspect of these functions, is that they mostly deal with the 'req'
and 'resp' objects - they are for the interactions with the client.

-   vcl\_recv

-   vcl\_pipe

-   vcl\_pass

-   vcl\_hit

-   vcl\_miss

-   vcl\_hash

-   vcl\_purge

-   vcl\_deliver

-   vcl\_synth

In summary, each subroutine has a very clear and defined purpose. There
are exceptions, if logic is implemented to change how the functions
behave, but in general as a default this is how the functions normally
work.

#### vcl\_recv

this is invoked when Varnish receives a request from a client. It's the
first subroutine to be called.

#### vcl\_pipe

'pipe' a request, effectively operate like a proxy without a cache.
After this, Varnish acts like a pipe more-or-less literally, and does
not further modify the request. This is called when some other
subroutine uses 'return pipe'.

#### vcl\_pass

is called when entering 'pass' mode, for backend requests that are not
cached. The might be because of headers in the request, cookies, or
logic in the VCL files.

#### vcl\_hit

is called when an object is found in the cache. This is where we go when
there is a hash match.

#### vcl\_miss

is called when there is no match for the hash in the cache. This is a
good place to select which backend should be used, and to make changes
to the request before it is sent to the backend. Unless you deliberately
force a cache miss (when you should use pass instead) then this is
usually because there's no matching hash in the object cache.

#### vcl\_hash

is called when the hash is being calculated for the request. This is
used to determine the cache key if storing/retrieving a cached page.

#### vcl\_purge

is called post-purge, post-object-eviction.

#### vcl\_deliver

is called prior to delivering a result to the client, except if the
return object is synthetic. This is the last chance to change the
response to the client.

#### vcl\_synth

is called when delivering a synthetic - an object created by the VCL
code and not served from a backend such as an error page.

There are some rules that govern the sub-functions; the most significant
is the 'return' statement. If a defined function uses 'return' it will
finish that sub-function with the specified action. If it doesn't, it
will execute the next declaration of that sub-function, which in turn
may choose to return with an action, or fall-through to the next
declaration. If there are no more declarations in your VCL code for that
sub-function, then Varnish will call the built-in sub-function and use
the default behaviour. This is powerful, because it allows us two
things:

-   to modularise our code by having multiple declarations of the same
    sub-function

-   to make minor tweaks to default behaviour, which for the most part
    works extremely well and is understood, without having to duplicate
    it

Backend sub-routines
--------------------

These manage the request to the origin backend. In terms of internal
architecture within Varnish, it's split into two halves to allow backend
requests to be made in parallel with client reponses. Varnish can (and
will) return stale cache objects while it waits for a fresh response
from the backend, which is a good thing in most cases as it removes the
delay to the end user. From a development point-of-view this means that
the backend sub-routines only have access and knownledge of the backend
request/response (bereq / beresp) and not the client request/response
(req/resp). This can create some interesting challenges but the error
messages are quite clear when absent-minded developers such as myself
forget this simple rule.

The three backend sub-routines are:

-   vcl\_backend\_fetch

-   vcl\_bachend\_response

-   vcl\_backend\_error

Yes, there's only three sub-functions to manage the backend, so it
should be fairly easy to examine how this works.

#### vcl\_backend\_fetch

is called prior to making the request to the backend.

#### vcl\_backend\_response

is called when a successful call has been made.

#### vcl\_backend\_error

is invoked when the request fails and we have no retries left.

Backend sub-functions work on the 'bereq' and 'beresp' objects. No
prizes for guessing what these are, but their specifics will be examined
in detail later.

vcl.load/vcl.discard
--------------------

So far I've managed to avoid these, as I've not yet needed to write a
VMOD, but they are listed here for completeness.

#### vcl\_init

init function for VMODs

#### vcl\_fini

final clean up call for VMODs

Sequence of events
------------------

Not wishing to detract from the useful and accurate official
documentation (it's definitely a primary source of information), I find
that it doesn't really explain the sequence of events well enough for
me, or the significance of each subroutine.

There is a diagram available online, at
<https://www.varnish-cache.org/docs/trunk/reference/states.html#reference-states>
but you either understand it and can follow it, or you don't. It
definitely has a lot of detail, but personally I didn't find this useful
when implementing a caching solution. What I wanted to know is when I
should change the URL value, adjust a header, or set my TTL; this
diagram didn't help me with this at all.

One thing this diagram does do however is clearly show that client
processing is separate to backend processing with different objects,
albeit created from the client 'req' object and eventually returning
'beresp' that is converted into the 'resp' object. The diagram gives the
illusion that they are separate, but this is just for pictorial purposes
when in reality it's an inner process with multiple entry points.

Truthfully, the only real important events are

-   request goes into vcl\_recv

-   response is delivered by vcl\_deliver

-   vcl\_synth generates error states like 404 and 500

-   vcl\_hit is called when the object was found in the cache

-   vcl\_miss is used when there was no matching hash in the cache,
    before the request is passed to the backend

-   everything else is internals, error-handling, and/or optimisation

-   sometimes you'll want to change a value like the req.url then
    return(restart) to re-run all the logic, because it makes life so
    simple, and simple is generally the right thing to do, especially
    when Varnish is so ultra-efficient

That's it, that's the sequence that matters. If you're reading this,
you're probably like me and not an expert with Varnish so the official
diagrams and documentation is somewhat hard to comprehend let alone
implement in the real world. Based on what I've seen, this seems to sum
up more-or-less the majority of requirements for a reverse-proxy cache.
You can do anything here; rewrite URLs, select backend based on path,
mutilate cookies, erase headers, and so on. The list is endless. There
are a few edge cases, particularly cache purges or error handling
requirements, but this should help get you started.
