---
layout: post
date: 2022-05-25 07:59:59 +000
title: How to update dependency and plugin versions for Maven projects
description: Refresh Maven projects with the latest dependencies and plugin versions automatically
categories: java, maven
comments: true
sharing: true
icon: bath
---

When you have long running Java projects managed by Maven, you will need to refresh the dependencies to update the libraries used. This will give you security updates, bug fixes, and new features.

You can make Maven do the hard work instead of checking each dependencies by hand. 

In general, `mvn versions:display-dependency-updates` will give you a verbose list of changes you can make. 

As always, there's a lot of configuration options available, which is reasonably well documented at https://www.mojohaus.org/versions-maven-plugin/display-dependency-updates-mojo.html

You can also get Maven to do the updates if you use `mvn versions:update-properties` and `mvn versions:use-latest-releases`. By default it will backup the old pom.xml as `pom.xml.versionsBackup` but that is just an inconvenience when using a proper version control system.
