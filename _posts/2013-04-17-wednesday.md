---
layout: posts
categories: 
  - ecological genetics
title: Wednesday
tags:
  - jekyll
  - Aphaenogaster
  - S3
  - bowtie
  - samtools
---

## Lab notebook

Note: when linking to a post on another jekyll website, do not include the .html

This does not redirect correctly:

>  [introduction](http://carlboettiger.info/2012/12/30/learning-jekyll.html)

but this does:

> [introduction](http://carlboettiger.info/2012/12/30/learning-jekyll)

Go figure.


## Aphaenogaster

Still insurance issues with permits for VT, MA and NY. Decided to skip state agencies and contact land trusts (e.g. Trustees of the Reservation in MA) and other privately-owned land with research connections (college field stations).

Contacted Middlebury and immediately received informal permission to sample at their ... Forest and Research and Teaching Natural Area.

---------------------------------------------------

Sara asked about ordering kits for DGE. Quick calculation:

Contacted NuGENE to ask about updated bulk order pricing.


## Computing

[set up backup to Amazon S3 using Deja Dup](http://blog.domenech.org/2013/01/backing-up-ubuntu-using-deja-dup-backup-and-aws-s3.html)

## Bradyrhizobium

Pipeline for bowtie

- SAM to BAM using samtools view
  - use -q to filter reads with MAPQ (mapping quality) > 10, which are [probably unique](http://biowhat.ucsd.edu/homer/basicTutorial/samfiles.html)
- sort BAM
- [mpileup to consensus sequence](http://samtools.sourceforge.net/mpileup.shtml)
- [fastq to fasta](http://www.biostars.org/p/1388/) using seqtk

