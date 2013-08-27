---
layout: posts
category: ApTranscriptome
title: Thursday 22 August
tags:
  - Aphaenogaster
  - RNAseq
  - transcriptome
  - simulation
  - fastq
  - git
---

### ApTranscriptome

#### Simulation

Simulation running through oases! For 12 input Arabidopsis mRNA. Stats for merged assembly (K=25) after individual assemblies from 19 to 25, after digital normalization to 20: 

~~~
Total Contigs 33
Total Trimmed Contigs 33
Total Length 28105
Min contig size 408
Median contig size 644
Mean contig size 851
Max contig size 2302
N50 Contig 11
N50 Length 918
N90 Contig 28
N90 Length 580
~~~

Note that longest transcript in test file is 2,313bp so max contig from assembly looks quite close!

Now following guide to [Counting reads for RNA-seq](http://ged.msu.edu/angus/tutorials-2013/rnaseq_bwa_counting.html?highlight=bwa) with more info on [bwa here](http://ged.msu.edu/angus/tutorials-2011/bwa_tutorial.html)

Success! First column is transcript, second and third columns are the stard and end of each transcript that reads could map to (all start at 0 and span entire length of transcript). The fourth column is the read counts in the bam file. Reads map to each sample!

~~~
ENA|AAA16571|AAA16571.1	0	558	10622
ENA|AAA20048|AAA20048.1	0	783	10876
ENA|AAA21761|AAA21761.1	0	933	4454
ENA|AAA32754|AAA32754.1	0	2313	87408
ENA|AAA32773|AAA32773.1	0	594	2122
ENA|AAA32782|AAA32782.1	0	1152	5452
ENA|AAA32797|AAA32797.1	0	1116	18198
ENA|AAA32815|AAA32815.1	0	855	21690
ENA|AAA32838|AAA32838.1	0	969	10662
ENA|AAA32852|AAA32852.1	0	613	10306
ENA|AAA32864|AAA32864.1	0	918	1938
ENA|AAA32895|AAA32895.1	0	447	8768
~~~


Compare to the simulated read counts from `rlsim`, where the value after the $ is the simulated expression level:

~~~
>ENA|AAA16571|AAA16571.1$1076
>ENA|AAA20048|AAA20048.1$3695
>ENA|AAA21761|AAA21761.1$6284
>ENA|AAA32754|AAA32754.1$1640
>ENA|AAA32773|AAA32773.1$2043
>ENA|AAA32782|AAA32782.1$758
>ENA|AAA32797|AAA32797.1$1457
>ENA|AAA32815|AAA32815.1$634
>ENA|AAA32838|AAA32838.1$2777
>ENA|AAA32852|AAA32852.1$1221
>ENA|AAA32864|AAA32864.1$595
>ENA|AAA32895|AAA32895.1$1583
~~~

Hmmm...**NO** correlation between known and estimated gene expression levels (r = -0.12).

<div class="row text-center">
	<img src="{{ site.url }}/assets/img/sim-GE-plot.png" alt="plot" width="300" height="300">
</div>![plot]


#### A22

Debugged and ran complete velvet-oases for A22 assembly after digital normalization and combining contigs with FLASH, only required ~30 minutes and 15GB RAM.

Stat using khmer [assemstats3.py script](http://ged.msu.edu/angus/tutorials-2011/short-read-assembly-velvet.html)

** cutoff: 0

N	      sum	     max	 filename
------  ---------   ------  -----------------
90612	86485229	14006	  transcripts.fa

** cutoff: 300
N	      sum	     max	 filename
------  ---------   ------  -----------------
72334	81983476	14006	transcripts.fa

Given my expectations for transcriptome size of 17,000 genes with typical length of 1000 bp = 1.7 &times; 10<sup>7</sup> I'm getting on the same order of magnitude, but 4.8226-fold more, which is to be expected given alternative splicing!

And using the /khmer/sandbox/assemstats2.py script, 

~~~
Total Contigs 			90612
Total Trimmed Contigs 	72334
Total Length 			81983476
Min contig size 		300
Median contig size 		765
Mean contig size 		1133
Max contig size 		14006
N50 Contig 				14983
N50 Length 				1598
N90 Contig 				51215
N90 Length 				500
~~~

*To be continued...*


### Reading

Moyers, B.T. & Rieseberg, L.H. (2013). Divergence in Gene Expression Is Uncoupled from Divergence in Coding Sequence in a Secondarily Woody Sunflower. International Journal of Plant Sciences, 174, 1079–1089.



### Computing

Great tip to use [`trash-put`](https://github.com/andreafrancia/trash-cli) in the `trash-cli` program for Recycle Bin functionality when deleting files commandline. Do not use an alias for `rm` as many scripts use this to clean up temporary files that I really do not want saved.

