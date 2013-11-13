---
layout: posts
categories: ApGenome
title: Wednesday notes
tags:
  - Genomic-tip
  - DNA extraction
  - teaching
---

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

### Reading

De Mita, S., Thuillet, A.-C., Gay, L., Ahmadi, N., Manel, S., Ronfort, J. & Vigouroux, Y. (2013). Detecting selection along environmental gradients: analysis of eight methods and their effectiveness for outbreeding and selfing populations. [Molecular Ecology, 22, 1383–1399](http://onlinelibrary.wiley.com/doi/10.1111/mec.12182/abstract).

  - challenging to detect loci under selection using molecular data
  - authors evaluate 3 correlation-based and 5 differentiation-based methods using simulated data with different sampling schemes and migration patterns
  - all methods perform well when selection is strong
  - logistic-regression based methods haver higher false-positive rates
  - correlation-based methods have greater power when selection is weak
  - CWDRP (Coop et al 2010 Genetics) method has best power when selection is weak with low false positive rate
  - deviation from island model (e.g. isolation by distance) increases false positive rate for logistic regression based methods
  - selfing reduces power for differentiation-based methods and increases false positive rate for logistic-regression methods
  - sampling more than one individual per population increases false positives in logistic regression. Differentiation-based methods (especially FLK) improved with more samples per pop
  - CWDRP method computationally-slow and requires population-level frequency data
  - differentiation-based methods require a large number of populations (48) and 8-10 samples per pop
  - more thoughts on the implications of this paper for our Medicago work in [next post](% post_url 2013-11-13-methods-to-detect-selection %)

