---
layout: posts
categories: ApTranscriptome
title: More transcriptome simulation notes
tags:
  - transcriptome
  - cufflinks
  - TPM
  - BWA
  - expression
---

Awesome - found function `read.fasta` in [RFLPtools](http://cran.r-project.org/web/packages/RFLPtools/RFLPtools.pdf) package that reads BLAST results!
Just had to change the blast command to include `-outfmt 6` which specifies results in tabular format, `-outfmt 10`  for comma-separated format.

    blastn -query testquery -df testdatabase -outfmt 6 -out out.txt

Then read into R using

    library(RFLPtools)
    test.res <- read.blast(file="out.txt")

Wrote scripts `sim-assemly-eval.R` that takes original fasta sequence and blast results, reporting the number of genes captured in assembly and compares average length of captured versus missing genes. Result:  

Genes 	   Count 	 Average length (base pairs) 
-------   --------  -----------------------------
Starting 	 100 	 1094.11 
Captured 	 86 	 1195.5 
Missing 	 14 	 471.2857 

For my simulation, 86 of the known genes were captured in assembly, with the missing genes being those that were less than 500 bp in length.

Oases actually didn't do quite this good, reporting 76 Loci and a total of 203 transcripts ranging from 1 to 10 per locus, so it associated some transcipts that should have been seperate genes. For gene expression analyses, this shouldn't be a problem as expression will be done on a per-transcript basis.

**Should also compare length of assembled versus known gene.**

Here's where things get confusing. When I use the TopHat-Cufflinks pipeline for gene discovery and gene expression analysis, I only get 29 genes and/or transcripts! 

Re-reading the Cufflinks paper

> Users performing expression analysis with a *de novo* transcriptome assembly may wish to consider RSEM or IoSEM.

So, cufflinks may not be the right method here!

Reverting to BWA approach - this time calcuate Transcript per million (Wagner et al. 2012) from raw count data.

Next, try Sailfish for alignment-free expression counts...
