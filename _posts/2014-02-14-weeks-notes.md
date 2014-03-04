---
layout: posts
categories: ApTranscriptome
title: February 10 - 14 notes
tags: 
  - shiny
---

## 2014-02-10

### R

Guide to [deploying shiny on Amazon EC2](http://trestletechnology.net/2013/02/deploying-shiny-server-on-amazon-ec2/)

Set up alpha account for shinyapps and deployed my [ApRxN app](http://johnsg.shinyapps.io/ApRxN-shinyapp/)!

Followed this [guide](https://github.com/rstudio/shinyapps/blob/master/guide/guide.md)

Cool [R script](http://www.r-bloggers.com/sochi-olympic-medals/) to query a website and plot Olymic medal data.

### ApTranscriptome

Regarding Don's suggestion to give drop-down list of GO IDs rather than a search box,
may be able to use [this function](http://svitsrv25.epfl.ch/R-doc/library/GO.db/html/GOBPPARENTS.html) that describes relations among GO terms to extract the correct transcripts
for a given GO term.

Writing manuscript...



## 2014-02-11

### Reading

Fu, G.K., Xu, W., Wilhelmy, J., Mindrinos, M.N., Davis, R.W., Xiao, W. & Fodor, S.P.A. (2014). Molecular indexing enables quantitative targeted RNA sequencing and reveals poor efficiencies in standard library preparations. Proceedings of the National Academy of Sciences, 111, 1891–1896.

  - awesomely massive barcoding of *individual* cDNA transcripts
  - sampling of transcripts saturates at about 20x coverage (starting with 10 pg RNA)
  - "Any transcripts that were present in the starting material at less than 1,000 copies are simply lost"

Li, Y., Cheng, R., Spokas, K.A., Palmer, A.A. & Borevitz, J.O. (2014). Genetic Variation for Life History Sensitivity to Seasonal Warming in Arabidopsis thaliana. Genetics, 196, 569–577.

  - identify QTL for flowering time (FT) sensitivity to overwintering conditions
  - phenotypic prediction: BLUPs of QTL effects could predict flowering in 2055 conditions using data from first three environments with r2=0.95

shinyapps error message:

    The application unexpectedly exited.

    Diagnostic information has been dumped to the JavaScript error console.


## 2013-02-12

Working on transcriptome manuscript.

Changed shinyapp to "medium" size (up to 500MB RAM) and it now seems to run with problem.


## 2014-02-13

Working an analysis and manuscript.


## 2014-02-14

out sick



