---
layout: posts
category: ApTranscriptome
title: Friday 23 August
tags:
  - Aphaenogaster
  - RNAseq
  - transcriptome
  - simulation
  - BLAST
---

### ApTranscriptome

How do I validate that simulated transcriptome assembly worked? I have

a) known transcripts
b) assembled transcripts

I want to know how many of (a) and to what extent they are mapped. Plan

1) reciprocal BLAST
2) Select best 

As always, Titus Brown et al are my friends with [examples and scripts](http://ged.msu.edu/angus/tutorials-2011/reciprocal-blast.html?highlight=write%20script)

1) BLAST fasta files against each other
  a) make BLAST database for oases transcripts
    `makeblastdb -dbtype nucl -in sim-oases-25/transcripts.fa`
    `mv sim-oases-25/transcripts.fa.n* .`
  b) BLAST original transcripts against assembled transcripts
    `blastn -query ENA-arabidopsis-random-mRNA.fasta -db transcripts.fa -out xxx1.txt`

Success! Of the 12 sequences, I recovered 88-100% of their full length with 99-100% accuracy.

Of note, when I use only assembly at only a single K, I get one assembled transcript per original mRNA for 11 of the 12 sequences. However, when I use the merged assembly, I get 3-5 transcripts per original mRNA! So, while merging may help recover some transcripts, with my very simple simulation it seems to just add a lot of redundancy. While I had *no alternative transcripts* in my original mRNA samples and merging may allow me to *find* these, I'm not sure if it's worth the redundancy...or maybe it's okay if I use one of the programs to filter redundant sequences as noted [before]({% post_url 2013-07-25-velvet %})...e.g [CD-HIT](http://weizhong-lab.ucsd.edu/cd-hit/). Then again, I don't really *believe* that I can pick up multiple isoforms from whole organism pooled samples so maybe just best to ignore this complexity. 


Conclusion: run at multiple values of K, but select 'best' assembly from these instead of merging


Should turn this script into a 'program'. Probably best to do in python.

Rough draft...

~~~
#!/bin/python 
"""
Script to run simulated transcriptome assembly

Input:
  fasta file of transcripts to simulate sequencing and assembly for
  expression level to simulate (default gamma mean 100 shape 1)
  number of reads to simulate (default=number transcripts*10)
  


Assumes you have installed
  rlsim
  simNGS
  velvet
  bwa
  samtools 
  blast
  
"""

import subprocess
import optparse

##########################
## Options and defaults
##########################

def getOptions():
    parser = optparse.OptionParser('usage: %prog [options] --fasta "transcripts in fasta format"')
    parser.add_option('-em', '--expression-mean',dest='expmean',type="int",help='Mean for expression level, gamma distribution',default=100)
    parser.add_option('-es', '--expression-shape',dest='expshape',type="int",help='Shape parameter for expression level, gamma distribution',default=1)
    parser.add_option('-f', '--fragments',dest='frag',type="int",help='Number of fragments to simulate',default=1000000)
    options, args = parser.parse_args()
    if not options.mergeOnly and len(options.data) == 0:
            parser.print_help()
            print ''
            print 'You forgot to provide some data files!'
            print 'Current options are:'
            print options
            sys.exit(1)
    return options

#########################
## Simulate expression levels and Illumina reads
#########################
 
#########################
## QC and prep Illumnia files for assembly
#########################

#########################
## Assemble using velvet-oases
#########################

#########################
## Map reads using BWA
#########################

#########################
## BLAST to evaluate recovery of original transcripts by assembly
#########################

...
~~~



### Computing

Installed blast+ on server with `sudo apt-get install ncbi-blast+`


