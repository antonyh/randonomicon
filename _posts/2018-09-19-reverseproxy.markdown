---
layout: post

date:   2018-09-19 22:25:52 +0100
categories: httpd
---
HTTPd - Reverse proxy configuration
===========================

If you are using ModSecurity with embedded into the application server
then it behaves differently to how it works when used in conjunction
with an external backend via mod\_proxy.

Compression
-----------

If you are serving compressed content from your backend, you will see a
lot of intermittent false positives, including matches against script
tags. This is because the rules sees the opening tag in the compressed
data stream. To overcome this, you will need to set an option

    SecDisableBackendCompression on

The default for SecDisableBackendCompression is off. You only need this
when connecting to a backend that has compressed responses. For
uncompressed servers it's not needed. If you are using mod\_security on
the application server it will inspect the content before compression
takes place, so you won't need it for embedded mode either.

Variables
---------

Some variables are not available when using a reverse-proxy
configuration. These include

-   AUTH\_TYPE

-   REMOTE\_USER

-   SCRIPT\_BASENAME

-   SCRIPT\_FILENAME

-   SCRIPT\_GID

-   SCRIPT\_GROUPNAME

-   SCRIPT\_MODE

-   SCRIPT\_UID

-   SCRIPT\_USERNAME

If you look at the documentation for ModSecurity, it should be really
obvious why these aren't available when using proxying - all of these
values belong to the backend server.
