---
layout: post
date: 2020-02-28 08:59:59 +000
title: Aliases in Windows 10 cmd.exe
categories: windows
comments: true
---

If you are like me and constantly typing `ls` in the windows command prompt, you'll like this.

#### Step one, create a text file somewhere that will run every time a command prompt is started that sets the aliases. 

This uses `doskey` to define the commands.

This will look somewhat like:
```commandline
@doskey ls=dir /B $*
``` 
You can put in here anything you want to run at the start of all command prompts.

#### Step two; tell Windows where to find the script

Create a file named `alias.reg` and edit it, adding the following content:

```
Windows Registry Editor Version 5.00

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Command Processor]
"CompletionChar"=dword:00000009
"DefaultColor"=dword:00000000
"EnableExtensions"=dword:00000001
"PathCompletionChar"=dword:00000009
"AutoRun"="C:\\Users\\username\\path\\to\\alias.cmd"
```

Set the path properly. Yes, it needs double backslashes. Double click it to install.

Disclaimer: you mess with the registry and bork your computer, that's your own doing. This file also contains my own settings for other config as you can see, so if you'd rather do this by hand in regedit, then go to `HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Command Processor` and add a string key `AutoRun` with the path to your alias script.

The aliases will be effective in new CMD consoles only.  
