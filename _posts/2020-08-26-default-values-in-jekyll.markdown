---
layout: post
date: 2020-08-26 08:59:59 +000
title: Default values in the Jekyll Liquid template
categories: jekyll
comments: true
sharing: true
icon: code
---

Defaults in the Liquid templates used by Jekyll is easy but is something I always forget. Here's how to do it:

```{ post.something | default: 'randonomicon' }}```

It will use the default if 'something' has no value. That's all there is to it. 
