---
layout: posts
categories: 
  - ApTranscriptome
title: Thursday notes
tags: 
  - Silene
  - contaminants
  - RNAseq
---

* [Scrapy](http://scrapinghub.com/) for scraping data from websites
    - [example](https://github.com/scrapinghub/pycon-speakers)
* Another step towards reproduciblity - [packrat](http://rstudio.github.io/packrat/) dependency management system


### Silene

Read aster random effects [paper](http://projecteuclid.org/euclid.aoas/1380804816) and [technical report](http://conservancy.umn.edu/handle/135870) 

Defined random effects aster model:

~~~
reaster01 <- reaster(resp ~ varb + frts:(cont*site), 
                     list(block = ~ 0 + frts:subplot), 
                     pred, fam, famlist = famlist, varb, id, root, data = redata_silene)
~~~

Runs fine, but when I add a `pop` random effect:

~~~
reaster02 <- reaster(resp ~ varb + frts:(cont*site), 
                     list(block = ~ 0 + frts:subplot,
                          pop = ~ 0 + frts:cont/pop), 
                     pred, fam, famlist = famlist, varb, id, root, data = redata_silene)
~~~

I get an error:

~~~
Error in reaster.default(resp ~ varb + frts:(cont * site), list(block = ~0 +  : 
  step 1 part 1 (optim Nelder-Mead with pickle) fail
~~~

I emailed Charlie to ask about this - apparently an issue with Nelder-Mead so may not be 'fixable' via reaster.


### ApTranscriptome

Leveraging the power of git, checked out a new branch to use my full Trinity transcriptome assembly before cleaning. Re-ran expression quantification using `Sailfish` and ran R script through identification of thermally-responsive transcripts. Confirmed previous results:

```{r}
assembly <- rep(c("clean", "contaminated"), each = 11)
colony <- rep("A22", times = 22)
unmapped_ratio_clean <- c(0.8305, 0.7926, 0.8241, 0.8114, 0.8111, 0.8253, 0.8065, 0.8108, 0.8122, 0.8171, 0.8215)
unmapped_ratio_contaminated <- c(0.8304, 0.7926, 0.8242, 0.8114, 0.8111, 0.8253, 0.8065, 0.8108, 0.8122, 0.8171, 0.8215)
(mean.diff.unmapped <- mean(unmapped_ratio_clean - unmapped_ratio_contaminated))
```

Removing 'contaminant' sequences from the transcriptome has significant effects on expression quantification and thus downstream analyses. How to deal with mapping reads to known contaminants?

Do I:

a) Map reads to the complete transcriptome, including contaminants, and then remove the known contaminants. In this case, it seems that I risk incorrectly mapping reads to the contaminants and losing information (false negatives), analogous to a Type I (producer's) error.

b) Map reads to the "cleaned" transcriptome. This seems analogous to a Type II (consumer's) error where I risk finding significant changes in expression that are due to incorrectly mapping 'contaminant' reads to true transcripts (false positives).

Asked this question to Sailfish user's group and posted on Biostars...

