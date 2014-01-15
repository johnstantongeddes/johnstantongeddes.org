---
layout: posts
categories: ApGXL ApTranscriptome
title: Wednesday notes
tags:
  - knitcitations
  - pander
  - pandoc
---

Comments on Grace's undergrad research proposal.

Catching up on literature.

### ApGXL

Bioanalyzer results are NIL for all samples. Probably shouldn't have diluted. If Nanodrop overestimates, the samples were already in the Pico range before diluting.

Update [table]({% post_url 2014-01-14-RNAzol-only-extraction %})

### ApTranscriptome

Started new tech report "ApTranscriptome_TR.Rmd" that details *Aphaenogaster* transcriptome assembly and analysis of thermally-responsive genes. 
This tech report details the commands to generate the transcriptome, but does not aim to be completely reproducible as my previous script ("ApTran_assemble.R") because it was just too damn difficult. Instead, I include downloading the transcriptome assembly, annotaiton and expression value matrices. Only the identification of responsive genes is fully reproducible. 


### R

Installed [knitcitations](https://github.com/cboettig/knitcitations) on workstation. 
Required first installing `devtools` which required `RCurl` which itself required a system install of curl `sudo apt-get install libcurl4-gnutls-dev` following this [guide](http://www.omegahat.org/RCurl/FAQ.html). Also had to install XML with `sudo apt-get install libxml2-dev` so I could install the CRAN version of 'knitcitations'. Yikes!

To download files from web within R to local directory, use `downloadFile()` from the [R.utils](http://cran.r-project.org/web/packages/R.utils/index.html) package.

    downloadFile("http://www.johnstantongeddes.org/assets/files/UVMAGTC-AN-2973_Cahan-1-13-2014_Eukaryote_Total_RNA_Pico_DE20901668_2014-01-13_14-49-30.pdf")

Also used `pander` library to create pandoc style tables. **MUCH** easier than trying to do these myself. Need to automate markdown --> knitr --> pandoc --> jekyll so I can start using this to create table. For example:

~~~
```{r assemstats, results = "asis", echo=FALSE}
library(pander)
# make table
trinity <- c("126,172", "100,389,539", "358", "795", "16,201", "1,631")
reduced <- c("105,536", "62,648,997", "320", "593", "15,491", "895")

assemstats <- rbind(trinity, reduced)
colnames(assemstats) <- c("Total contigs", "Total length", "Median contig size", "Mean contig size", "N50 contig", "N50 Length")

pandoc.table(assemstats, style="rmarkdown", caption = "Table 1: Statistics for Trinity and cap3+uclust reduced transcriptome assemblies")
```
~~~

Generates this nice table after `knitr`:

~~~
|    &nbsp;     |  Total contigs  |  Total length  |  Median contig size  |
|:-------------:|:---------------:|:--------------:|:--------------------:|
|  **trinity**  |     126,172     |  100,389,539   |         358          |
|  **reduced**  |     105,536     |   62,648,997   |         320          |

Table: Table 1: Statistics for Trinity and cap3+uclust reduced transcriptome assemblies (continued below)

 

|    &nbsp;     |  Mean contig size  |  N50 contig  |  N50 Length  |
|:-------------:|:------------------:|:------------:|:------------:|
|  **trinity**  |        795         |    16,201    |    1,631     |
|  **reduced**  |        593         |    15,491    |     895      |
~~~

which generates nicely in html through pandoc.


