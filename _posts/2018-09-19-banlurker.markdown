---
layout: post

date:   2018-09-19 22:25:52 +0100
categories: varnish
---
The 'ban lurker'
================

Banning and purging content from the cache is an invalidation technique
and is necessary to remove items that have changed or expired. Banning
leaves the object in the cache and can allow it to be served 'stale'
while an updated copy is being fetched. In contrast, purged items are
removed from the cache immediately. When a banned object is too stale
(past their grace period) it is purged.

The facility to ban content provides control of the objects in the
cache. The 'ban lurker' is a powerful part of this as it help manage
resource usage in the cache, and is generally considered a force for
good in the Varnish universe. The ban lurker helps flush out cached
objects that wouldn't otherwise be purged, and it helps stop excessive
amounts of ban rules in the running cache server.

The Ban Lurker is in essence a set of ban rules that are implemented
versus objects in the cache rather than URLs in the requests. Because
the ban is lodged versus 'obj' instead of 'req' it doesn't need to be
evaluated on every request, so it maintains high performance while
achieving the same goal.

Technically, the ban lurker is a thread that walks through the cache
looking for rarely used objects that can be garbage collected to make
room for more valuable items. Combined with a few manipulations for the
headers, that's all it takes - create 'ban' calls using 'obj' instead of
'req'.

How the 'ban lurker' works
--------------------------

The ban lurker actively walks the cache and matching objects against the
ban list. It works solely on the 'obj' ojects in the cache, and has no
concept of request (the 'req' object). In order to be
'ban-lurker-friendly' all you really have to do is to ban based on
'obj'. As always, the way to get values into the 'obj' is to set them as
values on 'beresp' and Varnish will add them to the cache object.

The ban lurker only really helps when long TTLs are involved. Bans based
on req objects can only really be evaluated when a request for that
object is made, so using bans versus 'obj' means that a background
thread (the lurker) can find matches and remove them even though they
are not being requested.

Enabling the ban lurker
-----------------------

The ban lurker is enabled by setting the 'ban\_lurker\_sleep' parameter
of Varnish to some value other than zero. The parameter controls for how
long it will sleep between each object found to be banned. In operation,
it finds an expired object that matches the ban list, removes it, then
it rests for the duration of the sleep parameter, then it resumes the
search for candidates that match the ban list and have passed their TTL.
