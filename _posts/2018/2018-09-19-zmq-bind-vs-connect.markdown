---
layout: post
title: ZMQ - bind vs connect
date:   2018-09-19 22:25:52 +0100
categories: zmq
comments: true
---
ZMQ bind versus connect
=======================

In brief, you should use bind for:
- stable things; use connect for volatile things
- when there is on; use connect when the number is unknown
- when listening;  use connect when broadcasting
- long-lived process should bind; short-lived should connect
- bind for incoming; connect for outgoing
- bound sockets start muted; connected sockets start ready \[except router
sockets\]

See also: 
http://api.zeromq.org/4-0:zmq-bind
http://api.zeromq.org/4-0:zmq-connect

#### When should I use bind and when connect?

From <http://zeromq.org/area:faq>

As a very general advice: use bind on the most stable points in your architecture and connect from the more volatile endpoints. For request/reply the service provider might be point where you bind and the client uses connect. Like plain old TCP.

If you can't figure out which parts are more stable (i.e. peer-to-peer) think about a stable device in the middle, where boths sides can connect to.

The question of bind or connect is often overemphasized. It's really just a matter of what the endpoints do and if they live long — or not. And this depends on your architecture. So build your architecture to fit your problem, not to fit the tool.

See also:

http://stackoverflow.com/questions/16109139/zmq-when-to-use-zmq-bind-or-zmq-connect

http://stackoverflow.com/questions/6024003/why-doesnt-zeromq-work-on-localhost
