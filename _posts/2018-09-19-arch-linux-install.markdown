---
layout: post
title: Arch Linux Notes
date:   2018-09-19 22:25:52 +0100
categories: arch-linux, half-baked, rough-notes
---
Arch Linux Notes
================

I've stopped using Arch for the moment, but these notes are still useful to me.

mount /dev/\... /mnt 
mkdir /mnt/home 
mount /dev/\... /mnt/home 
mkdir /mnt/boot 
mount /dev/\... /mnt/boot 
arch-chroot /mnt 
pacman -S grub
pacman -S lvm2

vi /etc/mkinitcpio.conf ?? 
grub-install ?? 
mkinitcpio -p linux

unmount and reboot

netctl..

pacman -S base-devel

install X 
pacman -S xorg terminus-font xmonad gnome emacs
