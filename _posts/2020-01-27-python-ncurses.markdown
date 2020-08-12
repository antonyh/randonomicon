---
layout: post
date: 2020-01-20 08:59:59 +000
title: Build a developers menu with Python and NCurses 
categories: Python
comments: true
---

If you are anything like me then you get bored and tired of remembering mundane
commands that you have to type every day and sometimes find that the shell history is somewhat forgetful. My answer to this is to build a menu to do the common things.

This is based on the teachings and notes found at this highly useful article.

https://www.devdungeon.com/content/curses-programming-python

h2. Step zero: on windows only

Install windows-curses if you want this to work.
pip install windows-curses

I'm assuming you already have Python 3.6+

h2. Step one: create a .py file

I like to call mine hap.py

h2. Step two: put some code in the file.

import curses
screen = curses.initscr()
screen.addstr(0, 0, "This string gets printed at position (0, 0)")
screen.refresh()
curses.napms(3000)
curses.endwin()


This will print a line of text to the screen using curses and wait three seconds.

h2. Step three: run it

python hap.py



h2. Step four: make it more useful

Replace the napms with a loop:

c = 0
while (chr(c) is not 'x'):
    c = screen.getch()
    screen.addstr(5, 0, "> ")
    screen.refresh()
    if chr(c) == '1':
        print("do something")
    if chr(c) == '2':
        print("do something")
    if chr(c) == '3':
        print("do something")

h2. Make it do something

import os
import subprocess

subprocess.call("/some/command")

I'll leave it as an exercise for you to figure out where to put this. Clue: it replaces the print statements.

Don't forget to add instructions to the screen to match the commands.

You might also want to wait for a keypress after running the command:

screen.addstr("Press any key...")
screen.refresh()
screen.getch()
