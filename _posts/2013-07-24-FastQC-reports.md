---
layout: posts
category: ApTranscriptome
title: RNAseq QC
tags:
  - Aphaenogaster
  - RNAseq
  - cutadapt
  - FastQC
---

Quality control for RNAseq samples for Aphaenogaster picea/rudis transcriptome. Samples are from colony A22 (*A. picea* collected at Molly Bog, VT in Fall 2013 by AN and NG) exposed to 12 different temperatures (0, 3.5, 7, 10.5, 14, 17.5, 21, 24.5, 28, 31.5, 35, 38.5) for 1 hour, prior to flash-freezing and RNA extraction. Illumina HiSeq 100 bp paired-end sequencing was performed on each sample at the University of Minnesota Genomics Center. Notes on sequencing:

1) Project was sequenced on a 100bp PE run.
2) 24 barcoded libraries prepared with TruSeq RNA V2 library prep. kit.  Created 2 pools of 12 libraries and sequenced each pool in a separate lane.
3) Delivered greater than 160M reads per lane. 
4) Average quality scores are well above Q30 for both R1 and R2.
5) The libraries were pooled and size selected to generate inserts of approximately 200bp.

The fastq data conforms to the latest Illumina CASAVA 1.8 standard. 

Illumina HiSeq 1.8 fastq data were processed using [trim_galore](http://www.bioinformatics.babraham.ac.uk/projects/trim_galore/) with standard settings for paired-end data. Script used for trimming, `01-A22-TrimClip.sh` is available on [github](https://github.com/johnstantongeddes/climate-cascade/tree/master/projects/AphTranscriptome/scripts).

FastQC results for each file:

[A22-00-R1-fastqc]({{ site.url }}/assets/files/A22-00-R1-fastqc/fastqc_report.html)

[A22-00-R2-fastqc]({{ site.url }}/assets/files/A22-00-R2-fastqc/fastqc_report.html)

[A22-03-R1-fastqc]({{ site.url }}/assets/files/A22-03-R1-fastqc/fastqc_report.html)

[A22-03-R2-fastqc]({{ site.url }}/assets/files/A22-03-R2-fastqc/fastqc_report.html)

[A22-07-R1-fastqc]({{ site.url }}/assets/files/A22-07-R1-fastqc/fastqc_report.html)

[A22-07-R2-fastqc]({{ site.url }}/assets/files/A22-07-R2-fastqc/fastqc_report.html)

[A22-10-R1-fastqc]({{ site.url }}/assets/files/A22-10-R1-fastqc/fastqc_report.html)

[A22-10-R2-fastqc]({{ site.url }}/assets/files/A22-10-R2-fastqc/fastqc_report.html)

[A22-14-R1-fastqc]({{ site.url }}/assets/files/A22-24-R1-fastqc/fastqc_report.html)

[A22-14-R2-fastqc]({{ site.url }}/assets/files/A22-24-R2-fastqc/fastqc_report.html)

[A22-17-R1-fastqc]({{ site.url }}/assets/files/A22-17-R1-fastqc/fastqc_report.html)

[A22-17-R2-fastqc]({{ site.url }}/assets/files/A22-17-R2-fastqc/fastqc_report.html)

[A22-21-R1-fastqc]({{ site.url }}/assets/files/A22-21-R1-fastqc/fastqc_report.html)

[A22-21-R2-fastqc]({{ site.url }}/assets/files/A22-21-R2-fastqc/fastqc_report.html)

[A22-24-R1-fastqc]({{ site.url }}/assets/files/A22-24-R1-fastqc/fastqc_report.html)

[A22-24-R2-fastqc]({{ site.url }}/assets/files/A22-24-R2-fastqc/fastqc_report.html)

[A22-28-R1-fastqc]({{ site.url }}/assets/files/A22-28-R1-fastqc/fastqc_report.html)

[A22-28-R2-fastqc]({{ site.url }}/assets/files/A22-28-R2-fastqc/fastqc_report.html)

[A22-31-R1-fastqc]({{ site.url }}/assets/files/A22-31-R1-fastqc/fastqc_report.html)

[A22-31-R2-fastqc]({{ site.url }}/assets/files/A22-31-R2-fastqc/fastqc_report.html)

[A22-35-R1-fastqc]({{ site.url }}/assets/files/A22-35-R1-fastqc/fastqc_report.html)

[A22-35-R2-fastqc]({{ site.url }}/assets/files/A22-35-R2-fastqc/fastqc_report.html)

[A22-38-R1-fastqc]({{ site.url }}/assets/files/A22-38-R1-fastqc/fastqc_report.html)

[A22-38-R2-fastqc]({{ site.url }}/assets/files/A22-38-R2-fastqc/fastqc_report.html)


Notes:

a) Per base sequence quality - forward (R1) reads have a low quality read in the middle of the sequence at about 30-34 bp, where there is an increase in the number of 'N's. Do not see this on R2
a) Per base sequence content - noisy first 8-9 bp before becoming level
b) Per base GC content - 45-65% for first 8-9 bp before leveling off at about 40% for remainder of sequence
c) Per sequence GC content - bimodal distribution. Hmmm. Could this be due to sequencing microbes in sample as well as the ants? If so...nearly as many non-ant reads as ant reads.
d) Sequence duplication levels - lots of overrepresented and duplicated sequences. should probably remove these. 
e) Kmer content - messy, but no clear pattern

