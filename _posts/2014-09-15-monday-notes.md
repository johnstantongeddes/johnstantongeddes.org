---
layout: posts
categories: 
  - ApTranscriptome
title: Monday notes
tags: 
  - Sailfish
  - parallel
---

### ApTranscriptome

**Consistency of expression quantification**

Re-running analyses on EC2. Found (as before) that gene expression quantification with Sailfish (and probably other programs) is consistent but stochastic. These slight differences influence downstream results. For example, last week's run of Sailfish resulted in 10,539 significant transcripts compared to 9,809 from my earlier working results. Of these, 80% (7,247) overlap.

Decided that the appropriate thingy to do is to bootstrap (is this a true bootstrap?) the estimation and RxNseq procedure. Need to determine some threshold for *true* responsive transcripts from those that appear responsive due to stochasticity in expression quantification.

- stopping rule: continue bootstraps until the same 'core' set appears?
- bootstrap: keep transcripts that appear in 90% of repeats?

Convenient that I've gone through work to get EC2 running and using *fast* Sailfish as opposed to slower predecessors - can do this (relatively) quickly.

To implement, modified `sailfish_quant.R` code to run as Rscript with iterator passed from command-line. Started with a bash `for` loop but then remembered [GNU parallel](https://www.biostars.org/p/63816/). With some testing, got it to work! A few tricks.

- had to run as `sudo` to be able to write to mounted EBS volume on EC2
- parallel doesn't seem to load PATH from .bashrc or .profile so had to set environment within script that called parallel. hint from this [SO question](http://stackoverflow.com/questions/12100136/inheriting-environment-variables-with-gnu-parallel)

~~~
#!/bin/bash                                                                                           

export PATH=/home/ubuntu/software/Sailfish-0.6.3-Linux_x86-64/bin:$PATH
export LD_LIBRARY_PATH=/home/ubuntu/software/Sailfish-0.6.3-Linux_x86-64/lib:$LD_LIBRARY_PATH

# script to bootstrap gene expression quantification using sailfish                                   
parallel Rscript sailfish_quant.R {1} ::: {1..20}
~~~

Tried to get `knitr::stich` to work so output would be dumped to file using comment from [Yihui here](http://stackoverflow.com/questions/14167178/passing-command-line-arguments-to-r-cmd-batch) but couldn't get it to work...probably a problem with quote escaping or such.


**Minimum count**

A number of times I've seen comments that transcripts with FPKM < 1 > are often removed from analysis. I tracked this rule-of-thumb to this quote (Mortazavi 2008)[^1])

>  At current practical sequencing capacity and cost (approx40 M mapped reads), transcript detection was robust at 1.0 RPKM and above for a typical 2-kilobase (kb) mRNA (approx80 individual sequence reads resulting in a P value <10-16). 

More recently, a quantitative estimate of RNAseq determined that transcripts at less than 1,000 copies in original sample are lost during RNAseq library prep (assuming a starting input of about 1e9 mRNA molecules, 0.1% efficiency of library prep, 20x coverage) (Fu et al. 2014)[^2].

I had about 150 million reads from transcriptome libraries, with 12 pooled samples, there are about 11e6 reads per sample. Thus 1 TPM translates into ~ 12 starting copies of a transcript. To get to 1,000 copies of a transcript, minimum TPM should be `1000/11.6 = 86`! This seems quite stringent...

Quick check with ApTranscriptome data:

> mean.TPM <- ddply(TPM.dt.sub, .(Transcript), summarize, mTPM = mean(TPM))
> 
> length(mean.TPM$mTPM)
[1] 98186
> length(which(mean.TPM$mTPM > 1))
[1] 10125
> length(which(mean.TPM$mTPM > 86))
[1] 386
    
Wow - only about 4% of transcripts reach this level!

Discussed with SCH - though these may be true patterns, the RxNseq approach gives *replication* (in a sense) that we would expect only those with a true signal to show up as responsive, while those that are truly noise would just bounce around. The 'bootstrap' described above to address the consistency of gene expression quantification will partially address this. 

[^1] Mortazavi, A., Williams, B.A., McCue, K., Schaeffer, L., and Wold, B. (2008). Mapping and quantifying mammalian transcriptomes by RNA-Seq. Nat Meth 5, 621–628.

[2] Fu, G.K., Xu, W., Wilhelmy, J., Mindrinos, M.N., Davis, R.W., Xiao, W., and Fodor, S.P.A. (2014). Molecular indexing enables quantitative targeted RNA sequencing and reveals poor efficiencies in standard library preparations. PNAS 111, 1891–1896.


### Computing

The awesomeness of git - found that my `RxNseq` function was the wrong version. Used github History to find version of script that had the code I wanted, then checked out just that file

    git checkout 6fd77dd scripts/RxNseq.R

Saved and moved ahead!

### R

How does Hadley Wickham keep doing it...[R package for web scraping](https://github.com/hadley/rvest)!

