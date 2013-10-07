---
layout: posts
categories: ApTranscriptome
title: Transcriptome assembly with digital normalization and read merging
tags:
  - Aphaenogaster
  - velvet
  - oases
  - khmer
  - digital normalization
  - FLASH
---

Completed velvet-oases assembly on digitally-normalized reads.

About 1hr 15min time for assembly...FAR faster than velvet on all reads with much lower memory usage.  

Summary with `python /opt/software/khmer/sandbox/assemstats2.py 100 transcripts.fa`

diginorm only: A22-diginorm-oases/A22-oases-21/transcripts.fa

assembly stat            result
---------------------  ------------
Total Contigs           126812
Total Trimmed Contigs   126781
Total Length            109476821
Min contig size         100
Median contig size      365
Mean contig size        863
Max contig size         14314
N50 Contig              16370
N50 Length              1933
N90 Contig              66842
N90 Length              333

diginorm then FLASH: A22-diginorm-flash-oases/A22-oases-21/transcripts.fa

assembly stat            result
---------------------  ------------
Total Contigs           111434
Total Trimmed Contigs   111413
Total Length            111343478
Min contig size         100
Median contig size      447
Mean contig size        999
Max contig size         20427
N50 Contig              15236
N50 Length              2163
N90 Contig              58158
N90 Length              410


Compare to [previous results]({% post_url 2013-08-22-transcriptome-simulation %}) running FLASH first, then diginorm; both with minimum contig length of 100 bp.

FLASH before diginorm: A22-oases/A22-oases-21/transcripts.fa

assembly stat            result
---------------------  ------------
Total Contigs            90612
Total Trimmed Contigs    90612
Total Length             86485229
Min contig size          119
Median contig size       586
Mean contig size         954
Max contig size          14006
N50 Contig               16436
N50 Length               1506
N90 Contig               60314
N90 Length               396

40% more contigs and 26% greater total length in assembly with diginorm alone. 

Still waiting for full assemly using velvet with 200GB RAM and 48hr walltime to complete for comparison, but at least in the number of contigs, the results are consistent with those from VGN with full Trinity assembly. 
