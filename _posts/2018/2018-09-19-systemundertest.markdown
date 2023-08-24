---
layout: post
title: Cucumber - Controlling the System-Under-Test
date:   2018-09-19 22:25:52 +0100
categories: testing, cucumber, java
---
Controlling the System-Under-Test
=================================

One way to control the target of the tests is to use a JVM property with
the URL for the server that you wish to test.

    -Dcucumber.target=http://localhost:8080/

    /** String HOST is the server under test, including context path, without trailing slash */
    private final String HOST;
        
    String host=System.getProperty("cucumber.target");
    if(host!=null){
        this.HOST=host;
    }else{
        this.HOST="http://localhost:8080/my-web-app";
    }
            
