---
layout: posts
category: ecological genetics
title: Update on open lab notebook
tags:
  - open science
---

Into my 4th month of my open lab notebook. Maybe this is simply becoming an obsession, but I've found that this has vastly improved how I organize, and think about organizing, my research.

For example, I was simply filing all posts into the general category "ecological genetics" as my research generally falls in this area and I simply used tags for sorting posts. Then in a [conversation]({% post_url 2013-06-28-weeks-notes %}) with SHC about the challenge of logically labeling samples, the obvious (to quote Ruth Shaw quoting Joe Felsenstein "Everything is obvious in hindsight") solution of simply labeling ALL samples sequentially made me realize that I should do the same for my projects. So, I know maintain a master database of all [projects]({% post_url 2013-07-12-projects %}) I am working on, and will file posts under the category of the respective projects. 

While working on a review, I realized there was no reason not to do this for [reviews I perform as well]({% post_url 2013-07-10-reviews %}). This might come in useful for annual reviews, or maybe even sharing with editors when I accept or reject offers to review. Interesting side-note that I've already done more reviews half-way through 2013 than I did in all 2012. Hope the requests don't continue at this rate.

And as the triggering conversation suggested, I also plan to do this for samples I collect in the future, with the master database maintained here as well so collaborators can always go online and check out the metadata for samples I've collected.


### Issues

The primary challenge that I've run into is *confidentiality*. 

While I strive to maintain openness in my ongoing work, I've increasingly realized that there are many notes, ideas and conversations that I ethically (and selfishly - some small fraction of my ideas are good!) shouldn't share. They are ideas from others who may not be as committed to open science, or are simply *brilliant* (italics for sarcasm) ideas that may take 6-?? months to initiate and just in case anyone is snooping out there, we should give ourselves time to develop and initiate the research. Fortunately, I don't deal with human subjects so I don't have any *real* confidentiality issues beyond the ones mentioned.

The solution to this is pretty straight-forward: keep a `\private` sub-directory within the `_posts` directory. All posts that may confidential I stick in here - otherwise nothing is different with standard posts. This directory is ignored by my .gitignore so it is not tracked or pushed to github, and is excluded `exclude : [_posts/_private/, assets/figures]` in my `_config.yml` file for jekyll. So, these posts are effectively embargoed for some un-specified (infinite?) amount of time until I feel like making them available

