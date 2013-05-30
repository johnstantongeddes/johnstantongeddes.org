---
layout: posts
category: ecological genetics
title: week notes
tags:
  - field work
  - seqtk
  - Aphaenogaster
  - Pogonomyrmex
  - transcriptomics

---


2013-05-23
=============

Seems that the world of (open-source) webapps is never-ending. Just discovered [dillinger](dillinger.io). Browser-based app that allows side-by-side editing of markdown file and rendered output. While using it now, don't see it as a long-term solution because CONSIDERABLY slows typing (what's the point of a flat text file if not fast?) and once you've learned the basic markdown syntax, you don't need to see the output simulatenously. 

Also found some information on [slidify](http://slidify.org/) which may be even better than slides (for me) because it's based on R code. Though...I'm not sure I want to be creating plots while making a presentation. Seems better to have an .Rmd tech report, then load the images into presentation using slide, slideous, etc.

Comments from NG on P-value commentary.

Finished Functional Ecology review.

Phone call with PT to discuss 'Estimating heritability using genomic data' manuscript


## Aphaenogaster

Working on transcriptome pipeline with Pogo data

based on fastq files, single reads in Illumina 1.3 format so need to convert

install biopython on antlab 

first had to install numpy and scipy using [pip](https://pypi.python.org/pypi/pip)

back to some basics for running a job on a server

use `nohup` to run job without hangups, end line with `&` to run in background

    nohup nice -n 19 bash 01-fastq-sanger.sh

shell script that drives python script


2013-05-24
===============

Installed seqtk on antlab as on 2013-05-14.

Damn file format issues.fastx-toolkit assumes Illumina 1.3+ FASTQ (ASCI offset of 64) but thankfully on [seqanswers](http://seqanswers.com/forums/showthread.php?t=6701) it is explained that there is an undocumented argument -Q that determines the input quality ASCII. This can be changed to `-Q 33` to get standard sanger FASTQ. 

Some information about trimming [Illumina adaptor sequences](http://onetipperday.blogspot.com/2012/08/three-ways-to-trim-adaptorprimer.html)

Overwhelming list of bioinformatics papers to read on [same website](http://onetipperday.blogspot.com/2013/05/basic-knowledge-for-bioinformatian.html)

## P-value commentary

Wow - email blowing up with responses from ecolog to participate in stats survey, and re-post of Early Career Ecologists blog post by Jeremy Fox at Dynamic Ecology!



2013-05-28
============

Ant collecting at Molly Bog with AN, MH, Keri Pinder

Found 12 colonies in about 4 hours of searching (including bush-whacking through ticket). Only 3 with queens. Easier to find queens from colonies in logs than in leaf debris so target these.


2013-05-29
============

Meeting with [Josh Brown](http://www.uvm.edu/~jbrown7/)

-------------------------------------------------------

Meeting with VGN: Jim Vincent, Heather Driscoll, Mahesh 


choice of de novo assembler

- Trinity: very slow
- Velvet-Oases: high memory. good coverage, but many mistakes/chimeras due to lenient mapping
- EarB(??) de novo: new program, compares well, FAST

controls

- would have been nice to have in library RNA spike in to see if can recreate known RNA transcripts at end of whole process. unclear to me that these would have added much information beyond a validation of the library prep and biases introduced by this process, which should be known from other publications (Jiang 2011)
- go ahead with in silico RNA spike in before bioinformatics pipeline

pool all files to generate transcriptomes

1) map reads to contigs for gene expression counts
2) annotation of contigs usig BLAST2GO

gene expression

- DeSeq2 may allow for multiple samples
- regression/randomization approach


population genetic analyses

- need codon positions for 
  - [GeneMark-E](http://exon.gatech.edu/)
- BlastX does not need to know frame positions, looks for short open reading frames and does not worry about errors
- GeneMark trys to overcome by finding open reading frames and correcting for errors

DGE

- 100-500bp tags upstream from polyA tail
- map to transcriptome 
- ASSUMES well-annotated transcriptome, but this may not be true at 3' end
- transcriptome may be poor quality...next up would be genome sequencing

References:

Jiang, L., F. Schlesinger, C. A. Davis, Y. Zhang, R. Li, M. Salit, T. R. Gingeras, and B. Oliver. 2011. Synthetic spike-in standards for RNA-seq experiments. Genome Research 21:1543–1551.

----------------------------------------------

## Computing

[Redmine](http://www.redmine.org/) for project management. Possible to integrate with [github](https://github.com/koppen/redmine_github_hook)


2013-05-30
===============

NuGEN Encore Rapid Kits arrived.

Transferring transcriptome data to VGN.

While disappointed not to find complete data for a recent paper published in Nature (actually not required for field data), I was excited to see their new [reporting requirements](http://www.nature.com/authors/policies/availability.html) which [state](http://www.nature.com/authors/policies/reporting.pdf) that 'Sample size', 'Randomizaton' and 'Replication' need to be explicitly reported, as well as clear guidelines for statistics!




