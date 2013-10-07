---
layout: posts
categories: ApTranscriptome
title: Week Notes 23-27 September
tags:
  - Aphaenogaster
  - mason
  - Trinity
  - velvet
  - oases
  - khmer
---

## 2013-09-23

Working on accepted revisions to final Medicago manuscript.

Gotelli/Brody lab meeting

### Seminar

Corrie Moreau

* ant macroevolution
* gut microbiota

### ApTranscriptome

Had to restart mason job for velvet assembly - crashed due to inadequate memory. Rather than restart entire `oases_pipeline.py` script, hand-coded each step and started at velvetg.

### Reading

Karhunen, M., Merilä, J., Leinonen, T., Cano, J.M. & Ovaskainen, O. (2013). driftsel: an R package for detecting signals of natural selection in quantitative traits. Molecular Ecology Resources, 13, 746–754. Retrieved September 23, 2013, 

  - discussed as similar approach to the Bergman and Coop method for evaluating selection on quantitative traits on [Haldane's Sieve](http://haldanessieve.org/2013/07/31/the-population-genetic-signature-of-polygenic-local-adaptation/)

McIntire, E.J.B. & Fajardo, A. (2013). Facilitation as a ubiquitous driver of biodiversity. New Phytologist, n/a–n/a.

  - interesting review greatly supporting ideas I had in my Ecology paper, sadly not cited...

Russell, J.A., Moreau, C.S., Goldman-Huertas, B., Fujiwara, M., Lohman, D.J. & Pierce, N.E. (2009). Bacterial gut symbionts are tightly linked with the evolution of herbivory in ants. Proceedings of the National Academy of Sciences, 106, 21236–21241.

  - research from Corrie Moreau's seminar




## 2013-09-24

### ApTranscriptome

Even on mason with 120gb vmem, velvetg seems to be crapping out...

Running smaller test analyses at single kmer.

Re-working velvet assembly with diginorm, followed by flash on antlab.

### digital normalization

Already cloned khmer repository, but wanted to update to the bleeding edge branch. To do [this](http://stackoverflow.com/questions/9537392/git-fetch-remote-branch) run

    git checkout --track origin/bleeding-edge

and then 
  
    git status

to check that now on bleeding-edge branch and future `pull` will bring in updates.

### khmer

For this [section](https://khmer-protocols.readthedocs.org/en/v0.8.2/mrnaseq/2-diginorm.html)

    We can combine the orphaned reads into a single file:
    
    for i in *.se.qc.fq.gz.keep.abundfilt
    do
       pe_orphans=$(basename $i .se.qc.fq.gz.keep.abundfilt).pe.qc.fq.gz.keep.abundfilt.se
       newfile=$(basename $i .se.qc.fq.gz.keep.abundfilt).se.qc.keep.abundfilt.fq.gz
       cat $i $pe_orphans | gzip -c > $newfile
    done

error in cat that $pe_orphans did not exist. solved by adding `touch $pe_orphans` after creating

Though...ended up not needing it as I only had paired-end reads. So it goes.


## 2013-09-25

### ApTranscriptome

velvet, even with 120GB, seems to have inadequate memory on mason. not sure why as [velvet memory calculator](http://denovoutils.appspot.com/velvetmem) says that 70GB RAM should be adequate

wrote script to perform assembly using [Trinity](http://trinityrnaseq.sourceforge.net/)

RNAseq tutorial on (Bioconductor)[http://www.bioconductor.org/packages/2.12/data/experiment/html/RnaSeqTutorial.html]

### antlab

Installed Trinity following [these instructions](https://khmer-protocols.readthedocs.org/en/v0.8.2/mrnaseq/3-big-assembly.html)

    curl -L http://sourceforge.net/projects/trinityrnaseq/files/latest/download?source=files > trinity.tar.gz
    tar xzf trinity.tar.gz
    cd trinityrnaseq*
    export FORCE_UNSAFE_CONFIGURE=1
    make

### Behavioral adaptation to thermal stress

Started new undergrad on new project examining behavioral adaptation to thermal stress. As we couldn't find fresh Aphaenogaster, using Pogo.


### Reading

Thomas, M.A., Roemer, G.W., Donlan, C.J., Dickson, B.G., Matocq, M. & Malaney, J. (2013). Ecology: Gene tweaking for conservation. Nature, 501, 485–486.

  - incredible salesmanship. absolutely no reason to think that single-gene "tweaking" will prevent any species extinction.


### Mapping

Some useful resources for mapping in R

Geneland: Guillot, G., Renaud, S., Ledevin, R., Michaux, J. & Claude, J. (2012). A Unifying Model for the Analysis of Phenotypic, Genetic and Geographic Data. Systematic Biology, sys038.


marmap: Pante, E. & Simon-Bouhet, B. (2013). marmap: A Package for Importing, Plotting and Analyzing Bathymetric and Topographic Data in R. PLoS ONE, 8, e73051.

rangemapper: http://rangemapper.orn.mpg.de/


## 2013-09-26

### ApAdaPt

Meet with Nicole to go over validating DNA extraction

Uploaded protocol for DNA extraction to climate-cascade repository


### Climate-cascade

Added protocols to climate-cascade repository. Write in markdown format, but nice to have pdf. With [help](http://inundata.org/2012/12/04/how-to-ditch-word/) found how to change some of the defaul compilation options in pandoc to pdf, specifically to have smaller margins. Also change pdf compiler to xelatex to allow unicode symbols.

    pandoc file. -o file.pdf --latex-engine=xelatex -H margins.sty

Wrote stupidly simple bash script that will compile all markdown files to pdf with these options...in [repository](https://github.com/johnstantongeddes/climate-cascade/blob/master/protocols/compile-pdf.sh).

### Medicago

Final revisions to MEE manuscript...

### Reading

Ostrom et al (1997) Establishing pathways of energy flow for insect predators using stable isotope ratios: field and laboratory evidence. Oecologia 109: 108-113.

  - for discussion with KM


## 2013-09-27

## ApGXL

Received shipment of colonies from NCSU. Total massacre - colonies were shipped with watertubes but not packed tightly and the water tubes drowned and crushed the colonies. Only 11 of 37 survived. 

### ApTranscriptome

Neither trinity or velvet-oases jobs on mason successful...good think that the diginorm strategy works.

### climate-cascade meeting 

Discussed stable isotopes

