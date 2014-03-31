---
layout: posts
categories: 
  - open science
title: Making a bibliography with Pandoc 
tags: 
  - pandoc
  - bibliography
---

[Pandoc](http://johnmacfarlane.net/pandoc/) is a great file conversion tool, but the feature I'm most excited about is it's simple method for dealing with [citations](http://johnmacfarlane.net/pandoc/README.html#citations).

Unfortunately, getting this feature to work isn't easy [^1]. First, you need a *newish* version of pandoc.

Installing the newest version (v1.12.3) was a pain in the ass and there was no clear guide online. Posted this answer on [AskUbuntu](http://askubuntu.com/questions/341295/install-pandoc-required-for-docverter/439968#439968). 

### Guide to installing the newest version of `pandoc` on Ubuntu

Due to my frustration and lack of a clear reference online, posted 

1. Install `cabal`

    `sudo apt-get install cabal-install`

2. Make sure that path to cabal is at start of PATH (tip from [here](http://askubuntu.com/questions/204122/trying-to-install-pandoc-via-cabal-install-fails))

    `PATH=$HOME/.cabal/bin:$PATH`

3. Update cabal package database

    `cabal update`

4. Use cabal to install alex and happy

    `cabal install alex happy`

5. Use cabal to install pandoc (and pandoc-citeproc if wanted)

    `cabal install pandoc pandoc-citeproc`

6. Check pandoc version to confirm installed

   `pandoc --version`

Add the `PATH=$HOME/.cabal/bin:$PATH` command to [~/.profile](http://unix.stackexchange.com/questions/26047/how-to-correctly-add-a-path-to-path) so `pandoc` available on next restart.


[^1]: At least, couldn't get it to work on my Ubuntu 13.10 desktop, though I could get it to work on a Mac running an *older* version of Pandoc. 
