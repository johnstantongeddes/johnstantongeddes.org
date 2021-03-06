---
layout: posts
categories: 
  - ApTranscriptome 
  - open science
title: Friday notes
tags: 
  - knitr
  - knitcitations
  - unicode
---




### ApTranscriptome

Testing `integrate()` and [AUC](http://stackoverflow.com/questions/4954507/calculate-the-area-under-a-curve-in-r) to calculate area under curve of 'Intermediate' expressed transcripts.


### Tools

Federico pointed out [prinseq](http://prinseq.sourceforge.net/index.html) (<a href="http://dx.doi.org/10.1093/bioinformatics/btr026">Schmieder & Edwards, 2011</a>) for filtering fastq files and [deconseq](http://deconseq.sourceforge.net/index.html) to "automatically detect and efficiently remove sequence contaminations from genomic and metagenomic datasets". Both look useful for future work.


- R. Schmieder, R. Edwards,   (2011) Quality Control And Preprocessing of Metagenomic Datasets.  *Bioinformatics*  **27**  863-864  [10.1093/bioinformatics/btr026](http://dx.doi.org/10.1093/bioinformatics/btr026)



### Linux

After frustration, finally found how to type degree (and other symbols) from [here](http://fsymbols.com/keyboard/linux/compose/). Had to enable `Compose Key` by going to System Settings --> Text Entry --> Keyboard Settings --> Compose Key. Choose right alt. 

Degree symbol: `Compose o o`


### Open science

Trying to update workflow on open lab notebook - using [knitcitations](https://github.com/cboettig/knitcitations) to enter references in my notes and generate bibliography. Ran into error 

    inline R code fragments
    
    Error in FUN(1L[[1L]], ...) : could not find function "is"

and filed [issue](https://github.com/cboettig/knitcitations/issues/52) that was quickly resolved by adding `library(methods)` which is apparently not loaded by `Rscript` but is interactively. 


### Reading

Gouveia, S.F., Hortal, J., Tejedo, M., Duarte, H., Cassemiro, F.A.S., Navas, C.A. & Diniz-Filho, J.A.F. (2014). Climatic niche at physiological and macroecological scales: the thermal tolerance–geographical range interface and niche dimensionality. Global Ecology and Biogeography, 23, 446–456

    - sent by Aaron Ellison
    - macrophysiology: "describe general properties of the interface between individual' endurance of environmental conditions and their geographical patterns of distribution of their species"
       - this description seems to ignore within-species differentiation
    - CTmax for 47 species of anurans
    - 'phylogenetic signal representation'
      - PSR curve at 45° line consistent with neutral evolution
      - PSR curve above line consistent with accelerated divergence
      - PSR curve below line implies "stronger phylogenetic signal"
    - CTMax and macroecological niche accelerated evolutionary rates
    - Tmax and Tvar slower evolutionary rates
    - 'upper physiological limits alone may fail to characterize the macroecological (i.e. geographical) climatic boundaries of species' distributions'
    - authors claim that realized variability is a better descriptor of CTmax than a *single* climatic parameter such as Tmax, but this masks that the differences in the P-values between these comparisons is not large: correlation between CTmax and Tmax (beta = -0.064, P = 0.095); correlation between CTmax and Tvar (beta = -0.079, P = 0.023). 
    - position in 'hyperdimensional niche space' a better predictor of range limits than CTmax



