---
layout: posts
categories: 
  - ApGxL
  - MtGIRAFFE
  - ApTranscriptome
title: 2 - 5 September notes
tags: 
  - VACC
  - Docker
  - STRUCTURE
  - haplotype clustering
---

## 2014-09-02

- comments for GC and LS undergrad research proposals
- AN practice talk
- ApTranscriptome - working on re-running analysis using VACC while waiting for workstation to be fixed


## 2014-09-03

- EEEB lunch

### MtGIRAFFE

- Met with Jeanne Harris to discuss progress
- Have phased haplotypes from BEAGLE
- Working on formating data for STRUCTURE
- WAIT: can I just use raw haplotypes from BEAGLE? How many are there?

Got data in STRUCTURE format!

To get STRUCTURE to run, had to set POPFLAGF, USEPOPINFO and LOCISPOP == 0

### PogAdaPt

Trained Laurel on ant room.
 

### Computing

Workstation still in shop. Major bottleneck in proceeding with analysis is the (re-)installation of software. 
Motivation to look into using [Docker](https://www.docker.com/) to build reproducible computing image so not only the analysis, but also the computational set-up is reproducible. 

Some examples [here](http://melissagymrek.com/science/2014/08/29/docker-reproducible-research.html) and [here](http://figshare.com/articles/Using_Docker_to_Support_Reproducible_Research/1101910)
  
Not so easy - Docker only supported for 64-bit architecture. [Steps for getting docker to work on 32-bit architecture](http://mwhiteley.com/linux-containers/2013/08/31/docker-on-i386.html).
  
Random awesomeness: [iPipet](http://ipipet.teamerlich.org/home) - benchtop tool to track the transfer of samples and reagents using a tablet



## 2014-09-04

- Aphaenophone
  - genomics update
  - plans for chambers in 2015
  - grant renewal
  - AN data: CTmax measure?
  - Aphaenofest next Jan or Feb in 
  
### Computing

Beginning to move analyses to VACC. Cluster runs RedHat Enterprise Linux 5 and all software is completely out of date. Had to install new versions of emacs, java, R.

As test case, doing MtGIRAFFE bioinformatics. Installed bcftools, beagle, etc.

It is 64-bit architecture so hope to get Docker running, but only supported for RHEL 6> so may not work.

Also trying to work on Amazon Cloud.

Considering using [BioBrew](https://github.com/yannickwurm/bio.brew) for computational setup.


### MtGIRAFFE

Going on VACC - got necessary programs installed. 

After haplotype inference with Beagle, found 104 unique haplotypes out of the 524 haplotypes. Given the nature of the inbred accessions, I was surprised that there were so many accessions with two different haplotypes - maybe imputation isn't appropriate? I also check the number of unique haplotypes in only the first or second chromosome from each accession, with results of 94 and 96 unique haplotypes. So, either way there are nearly 100 haplotypes in the 262 accessions. Best method to further reduce/cluster these? 

As a first attempt, using [Instruct](). 



## 2014-09-05

### Computing

Trying to install [pandoc for rmarkdown](https://github.com/rstudio/rmarkdown#installation) on VACC. Have to install locally as I don't have root access so can't use `yum`. 

- Tried installing pandoc-standalone from [here](https://petersen.fedorapeople.org/pandoc-standalone/README.html) but can't use `yum`...
- Followed [these steps](http://superuser.com/questions/209808/how-can-i-install-an-rpm-without-being-root) to convert rpm to cpio archive

    
    rpm2cpio pandoc-1.12.4.2-1.x86_64.rpm | cpio -idv
    
and this seemed to work as a new directory tree was created `/usr/bin/pandoc`, but trying to run `pandoc` gave this error.

    ./pandoc: error while loading shared libraries: libffi.so.5: cannot open shared object file: No such file or directory

At this point...I quit.


### MtGIRAFFE

InStruct ran successfully! In test of 1 - 10 clusters, 10 was the optimal number. That said...I'm starting to think this is the wrong approach. Structure-like programs are for clustering of individuals using *unlinked* molecular markers. These SNPs are all from the *same* gene so are highly linked. 

While BEAGLE can be used for clustering, the clusters are an intermediate step for association mapping and not easily viewed. Google-fu found the [Haplosuite](http://www.statgen.nus.edu.sg/~software/haplosuite.html) R code that (maybe) gets around these (Teo & Small 2010). 

