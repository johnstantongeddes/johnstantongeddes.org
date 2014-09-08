---
layout: posts
categories: 
  - ApGxL
  - MtGIRAFFE
  - ApTranscriptome
title: Friday August 1 week's notes
tags: 
  - DGE
  - dplyr
---

## 2014-07-29

### ApGxL

Completed DGE protocol: Post-SPIA Modification I and II, purification using AMPure beads. Did this in the molecular lab to prevent cDNA contamination of future DGE samples. 


### MtGiraffe

Meeting with JH.

VCF files - reporting positions with single nucleotide and missing data ("./.") as SNPs

- filter SNP file to true SNPs
- another interesting genes: RBOHC Medtr3g098350.1
  - next to two other similar genes
  - mis-expressed at seedling stage and in senescing nodule
  - lower expression, longer roots
  
 

## 2014-07-30

### ApTranscriptome

Incorporating comments from co-authors


### RStudio webinar

* Grammars and graphics of data science
* Hadley Wickham

* collect [tidy] -> analyse [compose] -> communicate
* focus on analysis
* tidy data
* analysis
  - transform
  - visualise
  - model
  - iterate!
* visualization does not scale - summarise with models
* however, models have assumptions so cannot reveal unexpected patterns
* tidy data: `tidyr`
  - tidy data easy to work with
  - store variables in consistent way, always as columns
  - 
* transform: `dplyr`
  - bottlenecks in data analysis
  - cognitive -> computational
  - thinking: describe data manipulation problem
  - 5 functions
    - filter: keep rows matching criteria
    - select: pick columns by name
    - arrange: reorder rows
    - mutate: add new variables
    - summarise: summarise variables
  - Demo: nycflights13
  - group data using `group_by`
  - pipelines
    - pipe operator: `%>%`
  - remote sources; connect to databases
    - will generate SQL code automatically!
    - avoid switching between SQL and R code because small but annoying differences
    - `browseVignettes(package = "dplyr")`
* ggVis for visualizing data in R (Winston Chang)
  - interactive data visualization
  - communicate: explain, deploy, display
  - allows for input sliders; binwidth, opacity
  - ggVis in Shiny for reactivity
    - tooltip that gives info on points!
    - `fill.brush` to select points, highlight in other charts


Code from presentation on [github](https://github.com/rstudio/webinars/tree/master/2014-01)


### ApGxL

Completed DGE protocol: Post-SPIA Modification I and II, purification using AMPure beads. Did this in the molecular lab to prevent cDNA contamination of future DGE samples. 

Qubit results:

Samples      ng/ul
---------  --------
01-B-HS       9.03
02-A-HS       9.22
02-C-HS      10.7
04-A-HS     >60 

**Update 2014-08-06**: re-ran *04-A-HS* at 10x dilution (0.2ul in 1.8ul H~2~O).

Samples      ng/ul     stock (ng/ul)
---------  --------   ---------------
04-A-HS      5.83          58



## 2014-07-31

### ApTranscriptome

Edits to manuscript

### ApGxL

Qubit RNA assay for sample extracted with RNAzol

Sample          ng/ul
---------     --------
04-A-CO         <20
O5-B-CO          37.6 
10-A-CO         <20
1O-B-CO          45.0
12-A-CO         <20
22-A-CO         <20 
22-B-CO           4.4
22-C-CO         <20

<br>

- RNA in only 3 of 8 samples...disappointing. 

Also checked RNA concentration of the DGE preps

Sample          ng/ul
---------     --------
02-C-HS          2.4
04-A-HS          9.9

<br>

- RNA contamination in cDNA from DGE samples...is this a problem?


## 2014-08-01

### ApGxL

Emailed Ashesh at Nugen to ask about DGE protocol.

> How much RNA was used as input into the system?  How was the RNA isolated?  What is the RNA quality (RIN, 260/280 and 260/230 ratio)?  How was the amplified cDNA purified and what was the elution volume?  The reason that I am asking is that we would expect ug quantities of cDNA.  Your concentration of > 9 ng/ul seems to be low.  Did you do bioanalyzer analysis on the amplified cDNA?  Can you send me the traces? 
>
> It is good to hear from you.  I have a few questions about the cDNA amplification.  How much RNA was used as input into the system?  How was the RNA isolated?  What is the RNA quality (RIN, 260/280 and 260/230 ratio)?  How was the amplified cDNA purified and what was the elution volume?  The reason that I am asking is that we would expect ug quantities of cDNA.  Your concentration of > 9 ng/ul seems to be low.  Did you do bioanalyzer analysis on the amplified cDNA?  Can you send me the traces?
> 
> To answer your questions; while this system uses poly(A) priming you may see some rRNA read.  This is because rRNA sequences can have poly(A) stretches that may be primed and amplified.  This is also organism dependent since we see higher rRNA when using C. elegans total RNA compared to human total RNA.  You will see these sequences in your library but it should be a small percent of the total number of reads.  Secondly, library construction requires the presence of double-stranded DNA so the presence of RNA should not interfere with the library construction.
> 
> Are you doing paired-end or single end reads?  For sequencing 100bp reads, I would recommending fragmenting the cDNA to 200 bp.  The cDNA should be purified after fragmentation.  When using the Rapid library system, I would recommend using 1ug of the fragmented cDNA as input into the system.  Additionally, I would like to remind you that a qPCR library quantification is required to accurately quantify the libraries produced with the Rapid system.
 

So...the SPIA amplification doesn't seem to be working to expectations...

---------------------------------------------------------------------

- ApTranscriptome paper

