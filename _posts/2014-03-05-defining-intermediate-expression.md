---
layout: posts
categories: ApTranscriptome
title: Intermediate-expression: biological interpretation
tags: 
  - regression
  - statistical inference
---




### ApTranscriptome

Completely re-working analysis, splitting thermally-responsive transcripts to examine differences among transcripts with colony x temperature interaction.

[Nice tip](https://stats.stackexchange.com/questions/76959/finding-inflection-points-in-r-from-smoothed-data/77005#77005?newreg=4e0fbf1b6e4b4bc692f6ff87e2a2c9f4) on how to identify inflection point. 

-----------------------------------------------

Found that my "Intermediate" expressed transcripts included those with the correct curvature, but that had maximum expression below (<10) or above (>31) the 'intermediate' interval. Felt rather foolish - this is exactly the issue with identifying stabilizing selection highlighted by <a href="http://dx.doi.org/10.2307/2409084">Mitchell-Olds & Shaw (1987)</a>. At least I'm not the first (or last) to make this mistake. 

Modified function to *only* call a transcript "Intermediate" if curvature is correct *and* the maximum is between 10 and 31C. 

Interestly, also found that there's an [R function](http://www.inside-r.org/packages/cran/vegan/docs/MOStest) named after <a href="http://dx.doi.org/10.2307/2409084">Mitchell-Olds & Shaw (1987)</a> to check if maximum or minimum of quadratic function is within studied interval.

### References


- Thomas Mitchell-Olds, Ruth G. Shaw,   (1987) Regression Analysis of Natural Selection: Statistical Inference And Biological Interpretation.  *Evolution*  **41**  1149-NA  [10.2307/2409084](http://dx.doi.org/10.2307/2409084)

