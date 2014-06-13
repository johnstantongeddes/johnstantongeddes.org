---
layout: posts
categories: 
  - ApTranscriptome
title: Monday June 9 - Friday June 13 notes
tags: 
  - ddRADseq
  - presentation
---

## 2014-06-09

* Great [rOpenSci post](http://ropensci.org/blog/2014/06/09/reproducibility/) on the challenges of reproducibility
* [Can we do better than R-squared?](http://tomhopper.me/2014/05/16/can-we-do-better-than-r-squared/)
* Staring work on presention for Evolution

### ddRADseq

Qubit for DNA extracions before and after double-digest

Waiting on Bioanalyzer results to confirm digestion and then will anneal adapters

### ApTranscriptome

Modified "expression type" categories to include:

1. HighOn - expression activated at high temperatures
2. PositiveLinear - expression positive linear across thermal gradient
3. LowOn - expression activated at low temperatures
4. NegativeLinear - expression negative at low temperatures
5. Intermediate - maximum expression at intermediate temperatures
6. Bimodal - expressed greater then one standard deviation of expression at both low and high temperatures

Under this scheme, 57% of *High* transcripts are *PositiveLinear* while 72% of *Low* transcripts are *NegativeLinear*. This is consistent with the motivating observation that many of the *Low* transcripts appear to gradually decrease, compared to the *High* transcripts that were up-regulated at high temperatures.



## 2014-06-10


### ddRADseq

Bioanalyzer results

![Bioanalyzer results 6-10]({{ site.url }}/assets/files/UVMAGTC-JS-4220_Helms-6-10-2014_High_Sensitivity_DNA_Assay_DE20901668_2014-06-10_12-03-21.pdf)

<br>

Samples 1-5 (4e, 8e, 12e, 16e, 20e) are the raw DNA from the extraction. All look good and large. 

Samples 6-11 (1d, 4d, 8d, 12d, 16d, 20d) are the double digested DNA. Shape looks different then before when it was smooth. Something wrong with the digestion? Or must higher input DNA quantity so see more DNA? But why only at the small size distribution?

To test if the digestion worked leaving sticky ends, SHC performed annealing reaction. Expect to see shift if distribution of 76 bp if adapters anneal correctly. 


### ApTranscriptome

Parsing responsive transcripts into categories - mismatch between the "type" and plots. Tracked this bug down to the fact that I (correctly) assigned expression type from the simplified models after AIC but was plotting from the model including only temperature.

More generally - does it make sense biologically to partition the *High* genes into *PositiveLinear* and *HighOn*?  

Discussed this with NG. Two issues:

1. With 11 points, do we actually have confidence in the classification?
2. Unknown if the "low" and "high" temperatures are equally extreme. Could be that the low temps aren't as extreme, thus the linear response, but if I went to -5°C I would have seen a sharp response.

---------------------------------------------

Working on presentation for Evolution.

Using Beamer as I need PPT of PDF format and I couldn't figure out how to get reveal.js HTML presentation to PDF.
 

## 2014-06-11

* [Tidy data](http://vita.had.co.nz/papers/tidy-data.html) with the [tidyr package](https://github.com/hadley/tidyr)
* Package manager for bioinformatics [biobrew](http://bib.bitbucket.org/)
* Practice presentation for Evolution
    - lots of feedback. 

## 2014-06-12

* Working on presentation
* Installed Geneious on workstation. Helped Meg Valentine with phylogenetic analysis of PKD2 gene from Paramecium


## 2014-06-13

* [Example of packaging results as an R package](http://www.bioconductor.org/packages/release/data/experiment/html/Mulder2012.html)
  - is this really necessary? Packages (to me) seem to be about software and reusable code. While vitally important, reproducible results seem better packaged in a reproducible tech report on an archive such as Dryad or Dataverse.
* Centennial ms
* Working on ApTranscriptome analysis for Evolution presentation

### ddRADseq

![Bioanalyzer results 6-12]({{ site.url }}/assets/files/UVMAGTC-JS-4249_Helms-6-12-2014_High_Sensitivity_DNA_Assay_DE20901668_2014-06-12_15-03-55.pdf)

<br>

Digested DNA with annealed adapters. From Wednesday's results, expected to see shift up of 76 bp. Problem is that the high concentration of adapters (36 bp) swamp the DNA. Potential problem that there's a large peak at about 76 bp which would be an adapter dimer. 


