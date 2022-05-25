---
layout: post
date: 2022-05-25 00:59:59 +000
title: Change video resolution on HyperV Linux VMs
description: HyperV doesn't like linux framebuffers much
categories: hyperv
comments: true
sharing: true
icon: bath
---

I've got as far as

Power down the VM and run in powershell:

    > Set-VMVideo -VMName 'selfridges-ubuntu2204' -HorizontalResolution 2560 -VerticalResolution 1440 -ResolutionType Single

Start the VM, open a terminal, and run this command:

      sudo vim /etc/default/grub

change 

    GRUB_CMDLINE_LINUX_DEFAULT="quiet"
    GRUB_CMDLINE_LINUX=""

to

    GRUB_CMDLINE_LINUX_DEFAULT="quiet video=hyperv_fb:2560x1440"
    GRUB_CMDLINE_LINUX="quiet video=hyperv_fb:2560x1440"

(size must match in all three places)

Run these commands to configure the boot loader:

    sudo update-grub
    reboot

This seems to work for me.
