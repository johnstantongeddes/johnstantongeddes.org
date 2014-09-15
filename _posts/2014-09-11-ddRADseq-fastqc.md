---
layout: posts
categories: 
  - ApPopGen
title: RADseq fastqc
tags: 
  - RADseq
  - Illumina
  - fastqc
---

Two libraries were sequenced on Illumina HiSeq 1500 in RapidRun mode at VCC.

**Lane 1 - RAD4**: repeat of *Pogonomyrmex* RAD-seq

[RAD4 fastqc]({{ site.url }}/assets/files/scahan_VGN_20140730_2014_RAD4_R1_fastqc/fastqc_report.html)

- no filter applied in bcl2fastq (` --with-failed-reads`) conversion due to low complexity in restriction site region
- overall read quality looks good

**Lane 2 - ddRAD**1: first 48 samples of *Aphaenogaster* double-digest RADseq protocol [1]

[ddRAD1 fastqc]({{ site.url }}/assets/files/scahan_VGN_20140730_2014_ddRad1_R1_fastqc/fastqc_report.html)

- normal filters in bcl2fastq
- read quality crappy
- 10th percentile sequence quality drops from 10.6 to 2 (minimum) at 40 bp while median doesn't change
- median quality drops from 23 to 4.5 at 85 bp



[1] Peterson, B.K., Weber, J.N., Kay, E.H., Fisher, H.S., and Hoekstra, H.E. (2012). Double Digest RADseq: An Inexpensive Method for De Novo SNP Discovery and Genotyping in Model and Non-Model Species. PLoS ONE 7, e37135.

