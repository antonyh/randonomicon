---
layout: post

date:   2018-09-19 22:25:52 +0100
categories: jekyll update
---
Boot2Docker
===========

Boot2Docker is now deprecated in favour of docker-machine - some of this
information will still apply, and if you have to use older tools then
maybe this will help you until you are able to upgrade.

What is Boot2Docker?
--------------------

Boot2Docker is possibly the easiest way to run docker on Mac OS X and
Windows in a handy virtual machine, because docker only runs native on
Linux. It comes in two parts - a standard, normal, boring 'docker'
client command that behaves exactly as you might expect, and a
'boot2docker' command to manage the VM.

Boot2Docker commands
--------------------

All of these command accept a -v flag which greatly increases the
verbosity of the output and helps to diagnose issues and problems with
boot2docker. If you do have a problem this is the first thing to try, as
it will often immediately give you the vital clue you need to fix it and
make it work.

#### boot2docker version

This should often be the first thing you type when using boot2docker as
it will tell you two very important things. Firstly, that boot2docker
has been installed and can run. Secondly, it will let you know the
version number of the client should you need it to look up information
online when things aren't working as expected.

#### boot2docker init

This installs the virtual machine if it's missing, and sets it up ready
for use. This needs to be invoked to create the virtual machine in
VirtualBox before it can be started, and will set configuration options
for the VM. This has no effect if the machine already exists.

#### boot2docker up

This will start the virtual machine if it's not running. You have to
create the VM with 'boot2docker init' before you can use it.

#### boot2docker shellinit

This sets some environment variables to allow docker client to connect
to the daemon in the virtual machine. You'll invoke this most frequently
like this to setup the shell (using bash):

    $(boot2docker shellinit)

#### boot2docker ip

This will give you the IP of the virtual machine that boot2docker is
using. This IP is allocated using DHCP to the machine by VirtualBox on
the host-only network adaptor, and this is easiest way to get this
address.

You'll need to use this IP address if you are developing applications
that you want to access from the desktop, such as web sites that are
running in Docker. A common thing to do is to append it to the hosts
file:

    echo "`boot2docker ip` dockerhost" >> /etc/hosts

You'll need permissions to do this (you might need to sudo), and you
probably won't want to do this twice.

#### boot2docker ssh

This will connect to the virtual machine used by boot2docker using an
ssh session to give you a direct control over the docker 'server'.

    $ boot2docker ssh    
                            ##        .
                      ## ## ##       ==
                   ## ## ## ##      ===
               /""""""""""""""""\___/ ===
          ~~~ {~~ ~~~~ ~~~ ~~~~ ~~ ~ /  ===- ~~~
               \______ o          __/
                 \    \        __/
                  \____\______/
     _                 _   ____     _            _
    | |__   ___   ___ | |_|___ \ __| | ___   ___| | _____ _ __
    | '_ \ / _ \ / _ \| __| __) / _` |/ _ \ / __| |/ / _ \ '__|
    | |_) | (_) | (_) | |_ / __/ (_| | (_) | (__|   <  __/ |
    |_.__/ \___/ \___/ \__|_____\__,_|\___/ \___|_|\_\___|_|
    Boot2Docker version 1.5.0, build master : a66bce5 - Tue Feb 10 23:31:27 UTC 2015
    Docker version 1.5.0, build a8a31ef
    docker@boot2docker:~$ uname -a
    Linux boot2docker 3.18.5-tinycore64 #1 SMP Sun Feb 1 06:02:30 UTC 2015 x86_64 GNU/Linux
    docker@boot2docker:~$ 

We get a lovely ASCII art whale and boot2docker banner graphic, and it
tells us the verion number and build date of the VM image as well as the
docker version installed. It's running a Linux tinycore x64 kernel, and
you can treat this as any other Linux virtual machine, and issue
commands and inspect files:

    docker@boot2docker:~$ docker version
    Client version: 1.5.0
    Client API version: 1.17
    Go version (client): go1.4.1
    Git commit (client): a8a31ef
    OS/Arch (client): linux/amd64
    Server version: 1.5.0
    Server API version: 1.17
    Go version (server): go1.4.1
    Git commit (server): a8a31ef
    docker@boot2docker:~$ sudo ls /mnt/sda1/var/lib/docker/containers/
    7ed7fa5addb493dd80991abb97eac70b632974d16e07eba8c3e19d7fb5d27cfd 
    a4e8ef3fe971431a99ef92b7839a8e6e3531a08cd39b545a00c3c6326db87d73
    84aac4069d7ad11dac495835297a700e6c0caea794dbf03519562905ef466443 
    cd09afd2f02b3e44db813197c66c202df85a9915baecd16ca1d0b866c11b2558
    93b6bd377c2e3bfe9d341eb65753e7b7d1e4f86d65a63f2c4e1a4a17c89c6423 
    ce0be4300d6ae994ed8f79be61fa35be9e4325e821aa4442bab7c282893e981e
    docker@boot2docker:~$ 

Yikes, these long hex values keep breaking my page layout, but you get
the picture. Note that to access the docker files and directories you
have to be root or use sudo.

#### boot2docker status

This will return the single word state of 'running' if the virtual
machine is active. Other possible states are 'saved', 'poweroff', or
'error in run: Failed to get machine \"boot2docker-vm\": machine not
exist'.

#### boot2docker info

This gives a JSON output with some basic information about the
boot2docker configuration.

    $ boot2docker info
    {
        "Name": "boot2docker-vm",
        "UUID": "a0778397-8bc3-44c8-b3ce-cdf5dfd3b511",
        "Iso": "/Users/antonyh/.boot2docker/boot2docker.iso",
        "State": "running",
        "CPUs": 4,
        "Memory": 2048,
        "VRAM": 8,
        "CfgFile": "/Users/antonyh/VMs/boot2docker-vm/boot2docker-vm.vbox",
        "BaseFolder": "/Users/antonyh/VMs/boot2docker-vm",
        "OSType": "",
        "Flag": 0,
        "BootOrder": null,
        "DockerPort": 0,
        "SSHPort": 2022,
        "SerialFile": "/Users/antonyh/.boot2docker/boot2docker-vm.sock"
    }%           

There's nothing particularly interesting here in my opinion, except for
state and possibly memory if you are running into problems with RAM
allocation.

#### boot2docker save

This suspends the virtual machine, just as if you had paused it using
the VirtualBox tools. You can restore the machine using 'boot2docker
up'.

#### boot2docker down

Powers down the virtual machine. This is mostly useful if you need to
conserve memory and don't need to use docker for a while.

#### boot2docker restart

Powers down the virtual machine, then starts it up again. This can be
useful to fix problems in the same way as rebooting a physical machine
cures some conditions.

#### boot2docker config

Outputs some configuration as key/value pairs. This is different to the
'boot2docker info' output in both format and contents - it focuses on
the keys, ISO image, the VM provider, and network settings.

    boot2docker config
    # boot2docker profile filename: /Users/antonyh/.boot2docker/profile
    Init = false
    Verbose = false
    Driver = "virtualbox"
    Clobber = true
    ForceUpgradeDownload = false
    SSH = "ssh"
    SSHGen = "ssh-keygen"
    SSHKey = "/Users/antonyh/.ssh/id_boot2docker"
    VM = "boot2docker-vm"
    Dir = "/Users/antonyh/.boot2docker"
    ISOURL = "https://api.github.com/repos/boot2docker/boot2docker/releases"
    ISO = "/Users/antonyh/.boot2docker/boot2docker.iso"
    DiskSize = 20000
    Memory = 2048
    SSHPort = 2022
    DockerPort = 0
    HostIP = "192.168.59.3"
    DHCPIP = "192.168.59.99"
    NetMask = [255, 255, 255, 0]
    LowerIP = "192.168.59.103"
    UpperIP = "192.168.59.254"
    DHCPEnabled = true
    Serial = false
    SerialFile = "/Users/antonyh/.boot2docker/boot2docker-vm.sock"
    Waittime = 300
    Retries = 75

#### boot2docker upgrade

This will ask boot2docker to upgrade both the local client tools for
docker and the ISO used for the virtual machine.

    $ boot2docker upgrade 
    docker is up to date (1.5.0), skipping upgrade...
    boot2docker is up to date (v1.5.0), skipping upgrade...
    Latest release for boot2docker/boot2docker is v1.5.0
    Downloading boot2docker ISO image...
    Success: downloaded https://github.com/boot2docker/boot2docker/releases/download/v1.5.0/boot2docker.iso
        to /Users/anthonyh/.boot2docker/boot2docker.iso

#### boot2docker download

This downloads the ISO image.

    $ boot2docker download
    Latest release for boot2docker/boot2docker is v1.5.0
    Downloading boot2docker ISO image...
    Success: downloaded https://github.com/boot2docker/boot2docker/releases/download/v1.5.0/boot2docker.iso
        to /Users/anthonyh/.boot2docker/boot2docker.iso

#### boot2docker reset

If the virtual machine is running, this will reset it. This will
'Forcefully power cycle the VM (may corrupt disk image).' so use this
only if absolutely necessary as a last resort. This is the same as
opening the Virtualbox application and chosing 'power down', or pulling
the plug on a physical machine - it's completely safe unless it means
missing a deadline or if there's vital data.

#### boot2docker poweroff

If the virtual machine is running, this will quickly stop it. This will
'Forcefully power off the VM (may corrupt disk image).' so use this only
if absolutely necessary. I use this when things have gone very wrong and
I'm going to start again with a fresh instance. Basically, this is like
reset but without the reboot, and is more or less violently yanking the
plug out in a fit of rage knowing that I'm going to have to download all
those images again into a new VM.

#### boot2docker delete

Kill the VM disk image. This is final and there is no warning or prompt.
You do have a backup of anything important, right?

#### boot2docker help

If you want the most accurate information for your version of
boot2docker, use the built-in help system. It will give you useful
information and options, such as how to change the amount of memory,
enable verbose mode, or set the disk space for the virtual machine.
