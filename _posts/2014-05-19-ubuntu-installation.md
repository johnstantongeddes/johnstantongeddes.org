---
layout: posts
categories: 
  - Computing
title: Ubuntu 12.04 System Configuration
tags: 
  - Ubuntu
  - installation
---

Installing Ubuntu 14.04 worked on my Lenovo ThinkCentre m90z, but the computer never resumed from 'Suspend'. After trying a number of work-around without success, decided to take opportunity to clean-up installation with fresh install of 12.04 LTS. 

Change post-installation:

**Software**

- [Install R](http://cran.r-project.org/bin/linux/ubuntu/README)
- [Install emacs 24.3](https://launchpad.net/~cassou/+archive/emacs) from PPA
- Install git for version control.
- [Install TeX Live 2013](https://github.com/scottkosty/install-tl-ubuntu)
- [Install Zotero](https://github.com/smathot/zotero_installer)
- Install Jekyll for online lab notebook - see detailed post [here]({% post_url 2014-06-02-install-jekyll %})
- Install and configure [s3cmd](http://s3tools.org/s3cmd) for managing Amazon S3.
- Install newest version of pandoc and pandoc-citeproc following these [notes](http://johnstantongeddes.org/open%20science/2014/03/27/install-pandoc.html)

**Hardware**

- Second monitor - added "xrandr" settings to /etc/profile so correct resolution is persistent

~~~
	xrandr --newmode "1440x900_59.90" 106.29 1440 1520 1672 1904 900 901 904 932 -HSync +Vsync
	xrandr --addmode DP1 1440x900_59.90
	xrandr --output DP1 --mode 1440x900_59.90
~~~

- [Configured Logitech TrackMan](https://help.ubuntu.com/community/Logitech_Marblemouse_USB) in file `usr/share/X11/xorg.conf.d/10-evdev.conf` by adding [this information](http://superuser.com/questions/374504/configure-a-trackball-under-linux-without-editing-xorg-conf)

~~~
Section "InputClass"
	Identifier "Marble Mouse"
	Driver "evdev"
	MatchProduct "Logitech USB Trackball"
	MatchDevicePath "/dev/input/event*"
	MatchIsPointer "yes"
	Option "ButtonMapping" "1 9 3 4 5 6 7 2 8"
	Option "EmulateWheel" "true"
	Option "EmulateWheelButton" "3"
	Option "ZAxisMapping" "4 5"
	Option "XAxisMapping" "6 7"
	Option "Emulate3Buttons" "false"
EndSection
~~~




