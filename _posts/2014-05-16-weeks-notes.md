---
layout: posts
categories: 
  - ApTranscriptome
title: May 12 - 16 notes
tags: 
  - ddRADseq
  - LaTex
  - Silene
  - git
  - rmarkdown
---

## 2014-05-12

### ApTranscriptome

Finished plotting when expression increases or decreases. Significant differences between colonies, but is it biologically meaningful?

* [R with Hadoop](https://jeffreybreen.wordpress.com/2013/01/25/slides-and-replay-of-my-using-r-with-hadoop-webinar-now-available-rstats-hadoop/)
* AN practice talk
* Gotelli lab clean-up

### ddRADseq

SHC ran PCR on samples with varying amounts of adapters from ligation step. Worked! Looks like adapter concentration was too low in ligation step and required empirical determination.

### Reading

Eckert, A.J., Bower, A.D., Wegrzyn, J.L., Pande, B., Jermstad, K.D., Krutovsky, K.V., Clair, J.B.S. & Neale, D.B. (2009). Association Genetics of Coastal Douglas Fir (Pseudotsuga menziesii var. menziesii, Pinaceae). I. Cold-Hardiness Related Traits. Genetics, 182, 1289–1302.  

Eckert, A.J., Wegrzyn, J.L., Liechty, J.D., Lee, J.M., Cumbie, W.P., Davis, J.M., Goldfarb, B., Loopstra, C.A., Palle, S.R., Quesada, T., Langley, C.H. & Neale, D.B. (2013). The Evolutionary Genetics of the Genes Underlying Phenotypic Associations for Loblolly Pine (Pinus taeda, Pinaceae). Genetics, 195, 1353–1372. 

Walsh, B. & Blows, M.W. (2009). Abundant Genetic Variation + Strong Selection = Multivariate Genetic Constraints: A Geometric View of Adaptation. Annual Review of Ecology, Evolution, and Systematics, 40, 41–59. 

Yin, T., Cook, D. & Lawrence, M. (2012). ggbio: an R package for extending the grammar of graphics for genomic data. Genome Biology, 13, R77. 

 

## 2014-05-13

- [Web app for writing LaTex](https://www.writelatex.com/)
- [Udacity course on Exploratory Data Analysis in R](https://www.udacity.com/course/viewer#!/c-ud651/l-685569241/e-824578546/m-824578547)
- [R quirks](http://www.r-bloggers.com/7-r-quirks-that-will-drive-you-nutty/)
    - to keep a single row of a matrix as a matrix use `dim(mymatrix[1, , drop = F])`
- [Watermark images using ImageMagick](http://www.imagemagick.org/Usage/annotating/#wmark_text)
- Create animated GIF using ImageMagick

     convert -delay 500 -loop 0 ant_field_trip.Joshua_Brown.7.13_25_of_38.jpg Cf.jpeg aphaeno_mollybog_20130515.png ant_field_trip.Joshua_Brown.7.13_15_of_38.jpg Cf_greenhouse.jpg ant_field_trip.Joshua_Brown.7.13_36_of_38.jpg JSG_animation.gif


### Silene

Finished tech report - sent to Steve

### ApTranscriptome

Writing...



## 2014-05-14

- [Citable DOI for Github repository!](https://github.com/blog/1840-improving-github-for-science)

### ApTranscriptome

Changed manuscript document to be compatible with the `rmarkdown` package. 
Added YAML header:

---
title: "Thermal reactionome of a temperate ant species"
author: "John Stanton-Geddes, Andrew Nguyen, Mahesh Vangala, Jim Vincent, Rob Dunn,
  Aaron Ellison, Nate Sanders, Nick Gotelli, Sara Helms-Cahan"
csl: ecology.csl
output:
  pdf_document:
    fig_caption: yes
    latex_engine: xelatex
  html_document: null
bibliography: ApTranscriptome.bib
---

and can now compile PDF with citations directly from RStudio! In theory, can also do from command-line using `Rscript -e "library(knitr); library(rmarkdown); render('input.Rmd')"` though I haven't tested this.


## 2014-05-16

Analysis. Writing. Getting there!!!

- Include git version information as [watermark in LaTex](http://tex.blogoverflow.com/2014/05/gitinfo2-latex-and-git-join-forces/?cb=1). Cool!

