---
layout: post
date: 2020-09-09 08:59:59 +000
title: Things for Chroma Key video, AKA Green Screening
categories: wfh
comments: true
sharing: true
icon: video-camera
---

I've been experimenting with greenscreens and chromakey to record videos and for online conferencing with MS Teams. This is what I've worked out so far. 

In brief: light up the green screen properly, use a good camera and the right software, and pay attention to the details. Keep notes for when you need to set it up again.  

### Hardware

1. a green screen. The greener the better. Matte finish: glossy will reflect light rather than look green it'll be white.
2. a stand for the screen. It works better if properly upright.
3. Alternatively, get the Elgato one that stands on the floor. It's still out of stock everywhere in September 2020. Every review of this has been highly positive, and I'll get one maybe later. 
4. You'll need a camera. Webcams should work. I'm using a Sony AX33 - a 4K camera with a clean 1080P HDMI out. It also flips the screen around so I can see the native capture, zoom in/out, and alter settings. The mains charger is a big bonus too as it powers the camera without needing the battery.
5. I'm using a CamLink 4k from Elgato for live video feed. Optional if you are editing footage rather than webcamming. 
6. brackets and mounts for the camera, tripods, that kind of thing
7. lights, lots of them.
8. A decent computer with a proper GPU and buckets of RAM. It's not going to work on an old 2009 laptop no matter how overspec'd it was for it's time. 

### Software

1. OBS Studio is great for 'live' use and with the virtual webcam plugin it can output directly into all the other tools that use webcams. 
2. DaVinci Resolve 16 is also great, but I couldn't figure out how to feed directly into it. Chromakey is trivial with this software
3. MS Teams works well with a green screen, fed by OBS and OBS-Virtual-Cam on Windows.
4. SLOBS is a variant of OBS and reputed to work, but I've not tried. 

### Other notes

1. If capturing video in OBS, save it as .mkv, then remux it into .mp4. 
2. DaVinci Resolve 16 won't open .mkv files, they need to be .mp4 (or other formats)
3. Record the footage you need in your target resolution/framerate.
4. If you are streaming with OBS and virtual camera, applying colour correction to the feed can help. 
5. Background effects worked great for me in Teams, both via OBS and directly from the Camlink 4k. I didn't even need a greenscreen, but the edges were kinda soft and fluffy so it's fine for calls but would be terrible for video production.
6. I've configured horizontal flip such that the image on the screen matches my head movement, like a mirror. 

### The backdrop
1. Put the greenscreen back as far as you can, it works a lot better. 
2. light the backdrop as bright and evenly as you can. This is vital to good results.
3. Eliminate all shadows on the green screen for the best results.
4. Apply enough light to the subject. Higher colour temperatures worked best during my experiments, usually more than 5000K. Match with other lights if possible. 
5. I'm using an RGB video light which allows hue to be 'dialled in'. setting it to green and illuminating the screen is highly effective at making it more green. When the green is more pure and saturated, the effect is a lot more effective.




