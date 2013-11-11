---
layout: posts
categories: ApTranscriptome
title: Monday notes
tags:
  - knitr
  - Sweave
---

Sara reported on EcoGen meeting in KC

  - [iPath](http://pathways.embl.de/) may be useful tool for identifying genes in metabolic pathways

### Computing

slideshare on [python](http://www.slideshare.net/MattHarrison4/learn-90)

NG wrote an R shell script to generate html file from Rmd file. Modified script to generate a pdf from markdown file using system call to pandoc.

Information on command-line call to `knitr` [here](http://stackoverflow.com/questions/10943695/what-is-the-knitr-equivalent-of-r-cmd-sweave-myfile-rnw). The answer is 

    Rscript -e "library(knitr); knit('myfile.Rmd')"

In comments, Yihui includes link to an Rscript that doe Rmd->html or Rnw->pdf from command line, `knit file.Rmd`. Elegant script - nice example for using R as a program with command-line arguments! Added script to /usr/local/bin so globally available.

Info on how you [what R CMD Sweave does](http://stackoverflow.com/questions/8184377/what-exactly-does-r-cmd-sweave-pdf-do)

### ApTranscriptome

Consider using [TrinotateWeb](http://trinotate.sourceforge.net/TrinotateWeb.html) with or in place of [shiny](http://www.rstudio.com/shiny/) for web documentation of assembly

