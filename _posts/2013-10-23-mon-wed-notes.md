---
layout: posts
categories: ApTranscriptome
title: Monday - Wednesday notes
tags:
  - gene expression
  - CD-HIT
  - CAP3
  - sailfish
---

## 2013-10-21

### ApTranscriptome

Back to real data from simulation. Include 100 Arabidopsis mRNA transcripts in transcriptome assembly pipeline and use these at end to evaluate quality of assembly.
Simulate expression levels using `rlsim`. Preliminary assembly of transcriptome resulted in 90,612 contigs with total length of 86,485,229 bp. Started with ~140e6 2x100 reads.

So the approximate coverage of real transcripts is (140e6 reads * 200 bp) / (8e7 total length) = `r (140e6 * 200) / (8e7)`. 

Thus, for 100 known transcripts of about 1000bp length, generate 100 mRNA * 1000bp * 350 coverage / 200 bp per fragment = `r (100 * 1000 * 350)/200`

Maybe an alternative to CD-HIT is to [build transcript families](https://khmer-protocols.readthedocs.org/en/v0.8.1/mrnaseq/5-building-transcript-families.html).


### sim-transcriptome

Sailfish working on simulated data. 

Correlation between TPM from sailfish and known expression levels = 0.976.

So, as promised, equivalent to cufflinks and much faster and easier to use!


### Centennial paper

Set up [github repository](https://github.com/GotelliLab/eco-centennial-paper) in GotelliLab organization

### Zotero

PeerJ csl [style for zotero](http://edwards.sdsu.edu/labsite/index.php/lab-blog/430-peerj-csl-for-zotero)


### UserR meeting

Brent Sitterly @ Dealer demoed [shiny]() for R web apps. 
Looks pretty awesome. Already imagining an online supplement to paper that allows users to select pathways of interest to highlight.


## 2013-10-22

### R

[High performance computing](http://cran.r-project.org/web/views/HighPerformanceComputing.html) in R to get around limits of having to load all data in memory.

### ApTranscriptome

Re-ran data pre-processing for velvet-oases assembly. Workstation shut-down (WTF??) so had to restart diginorm which is the slowest part of pipeline (~6 hrs).

Started velvet-oases assembly and wrote script for Trinity in comparison.

### Computing

[Nice git tutorial](http://kbroman.github.io/github_tutorial/)

Course idea: [Reproducible research](http://kbroman.github.io/Tools4RR/)!



## 2013-10-23

### ApTranscriptome

Completed velvet-oases assembly. In log file

    Extracting loci from connection graph...
    [282.496250] Counted 55229 mRNA loci
    Transitive reduction of graph
    
and assemstats:

Assembly stat              Result
---------------           ----------
Total Trimmed Contigs       104,783
Total Length                99,167,303
Min contig size             100
Median contig size          442
Mean contig size            946
Max contig size             18,563
N50 Contig                  14,654
N50 Length                  1,986
N90 Contig                  56,313
N90 Length                  386

After clustering contigs using CAP3 (see below)

Assembly stat              Result
---------------           ----------
Total Contigs               11,926
Total Trimmed Contigs       11,926
Total Length                17,556,252
Min contig size             101
Median contig size          979
Mean contig size            1,472
Max contig size             18,839
N50 Contig                  2,212
N50 Length                  2,471
N90 Contig                  7,147
N90 Length                  709

~~**Wow.** A ten-fold reduction down to 11,926 transcripts from 104,782 after oases assembly. Given my expectations for the genome of 17,000 genes with a median length of 1,000 bp = 170,000 the total length is **awesomely close** so I'm thinking this is the **final assembly**.~~

~~Of course, this assembly is probably too simplistic in that I've removed all isoforms. Probably should examine gene expression for both.~~

Turns out this is [wrong]() - I was only looking at the 'contigs' output. There are about 62,018 singlets that were not merged to contigs, for a total of 73,944 transcripts. 


#### Read mapping

Started script for mapping reads using sailfish..


### Details on clustering contigs

So 55,229 loci with about 2 isoforms each (104,783 contigs)

1) BLAST against known simulated transcripts to evaluate assembly

2) Cluster loci using CAP3 or CD-HIT.

Similar question on [seqanswers](http://seqanswers.com/forums/archive/index.php/t-28567.html) about how to deal with redundant contigs and using CAP3 or CD-HIT is also recommended.

Some nice explanations of [how CD-HIT works](http://blog.nextgenetics.net/?e=26) and [comparison of results using CAP3 and CD-HIT](http://blog.nextgenetics.net/?e=24)

Basically, CD-HIT 

1) sorts sequences by length in decreasing order
2) starting with longest sequence, clusters sequences based on sequence similarity
3) after first cluster completed, starts with next ungrouped sequence as representative of next cluster
4) repeat 

Problems are assumption that longest sequence is best representative and short word (kmer) filter.

CAP3 - looks for both overlapping sequences as well as shorter sequences that are completely within the longer sequences

[TGICL](http://compbio.dfci.harvard.edu/tgi/software/) is a wrapper to megablast and CAP3 which may be another option, but is poorly documented and doesn't install correctly so I will skip.

[CONSED](http://www.phrap.org/consed/consed.html) for viewing assemblies

### Reading

Hornett, E.A. & Wheat, C.W. (2012). Quantitative RNA-Seq analysis in non-model species: assessing transcriptome assemblies as a scaffold and the utility of evolutionary divergent genomic reference species. BMC Genomics, 13, 361.

  - examine RNAseq with Illumina and 454 data. best transcriptome is the hybrid assembly using both methods, but Illumina alone does nearly as well.
  - compared to known human gene set, recaptured 76% of known transcripts even though only from brain tissue so do not expect to reach 100%
  - 80-90% of transcript length capture in transcriptome assembly
  - mapping reads to known transcripts and assembled transcripts had correlation of 0.94
  - slight inflation of mapping reads to assembled transcripts using RPKM as normalized by transcript length
  - explored approach of mapping reads to assembled transcripts, then BLAST these to reference gene set in nearest Genomic Reference Species
  - correlation > 0.9 for closely related species (macague to human) suggesting this approach works 
  - NOTE: used CLC Genomics Workbench so relevance to velvet/trinity is unclear
  
