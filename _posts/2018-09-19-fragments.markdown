---
layout: post

date:   2018-09-19 22:25:52 +0100
categories: jekyll update
---
Fragments
=========

Unity3D
-------

### Unity3D web player preferences

Unity3D web player stores player preferences here:
 /Library/Preferences/Unity/WebPlayerPrefs/ using this script api:
<http://docs.unity3d.com/ScriptReference/PlayerPrefs.html>

Git
---

### .gitconfig file

    cat ~/.gitconfig

    [core]
        excludesfile = /Users/antonyh/.gitignore_global
    [user]
        name = Antony Hutchison
        email = antony@hutchisontechnical.co.uk
    [push]
        default = simple
    [gui]
        fontui = -family Helvetica -size 13 -weight normal -slant roman -underline 0 -overstrike 0
        fontdiff = -family Inconsolata -size 12 -weight normal -slant roman -underline 0 -overstrike 0
        recentrepo = /Users/antonyh/git/project
    [color]
        ui = true
    [gitreview]
        username = antonyh

        
    [alias]
        visual = !gitk 
        cleanup = !git branch --merged | grep -v '\\*\\|master\\|develop' | xargs -n 1 git branch -d
        co = checkout
        br = branch
        ci = commit
        st = status
        unstage = reset HEAD --
        last = log -1 HEAD

Groovy
------

### Exec command

This will run 'df' and print out the output of the command.

    "df -h".execute().text

See also
<http://www.joergm.com/2010/09/executing-shell-commands-in-groovy/>

Jenkins
-------

### Groovy console

Run arbitrary Groovy scripts: go to
[http://jenkins-server:port/script](http://jenkins-server:port/script)
