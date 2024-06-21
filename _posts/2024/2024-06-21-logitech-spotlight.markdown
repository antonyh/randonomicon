---
layout: post
date: 2024-06-21 08:59:59 +000
title: Logitech Spotlight on Linux
description: It's a point-and-present controller for computers, and surprisingly useful for other uses as a remote control.
categories: devices, linux, electronics
comments: true
sharing: true
icon: mouse-pointer
---

This is a nifty little device. It's intended to work like a mouse pointer that you hold in your hand, with a couple of extra buttons to go back and forth in your slide decks while doing presentations. Of course, that's not how I use it. 

Much like Soramichi describes in their blog post https://sorami-chi.hateblo.jp/entry/2021/04/11/110517 I had similar experiences with this device. It works well on Windows with the software. I recall trying it on Mac a long time ago with identical results. On Linux there's no software, so how do we use it?

Thankfully on Linux this is simpler than expected as it's effectively a bluetooth mouse, so we can pair it and nothing else is needed. Hold the top button and wave it around to move the pointer. Tap the top button to click.

The other two buttons aren't really configurable unless you dive into keyboard mappings - it's much like the forward/back buttons on some mice in the sense that it triggers a keypress. With the Logitech Spotlight, these appear hardcoded to left cursor and right cursor keys. I did consider remapping them via .Xmodmap but decided against in case it messed up my keyboard.

For those who prefer bullet point lists of instructions..
* hold top button to turn it on
* open bluetooth and pair the device if you haven't already done this
* while holding the top button, wave it around to move the pointer
* tap the top button to left click
* there is no right click as far as I know
* big middle button is like right-arrow on the keyboard, it advances to the next slide
* the lowest button is a back button that behaves like left-arrow, useful for going to the previous slide.

This is fine for using it with Libre Office or other Powerpoint-like software. My use is a little different - I wanted to control VLC with these buttons. To make this happen, we can change the key mappings inside VLC to use right-arrow as play/pause instead of skip forward (I don't need that anyway) and restart VLC. Now I can point-and-click, skip backwards with the 'back' button, and play/pause with the 'forward' button in VLC without affecting any other software. It's a useful remote for media as well as presentations.

In summary in VLC I followed these steps:
* open preferences
* go to the Tools menu and select 'preferences'
* Assuming it's using 'simple' settings (if you use Advanced then you probably already know how to do this) and switch to the hotkeys tab
* double click on the play/pause
* it will ask you to press the key you want to use. Click the button on the Spotlight remote
* it will warn you that this is already in use. Click assign to accept the change - it will remove it from the other assignment
* quit VLC and launch it again
* open a file and test that it works

The downside is space no works as play/pause. I work around this by using the media keys on the keyboard which still work normally. There's also the option to set a global key to control VLC but if you set space as the global play/pause button it will stop and start playing every single time the spacebar is used regardless of which application you are using, so don't do this.

