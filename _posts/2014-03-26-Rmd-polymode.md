---
layout: posts
categories: 
  - open science
title: Using ESS with .Rmd files 
tags: 
  - emacs
  - ESS
  - R
  - knitr
---

For the past year or so, I've been using the amazingly full-featured [Emacs Speaks Statistics](http://ess.r-project.org/) package for my R coding. Though [RStudio](http://rstudio.com/) has a nice GUI and additional features, the benefit of being able to run ESS on a server[^1] through the terminal is a killer feature, as well as the fact that I can leverage all the other available emacs tools (such as emacs shell). 

*But* a major frustration (and I'm not [alone](http://stackoverflow.com/questions/16172345/how-can-i-use-emacs-ess-mode-with-r-markdown)) has been that I've been unable to use ESS with Rmarkdown files. Thus, I've been reduced to the hack of coding a .R file, and symbolically linking a .Rmd file to it that I could `knit`. 

As recommended on [SO](http://stackoverflow.com/questions/16172345/how-can-i-use-emacs-ess-mode-with-r-markdown), I finally looked into using [polymode](https://github.com/vitoshka/polymode). Lo-and-behold, it works! 

Getting it to work wasn't easy though, so here are my steps.


1. Polymode requires emacs 24.3 (documented in this [issue](https://github.com/vitoshka/polymode/issues/3). For Ubuntu, this can be installed using a PPA as described [here](http://ubuntuhandbook.org/index.php/2013/09/install-upgrade-to-emacs-24-3-in-ubuntu-13-04-12-10-12-04/)

2. Install [markdown-mode.el](http://jblevins.org/projects/markdown-mode/) from Ubuntu package manager

    sudo apt-get install emacs-goodies-el

2. Add the following code to `.emacs` file to associate markdown-mode with .text, .markdown and .md files

    (autoload 'markdown-mode "markdown-mode"
       "Major mode for editing Markdown files" t)
    (add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
    (add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
    (add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

3. Restart emacs and open `.md` file. Confirm that `markdown-mode` works by trying one of the questionably-useful[^2] commands:

  - `C-c C-a l` inserts an inline link of form `[text](url)`
  - `C-c C-i i` inserts markup for inline image
  - `C-c C-s b` inserts blockquote for active region (nice!!)
  - `C-c C-s p` inserts code block for active region (nice!!)

4. Clone "polymode" from github repository.

    git clone https://github.com/vitoshka/polymode.git

6. Add "polymode" and "polymode/modes" directories to emacs path in your `.emacs`:

    (setq load-path (append '("/home/jsg/.emacs.d/polymode/" "/home/jsg/.emacs.d/polymode/modes") load-path))

7. Require polymode bundles in your `.emacs`

    (require 'poly-R)
    (require 'poly-markdown)

8. Restart emacs and open a `.Rmd file`. All the beauty of ESS should now work!

A tangentially-related but useful tip: if you're working on a remote server via `ssh`, to get plots to appear interactively on local desktop (when working on server), use:

    ssh -X -t user@server


[^1]: Yes, I know about RStudio server but haven't the time or skilz to set it up.

[^2]: Markdown is pretty-damn simple - no key strokes to remember, so why add them?
