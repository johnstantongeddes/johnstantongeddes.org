---
layout: posts
categories: ApTranscriptome ApGXL
title: Monday notes
tags: 
  - pander
  - review
---

* Finished review for PLoS ONE
* MolEcologist Q&A with Pleuni Pennings scheduled
* Test to add R knitting functionality to lab notebook
   - allows evaluating R math and plots
   - use [knitcitations] for references instead of copy paste

http://stackoverflow.com/questions/4696128/bash-script-determine-if-file-modified

### ApThermBe

Ideas for laser-trip camera [here](http://yourduino.com/sunshop2/index.php?l=product_detail&p=47), [here](http://bildr.org/2012/11/photoresistor-arduino/) and [here](http://www.instructables.com/id/Arduino-Laser-System-Tripwire-Tutorial/)

Or maybe a [simple time-delay](http://timmsuess.com/projects/intervaluino/)

### ApGXL

Bioanalyzer results from last week's extractions. 


```
## 
## Attaching package: 'pander'
## 
## The following object is masked from 'package:knitr':
## 
##     pandoc
```



|  Sample  |  Colony  |  Num_ants  |  Extraction  |  Nano_conc  |  Nano_qual  |  Bio_conc  |  RIN  |
|:--------:|:--------:|:----------:|:------------:|:-----------:|:-----------:|:----------:|:-----:|
|  RQ3-1   | 2012 A1  |     3      |      R       |    31.6     |     1.6     |    0.1     |  2.7  |
|  RQ1-1   | 2012 A1  |     1      |      R       |    13.9     |     1.7     |    0.7     |  8.8  |
|  RQ3-2   |  EW200   |     3      |      R       |    26.6     |     1.8     |    1.9     |  7.5  |
|  RQ1-2   |  EW200   |     1      |      R       |    16.2     |     1.9     |    1.4     |  7.1  |
|  RQ3-3   |  EW1000  |     3      |      R       |    60.3     |     1.7     |    7.4     |  9.6  |
|  RQ1-3   |  EW1000  |     1      |      R       |    21.4     |     1.6     |    5.1     |  9.5  |
|  RQ3-1   | 2012 A1  |     3      |     R+Q      |    18.9     |     2.1     |    7.6     |  5.9  |
|  RQ1-1   | 2012 A1  |     1      |     R+Q      |     0.7     |             |            |       |
|  RQ3-2   |  EW200   |     3      |     R+Q      |     0.7     |     0.9     |            |       |
|  RQ1-2   |  EW200   |     1      |     R+Q      |     5.9     |     0.5     |            |       |
|  RQ3-3   |  EW1000  |     3      |     R+Q      |     5.5     |      3      |    5.7     |  9.7  |
|  RQ1-3   |  EW1000  |     1      |     R+Q      |     1.6     |     1.6     |            |       |
|   Q1-1   | 2012 A1  |     1      |      Q       |     3.8     |      2      |    1.7     |  7.7  |
|   Q1-2   |  EW200   |     1      |      Q       |     2.1     |     1.6     |            |       |
|   Q1-3   |  EW1000  |     1      |      Q       |     3.5     |     2.3     |            |       |

Table: Nanodrop and Bioanalyzer results for different RNA extraction methods. Concentration in ng/ul. Extraction: R = RNAzol; R+Q = RNAzol + RNeasy; Q = RNeasy. Note that all Qiagen samples were first accidentally eluted in 170 ul and then re-precipitated using column into 17 ul.


Notes:

* RNAzol only (R) extraction gives RIN adequate for DGE (> 7)
* RNAzol elution in 100 ul gives about 100 ng 
* Nanodrop overestimates concentration by an order of magnitude
* Nanodrop 260/280 not indicative of RIN (e.g RQ3-1 260/280 = 1.6 while RIN = 2.7)

Based on these extractions, use RNAzol extraction only (no RNeasy) for ApGXL samples. 
Elute in 25 ul to concentrate RNA for DGE.


--------------------------------------------------------------------------------------

New set of RNA extractions 

- 3 Phytotron samples
- 3 lab ants

All 6 through RNAzol. Take aliquots for Bioanalyzer. Reserve 100 ng from RNAzol step for Phytotron samples and run remainig sample through RNeasy. Send 9 samples to Bioanalyzer.

### ApTranscriptome

Updated code to output P-values, Q-values and coefficients for significant linear and quadratic terms for each transcripts
