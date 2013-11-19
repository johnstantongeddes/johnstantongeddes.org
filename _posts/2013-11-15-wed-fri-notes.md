---
layout: posts
categories: Teaching ApGenome
title: Wed - Fri notes
tags:
  - teaching
  - DNA
  - jekyll
  - pandoc
---

## 2013-11-13

### ApGenome

Aphaenogaster sample Genomic-tip DNA extraction day 2.

Nandrop results terrible!!! No idea why - saw beautiful strands of DNA at isopropanol precipitation stage and followed exact same protocol as previous extraction with Pogo after that.

1) Re-precipitated sample (500 ul) with 750 ul 70% EtOH. Centrifuged 10 min top speed. Air-dry. Re-hydrate in 200 ul Buffer AE and Nanodrop in morning.
2) I had saved Genomic-tip for this event. Added 1 ml Buffer QF. Precipitated in EtOH and centrifuged. Air-dry. Re-hydrate in 200 ul Buffer AE and Nanodrop in morning.

### Website

While setting up jekyll for static website on xubuntu laptop, decided to write quick notes on install process:

Install jekyll, requires an up-to-date version of ruby
    
    sudo apt-get install ruby1.9.1-dev
    sudo gem install jekyll
    # Need `pandoc-ruby` gem for pandoc compatability
    sudo gem install pandoc-ruby

That's it! 

Clone the website and build or serve locally!

   git clone https://github.com/johnstantongeddes/johnstantongeddes.org.git
   jekyll serve
    
Of course, this is for an install of my own website...a new website would require some more steps.

Added javascript to base html layout to [allow mathjax in posts](http://stackoverflow.com/questions/10987992/using-mathjax-with-jekyll).

### Computing

[egglib](http://egglib.sourceforge.net/) python library for evolutionary genetics and genomics


## 2013-11-14

Prep for teaching BCOR 11 and Pop Gen classes.

## 2013-11-15

### BCOR

Post-translation modification and kuru. Lecture slides [here]({{ site.url }}/assets/lectures/translation_2_web.html) and case study [here]({{ site.url }}/assets/lectures/kuru-case-study.pdf)

### Population Genetics

Research presentation.

