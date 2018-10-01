---
layout: post
title: Varnish tests
date:   2018-09-19 22:25:52 +0100
categories: varnish, testing
---
Varnish tests
=============

One of the great things about Varnish is that is has a baked-in and
fully featured test system that really works for TDD - it's absolutely
possible to write the tests first, and a little care with this pays huge
dividends when the time comes to update and modify the code with bug
fixes or new functionality, as it is trivial to run the tests and have a
high degree of confidence that the changes aren't going to cause
regression errors. Naturally this requires a high percentage of test
coverage, but given how easy it is to write these tests then there's
little reason not to take advantage of the tools to run automated tests
within Varnish.

In essence, each test starts a Varnish server, creates mock backends,
and clients. It wires together the Varnish and backends, then fires the
requests from the clients. The test can then make assertions to validate
the behaviour of the cache. Many things can be inspected, including
response codes, cache hit/miss, number of backend requests, headers
returned, and so on.

Varnish tests are created in a dialect similar to the VCL files used to
configure the cache. These files are Varnish Test Language files and end
in a .vtl extension. Each test file must start with a line that denotes
it as a test file with a name for the test.

    varnishtest "testname";
    # this is my varnish test
    # it checks X by using Y with Z
    # ...or if you prefer
    # given Z, when Y, then X

Putting a preamble here can help, even if it's just a comment block. One
strategy for naming is to use numbers so that you can group these or run
then in groups by number. It's also useful as a index.

Add a backend server to the test
--------------------------------

First, declare a mock backend server. The name of the mock backend
server must start with s otherwise the test will fail at the compilation
stage. This is a requirement of varnishtest and is unavoidable, so it's
common to name the mock server 's1'. If you have other backends that you
have mocked, you might name them s2 and s3 so long as they start with
's'.

The mock server needs to list a set of request/response pairs. Each pair
consists of a 'rxreq' (receive request), expect statements (assertions
on the request), and a txresp (a definition of the response). It's
straightforward enough as we aren't really creating the response, just
the headers as it seems to assume that the body of content is not
particularly interesting. From a unit test point-of-view this is
perfect, as Varnish shouldn't try to modify the contents of the output
with the exception of generated 404/500 pages and other synthesised
return states.

Although it doesn't seem to be written anywhere, in the mock the
following is true:

-   the sequence of rx/tx pairs is rigidly followed.

-   each pair will answer multiple times, not just once.

-   the sequence only ever goes forwards; it might stay a while on one
    rx/tx pair but it never returns to previous declarations.

You might find that sometimes you need to add the same definition set
several times. In the vast majority of cases, the test plan doesn't need
high levels of complexity, and indeed it is a noble goal to shy away
from crafting exotic tests that are hard to comprehend - the ultimate
objective is to have many simple tests. It's far better to produce ten
simple cases than two comprehensive ones when they will have the same
coverage.

Writing a Varnish test
----------------------

There are several things that make up a Varnish test. These are the same
things that exist in a real, live, running Varnish server - as a minimum
you will need a Varnish server, a backend, and a client. You can create
mocks for all of these in the test case, and if needed you can have
multiples.

Of course, you'll need to include your logic for your Varnish
configuration into the test, otherwise you are testing the test case and
not your implementation. I've found the easiest way to do this is to set
up Varnish so declare it's backends and then import configuration. This
way you'll be able to import the exact same implementation into the
tests. The other thing you'll need to do is name your backends in your
implementation to match the names in the tests, which basically means
just starting your declaration with 's', for example 's\_wordpress' or
's\_application' or whatever you need as a name. I favour using the
underscore, as 's\_server' looks deliberate, and 'sserver' looks like a
typo, not to mention creating new words like 'swordpress'. If you are
consistent and use the same names in tests as in the implementation it
makes it easier for cognition as well as possible to use the same logic,
so you won't need to write any Varnish code in the test cases, just
import it.

#### Add a Varnish server to the test

To run tests against Varnish, you need to declare a Varnish server. The
name must start with 'v' by convention and by enforced rules.

Declaring a server as 'vcl+backend' will auto-wire a generated backend
definition for you, using the mock servers configured in the test.

You could declare multiple Varnish caches and name them v\_1, v\_2, v\_3
and so on. Like servers and clients, they have to start with a specific
letter, in this case 'v'. Each Varnish server would have it's own
configuration - you might make them the same, but there could be a
reason to have two different setups.

This is where you'll need to import your implementation if you are
following my recommendation to use your actual source files in both your
implementation and in your tests. All you need to do here is import the
code and it should behave exactly the same during testing as when
running the real service.

#### Add a test client

Declare a client or two, but the name of each client must start with the
letter 'c'. This isn't just a convention - it's a strict law that must
be obeyed. The test will fail automatically if a client is created with
an illegal name, and attempting to use a name starting with any other
letter will cause a compilation failure. As a whole, Varnish tests are
strict particularly on names.

#### Make assertions

It's all well and good to have a client that makes requests from
Varnish, but you also need to set expectations. Without making checks on
the response, or on the state of Varnish itself, all you are confirming
is that the code compiles and can run successfully. Although this has
value, it's better to test specifics.

When checking values from Varnish itself, it's seemingly good practice
to check before any requests are made, and then after a request. For
example, if you want to check that a certain request is cached you would
first assert that cache hits and misses are both zero, make a request,
assert that hits are still zero and that misses are one, make a second
request, then check that there is a cache hit. You could also assert
that two requests to Varnish results in only one request to the back-end
server. There are many ways to check this works, but it's sometimes
useful for clarity to check the counters are zero before running any
tests.

#### Run the clients, run the test

Tally Ho! Time to run the tests, creating requests from the clients to
the Varnish services, which in turn will access the backend servers.

Run the tests from the shell with 'varnishtest filename.vtl', or you
could run all your tests with 'varnishtest \*.vtl'. For the tests I've
created, each one takes about 1.5 seconds, so it's quick enough to run
all the tests quite frequently unless you have thousands. If you do,
then you'll need to find a way to group and selectively run them or
create a way to run them in parallel. Each test case spins up it's own
private in-memory copy of varnish, so you're probably only limited by
memory and CPU power. Of course you may have a lot of tests that prevent
you running them often, but you should take the time just in case you
have changed something and caused a regression without realising. It's
much easier to fix things as you go and maintain a suite of passing
tests than it is to fix bugs later.

#### Testing for absent headers

Often one of the things you will do is remove headers from the output.
This might be because you don't want to expose Varnish internals, or
leak information about your application. It might even be because your
backend application sets headers and it's easier to remove them here
than at the source - perhaps they are legacy applications or closed
source products supplied by a vendor.

Removing the header is easy, but how do you test for the non-existance
of something using VTL? If you remove a header in VTL, as is common in
the vcl\_deliver function:

    sub vcl_deliver {
        unset resp.http.Server;
    }

You can test this in VTL by comparing it to \<undef\>

    client c1 {
        txreq -url "/"
        rxresp
        expect resp.http.Server == <undef>
    } -run

This is a common case, and hard to find online, especially when search
engines autocorrect the spelling of 'undef' to 'under'.
