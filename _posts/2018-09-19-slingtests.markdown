---
layout: post

date:   2018-09-19 22:25:52 +0100
categories: jekyll update
---
Apache Sling testing tools
--------------------------

<https://sling.apache.org/documentation/development/sling-testing-tools.html>

The testing tools provided by Apache Sling have a number of important
benefits that may be difficult to reproduce using other tools.

#### Unit testing

Sling test tools can execture junit test cases from OSGi bundles as part
of the OSGi system in a manner that is external to Sling and does not
require Sling and should work in any OSGi environment.

#### Test scripts

The tools can execute scripts, and these scripts can be produced in any
suitable scripting language. These tests will run in the Sling
environment.

#### HTTP testing

It is possible to make HTTP calls to Sling as part of a Maven build for
example, so that integration tests can be executed against a live Sling
system.
