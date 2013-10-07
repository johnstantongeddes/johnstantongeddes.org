---
layout: posts
categories: ApTranscriptome ThermBe
title: Week Notes 30 September - 4 October
tags:

---

## 2013-09-30

Damn - R and RStudio just got better with [R Presentations baked in](http://www.rstudio.com/ide/docs/presentations/overview)

Bio seminar - mtDNA for forensics

## git

How to use Dropbox as a private git repository [here](http://corrupt.net/2009/08/01/On-Version-Control/),  (here)[http://intermediaware.com/blog/how-to-use-dropbox-as-a-git-repository] and (stackoverflow)[http://stackoverflow.com/questions/1960799/using-git-and-dropbox-together-effectively]

## Medicago

Talked to Peter about final revisions for accepted manuscript. Edits...


## 2013-10-01

Spent about 4 hours figuring out how to re-do `pairs` function in R to allow plotting custom values in lower triangle rather than adding them with Inkscape after the fact. Now on [github](https://github.com/johnstantongeddes/acorns-analysis/blob/master/pairs-JSG.R). Painful but all R coding is worthwhile practice down the road...I hope.


## ThermBeAdapt

New project - "Thermal Behavior Adaptation" to examine effect of thermal-stress on caste differentiation. Plan was to use Aphaenogaster but not enough colonies, so change to Pogo, which there are many available colonies. 

Final training with Riley in antroom to work with Pogos. Plans for nest boxes. 

## Plant-insect interations meeting group

Burkle, L.A. and R. Alarcon. 2011. The future of plant-pollinator diversity: understanding interaction networks across time, space, and global change. American Journal of Botany 98: 1-11.

  - Spatial and temporal variability important for plant-pollinator interaction networks
  - yet seem pretty resilient to climate change


## 2013-10-02

### Medicago

Final edits to MEE paper.


### Sweave

Forcing myself to use Rnw through knitr to generate fully reproducible document and upload to [figshare]() using [rfigshare](https://github.com/ropensci/rfigshare)

Started with Charlie Geyer's template but ran into some problems due to compiling with knitr instead of Sweave. :

  - `\Sweaveopts` [is no longer supported](http://yihui.name/knitr/options). instead use code chunk with `opts_chunk$set(comment=NA, fig.width=6, fig.height=6)`
  - `<<results=tex>>` now gives an error. found that with knitr this has to be [replaced](http://biostat.mc.vanderbilt.edu/wiki/Main/KnitrHowto) with `<<results="asis"` and works!
  - use biblatex for [automatic bibliography generation with RStudio](http://texblog.org/2013/08/20/rknitr-automatic-bibliography-generation-with-biblatex-in-rstudio/)
  - but of course, the default citation styles are terrible. after some internet digging found this awesome guide for [biblatex ecology styles](http://timotheepoisot.fr/2012/04/26/biblatex-styles-ecology/) and accompanying github repository. cloned repository, copied *.cbx and *.bbx files for the desired style into project directory and included in latex preamble

    \usepackage[backend=bibtex, citestyle=ele, bibstyle= ele]{biblatex}

and compiled document with desired citation and bibliography style beautifully! At some point...contribute to repository with MEE citation style...
  - another useful [post](http://conjugateprior.org/2013/03/tools-for-making-a-paper/) on using knitr for latex reports.

### rfigshare

Ideally, the script would include information about archiving itself on FigShare using the [rfigshare](https://github.com/ropensci/rfigshare) package, but in practice unsure how to do this as I *do not* want this to be repeated each time script is run. I guess that the `fs_auth()` function would prevent someone else from logging into my figshare account and erasing my version? 

~~~
	\section{Upload document to figshare}

	<<figshare>>=
	# Requires that credentials are set [in advance](https://github.com/ropensci/rfigshare)

	library(rfigshare)

	# Run first time only
	id = fs_new_article(title="Estimating repeatability for Medicago truncatula phenotype data",
	                     description="Technical report accompanying Stanton-Geddes et al. 'Estimating heritability using genomic data' Methods in Ecology and Evolution",
	                     type="fileset",
	                     authors="John Stanton-Geddes",
	                     tags=c("repeatability", "Medicago truncatula","MCMC","heritability"),
	                     categories="Evolutionary biology",
	                     files=c("tr1-repeatability-Medicago.Rnw","tr1-repeatability-Medicago.pdf",
	                     files="tr1-repeatability-medicago.Rnw",
	                     visibility="drafts")
	@
~~~

Figshare does allow some sort of [version control](http://figshare.com/faqs#q10) but not sure how to use this - clearly not in the detailed way of git. More of a 'release' with major changes? What is the best way to incorporate this into a script?


### Reading

Karhunen, M., Merilä, J., Leinonen, T., Cano, J.M. & Ovaskainen, O. (2013). driftsel: an R package for detecting signals of natural selection in quantitative traits. Molecular Ecology Resources, 13, 746–754.

Ovaskainen, O., Karhunen, M., Zheng, C., Arias, J.M.C. & Merilä, J. (2011). A New Method to Uncover Signatures of Divergent and Stabilizing Selection in Quantitative Traits. Genetics, 189, 621–632. 

Stone, G.N., Nee, S. & Felsenstein, J. (2011). Controlling for non-independence in comparative analysis of patterns across populations within species. Philosophical Transactions of the Royal Society B: Biological Sciences, 366, 1410–1424.


## 2013-10-04

Busy day! 

* submitted job application to Bates
* editorial edits to Ecology paper
* final submission of MEE paper

