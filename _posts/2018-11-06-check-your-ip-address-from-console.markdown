--

layout: post
date: 2018-11-06 06:59:59 +000
title: Get your current IP address from the terminal
categories: bash
--
On a Mac (and probably FreeBSD & Linux too) this will give you your current external IP address.

    curl -s checkip.dyndns.org | sed -e 's/.*Current IP Address: //' -e 's/<.*$//'

