---
layout: posts
categories: 
  - ApTranscriptome
title: May 20 - 23 notes
tags: 
  - thermal reactionome
---

## 2014-05-20

* [Use `make` to run R in parallel](http://plindenbaum.blogspot.com/2014/01/parallelizing-rstats-using-make.html)
* [Ross-Ibara preproposal in LaTex on github!](https://github.com/RILAB/PGRP)


### ApTranscriptome

Is it necessary to parse "Low" transcripts into those that are up-regulated at low temperatures, versus those that are shut-down at high temperatures. To examine this, plotted this for some examples using following code:

~~~r
A22.low.Ar.int.TPM.dt.sub <- resp.TPM.dt.sub.pred[J(A22.low, Ar.int), "A22")]

for(i in unique(A22.low.Ar.int.TPM.dt.sub$Transcript)[1:10]) {
    s <- A22.low.Ar.int.TPM.dt.sub[i]
    X11()
    plot(s$val, s$pTPM, ylim = c(0, max(s$pTPM)+.1))
    points(s$val, s$TPM, pch = 8, col = "red")
}  
~~~

Some that clearly have activated at high temperatures, while others steadily decline from cold to hot temperatures. Decided to split this into "On low" and "Off high" by taking advantage of quadratic fit; if the expression level at any temperature above 30°C is the minimum, designate the gene as 'off' at high temperatures (shallow curve, minimum at or beyond 30°C). Otherwise, designate as 'on' at high temperatures.

~~~
for(i in unique(A22.low.Ar.int.TPM.dt.sub$Transcript)[1:10]) {
    s <- A22.low.Ar.int.TPM.dt.sub[i]
    if(min(s[which(s$val < 30) , pTPM]) < s[which(s$val == 38.5), pTPM]) print("On low") else {
        print("Off high")
    }
}
~~~


## 2014-05-21

Starting to use DAVID throught the `rDAVIDWebService` package from [Bioconductor](http://www.bioconductor.org/packages/release/bioc/html/RDAVIDWebService.html). Detailed installation explained [here]({% post_url 2014-05-21-rDAVIDWebService-install %}).


## 2014-05-22

### ApTranscriptome

Working on DAVID analysis

Writing...sent out draft!



## 2014-05-23

- Writing my section of Centennial ms

- Cool R projects
    - [rOpenHealth](https://github.com/rOpenHealth)
    - [rOpenGov](http://ropengov.github.io/projects/)
    - [World Bank data](https://github.com/vincentarelbundock/WDI)

- Potentially useful book - [Quantitative Genetics in the Wild](http://books.google.com/books?id=iDSTAwAAQBAJ&printsec=frontcover#v=onepage&q&f=false)

- [PGDSpider](http://www.cmpg.unibe.ch/software/PGDSpider/): program to convert sequence formats for population genetics (e.g. Structure).

