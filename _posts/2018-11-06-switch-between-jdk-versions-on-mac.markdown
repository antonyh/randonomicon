---
layout: post
date: 2018-11-06 07:59:59 +000
title: Quick changing Java versions on MacOS 
categories: java, mac 
---

These bash aliases help with Java development by making it easy to switch between Java JDK versions:

    alias JAVA8='export JAVA_HOME="$(/usr/libexec/java_home -v 1.8)"'
    alias JAVA9='export JAVA_HOME="$(/usr/libexec/java_home -v 9)"'
