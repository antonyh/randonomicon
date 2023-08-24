---
layout: post
date: 2099-09-23 08:59:59 +000
title: Adobe AEM Sightly/HTL values in \<script\> blocks
categories: aem
comments: true
sharing: true
icon: bath
---
Sometimes you want to generate dynamic script using AEM either as part of the page or as a script resource.

 Some notes on the more unexpected, bizarre, and sharp edges in the Sightly markup language, sometimes calls 'HTL'.

#### values in \<script\> blocks

Using values inside \<script\> blocks is achieved by setting the context.

    ${ev.lat @ context="scriptString"}

credit: https://stackoverflow.com/questions/31107959/using-script-in-html-page-using-sightly
