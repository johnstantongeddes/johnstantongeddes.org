---
layout: posts
categories: ApTranscriptome
title: Week Notes 16-20 September
tags:
  - Aphaenogaster
  - mason
  - genome assembly
---

## 2013-09-16

Writing...

Gotelli Lab Meeting

First official Burlington UseR Meetup!

### ApTranscriptome

Last week's script failed because mason user quota limited to 10GB. Changed directory to save intermediate files to data capacitor `/N/dc/scratch/tg-johnsg/results` and ran fine.


Suggestion from khmer list to use RSEM for comparative expression analysis. Tutorial [here](https://khmer-protocols.readthedocs.org/en/latest/mrnaseq/6-comparative-expression-with-rsem.html). Note that it's [bundled with Trinity](http://trinityrnaseq.sourceforge.net/analysis/abundance_estimation.html)!


## 2013-09-17

Ant hunting. Cold morning (39F overnight) and four of us found no colonies in nearly two hours of searching East Woods. Andrew and I went back out to Centennial Woods in afternoon and still only found one small colony. Not surprisingly, the cold weather seems to have pushed the ants underground. May try next week if weather warms back up...but may just be too late in the year to collect colonies.

### Antlab

Installed [sabre](https://github.com/najoshi/sabre) to demultiplex reads. `sudo make` failed with multiple errors `demulti_paired.c:(.text+0x78): undefined reference to `gzread'` and I found the solution on [stackoverflow](http://stackoverflow.com/questions/9700414/compilation-problems-with-zlib/18875275#18875275)


Change this line:
    
    $(CC) $(CFLAGS) $(LDFLAGS) $(OPT) $? -o $(PROGRAM_NAME)
    to
    
    $(CC) $(CFLAGS)  $(OPT) $? -o $(PROGRAM_NAME) $(LDFLAGS)
    the -lz option has to be at the end.


and installed successfully! 

## 2013-09-18

### Conference call with Bruce Kingham at Delaware Biotechnology Institute 

Who: JSG, SHC, Bruce Kingham, Erin Bernberg, Olga Shevchenko

About: Genome assembly for Aphaenogaster

de novo genome assembly should *definitely* include Pac Bio

Pac Bio
  - single molecule sequencer
  - large 20-30kb library
  - avg. read lengths 5-6kpb
  - 60-80k reads per smart cell
  - use for scaffold
  - error rate is error rate of polymerase, can be high
  - lower error for smaller pieces, error 
  - very good combined w
  
Hybrid assembly - PacBio and Illumina - requires knowledge of programs

Illumina - avoid mate-pair libraries can be problematic. Library prep lends itself to generating inverted or incorrectly-paired reads

What we need to provide for sequencing:

  * Pac Bio requirements are more stringent than Illumina
    * High-molecular weight DNA: 10 ug or more 
    * AVOID column-based kit so cannot use DNAeasy. Use slurry or bead-based kit
      - Qiagen Genomic-tip
      - 5-prime
    * Males - one diploid genome to assemble
    * Females - 1.5 diploid genomes to assemble
  * Illumina: only need 100-500ng DNA
  * GC-poor. Repetitive junk varies considerably among current ant genomes
  * Illumina: can do paired-end 2x150bp. Library size would be 450-500bp.
  * For mRNAseq typically use chemical fragmentation that results in 150-200bp insert.
  
DGE - not commonly done. Cost of Illumina so cheap that not really necessary.

Down the road, for sequencing other genomes. 

Tentative plan:
  1) Start with Illumina sequencing (use Genomic-tip for DNA extraction to get idea of yield. DO NOT VORTEX. Be nice to DNA. Use wide-bore pipette tips after cell lysis)
  2) Wait for males to develop in colony
  3) When have enough males for 10ug DNA for PacBio, do that. May see major upgrade in sequencing chemistry by next spring so timing may work out.
  4) BioNanoGenomics (for optical mapping) could be useful in structural variants or repeats.


## 2013-09-19

### ApTranscriptome

Problem with oases_pipeline script because does not expand regular expression " -fastq -shortPaired A22-**-interleaved.fq " to include all A22 interleaved files, though this does work when running velveth. Must be an issue with the python wrapper. Specificed each file individually and running!

### git

ssh authentication for for github so can `push` commits without requiring login.

1) [Generate ssh key and verify](https://help.github.com/articles/generating-ssh-keys) if doesn't exist already

2) Change git remote origin using this command:

    git remote set-url origin git@github.com:USERNAME/REPO.git

Should be able to push commits without password entry!

