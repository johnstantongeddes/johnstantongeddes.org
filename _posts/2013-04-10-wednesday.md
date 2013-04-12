---
layout: posts
category: ecological genetics
title: still assembling
tags: 
  - genome assembly
  - Bradyrhizobium
  - velvet
---

## Aphaenogaster

Permits...

## Bradyrhizobium

Sample    Oligo
--------  -------
IC1       ATCACG
ENC4      TTAGGC
EWC3      CGATGT
-----------------

VelvetOptimiser gives error and doesn't complete final run due to error:

    Unable to open /panfs/roc/groups/2/tiffinp/stanton1//home/tiffinp/stanton1/B-elkanii-genomes/velvet-assembly-EWC3/VelOpt_data_49/stats.txt for exp_cov determination.
    at /home/tiffinp/stanton1/software/VelvetOptimiser-2.2.5/VelvetOptimiser.pl line 838

Problem was with script...had specified entire path '/home/tiffinp/stanton1/B-elkanii-genomes/velvet-assembly-EWC3' when I should have only specified the relative path 'B-elkanii-genomes/velvet-assembly-EWC3'. Once I fixed this, ran perfectly!

Reran with corrected script and worked perfectly!  

Sample    kmer   Number contigs     N50         Total length
--------  -----  ---------------    ---------   --------------
IC1        49       1,424             44,314       9,513,597
ENC4       45       2,196             64,938       8,479,608
EWC3       45       1,309             65,438       8,418,993

ToDo

1) Order velvet contigs to B. japonicum USDA110 reference genome using ...?
2) Mapping assembly to existing B. elkanii genomes using Bowtie2
3) Compare de novo to mapping assemblies using MUMmer
4) Gene annotation...using RAST?
5) Phylogeny with all sequenced Bradyrhizobium strains 
	- do strains from C. fasciculata group together or interspersed with strains from soybean?
	

## Reading

Van Heerwaarden, B. & Sgrò, C.M. (2013). Multivariate analysis of adaptive capacity for upper thermal limits in Drosophila simulans. Journal of Evolutionary Biology, 26, 800–809. Retrieved April 10, 2013,


## Workflow

Zotero. Installed [AutoZotBib](http://www.rtwilson.com/academic/autozotbib) to allow for automatic export of a bibtex file built from my Zotero library. There was a note that this may considerably slow down Zotero so will test it out before committing fully. 

----------------

Latex style files for PLOS and Genome Biology: http://ligarto.org/rdiaz/

    LaTeX bst files
    LaTeX bst (bibliography styles) files for Public Library of Science, Biology and Genome Biology. The PLoS one I use with the natbib package (with \usepackage[authoryear, round, sort]{natbib} in the preamble. The GB one does not use natbib. To use either, include

	  \bibliography{the.name.of.the.bib.file}
	  \bibliographystyle{GenomeBiology} %% or PLoS

    where you want the bibliography to appear. I prepared these bst files using makebst.tex, with a little manual editing. (makebst.tex is available, I think, as standard in all LaTeX installations for GNU/Linux, and also from CTAN). If you find any errors, I'd appreciate if you can let me know.

## Computing 

Ubuntu finally installed on Dell T7600 workstation! The awesome computer techs at Pine Computers ended up having to completely replace the RAID card to get one with linux drivers. Picked up machine and booted perfectly!

