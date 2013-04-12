---
layout: posts
category: ecological genetics
title: Velvet needs shuffled files!
tags: 
  - genome assembly
  - Bradyrhizobium
  - velvet
---

## Bradyrhizobium

velvet assembly. need to select paired sequences and then shuffle into single file before beginning assembly.

~~1) select_paired.pl~~

Function provided by velvet doesn't work because for FASTQ

Suggestions from [seqanswers](http://seqanswers.com/forums/showthread.php?t=24076) or scripts available using the [Simple Fool's Guide to RNAseq](http://sfg.stanford.edu/guide.html)

2) shuffleSequences_fastq.pl

velvet function to shuffle paired reads into single file

Script "03-shuffle.pbs" used fastqcombinepaireend.py script recommended on seqanswers (from Simple Fools' Guide to RNAseq) to selecting paired reads, and then used velvet shuffleSequences_fastq.pl to shuffle forward and reverse reads into a single file. Only problem is that the naming for the "singletons" didn't work so that instead of saving a file "${sample}_trimmed_clipped_singles.fastq" for each file, each run overwrote the previous file to "_trimmed_clipped_singles.fastq". Probably could figure out how to fix this, but don't plan on using these files so will skip for now.

Next...run VelvetOptimiser!

Memory usage error. Even with 36GB, only got through kmers 21-25. 
Try memory estimation flag (-g 9) to get estimate of memory required...
