---
layout: posts
category: computing
title: starting an open lab notebook
tags: 
  - website
  - jekyll
modified: 2013-04-12
---

The first entry in my open lab notebook! Setting up an open lab notebook has been on my mind for a while, and with starting a new position I decided to give it a go. My motivations for this come from PhD stats committee member Charlie Geyer who has been writing about [reproducible research before it was cool](http://users.stat.umn.edu/~geyer/Sweave/) and the recent availability of tools to make it possible for marginally-computer literate biologists such as myself. Specifically, the [knitr](http://yihui.name/knitr/) package in R for writing literate scripts, git and [github](https://github.com) for version control, the [pandoc markdown](http://johnmacfarlane.net/pandoc/) program for enabling convenient file formats, and Carl Boettiger for putting this all together in his tremendous [lab notebook](http://www.carlboettiger.info/) with a great [introduction](http://www.carlboettiger.info/2012/12/30/learning-jekyll.html) to "blogging like a hacker" using [jekyll](https://github.com/mojombo/jekyll). I want to emphaszie, as Carl points out, this is a *lab notebook*, not a blog. There are many great blogs in ecology and evolution. I'll let you find the ones you like on your own.

## So why go through the trouble to host an open lab notebook? ##

- Reproducible research. 
	- The cost, complexity and time of most experiments in evolution and ecology research prevent the gold standard of true experimental reproducibility. This lack of reproducibility is compounded by the fact that statistical analyses are often complex and not reproducible from what is the written in the concised-to-death *Methods* sections of most papers today. The silver standard is to make our analyses reproducible. We can do this by writing *literate* scripts that are *reproducible*, and making the original scripts and data available through data repositories such as [Dryad](http://datadryad.org). You can see my [novice attempts](http://datadryad.org/discover?field=dc.contributor.author_filter&fq=location:l2&fq=dc.contributor.author_filter%3Astanton%5C-geddes%2C%5C+john%5C%7C%5C%7C%5C%7CStanton%5C-Geddes%2C%5C+John) where I've posted R scripts and the associated data files for the papers from my PhD. More about the need for reproducible research can be read [here](http://arstechnica.com/science/2010/01/keeping-computers-from-ending-sciences-reproducibility/) among other places.

- Accountability. 
	- Most of my work these days involves writing scripts of many hundred lines in R, occassionally calling command-line programs. In addition, with genome assembly and mapping, multiple programs with rather specific command-line options are piped together. However much I like to say that I don't make mistakes...I do. I like to think we all do. I sharply remember the day I had to report that a simple `merge` command had thrown out about 3 million SNPs. Oops. I've found that the best way to avoid this is by careful management of my code, using [version control](http://git-scm.com/book/en/Getting-Started-About-Version-Control) so I don't have multiple versions of scripts banging around, as well as many internal checks (e.g. check that the number of rows after a merge is what you expect!). In fact, Nick has a chapter on "Managing and Curating Data" in his [book](http://www.sinauer.com/detail.php?id=0646) that all evo-ecologists should read before starting a new project to get in the mindset to avoid problems from the start!

- Public relations.
	- Basic science is under strong pressure to justify its funding. For most of the public, the process of science is a black-box. While I love my good'ole paper notebook, only I (and not even I at times) can decipher my scrawl, even if others were to see it. Nobody may ever read this...but each person that does is one person more than would ever see my paper notebook. This point generally falls under the umbrella of making my work truly [open science](http://en.wikipedia.org/wiki/Open_science).

- Publishing
	- Many journals now require data and analyses to be made available. Keeping a digital lab notebook just means putting this work up front, which is easier than doing it after the fact.


## So are there downsides? ##

Sure - some people would be concerned about exposing mistakes (embarrassing) or getting beat in the race to publish. Hopefully a small risk relative to the benefits.




 
