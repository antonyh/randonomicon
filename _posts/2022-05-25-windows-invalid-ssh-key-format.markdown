---
layout: post
date: 2022-05-25 02:59:59 +000
title: SSH on Windows and the "invalid format" error
description: Windows is really picky about SSH key formats
categories: ssh, windows
comments: true
sharing: true
icon: bath
---

So you're trying to use SSH on Windows, and all it gives you is this crumby old error:

    > ssh -T git@github.com
    Load key "C:\\Users\\randonomicon/.ssh/id_rsa": invalid format
    git@github.com: Permission denied (publickey).

How do you fix it? (I hope to have an answer soon)



