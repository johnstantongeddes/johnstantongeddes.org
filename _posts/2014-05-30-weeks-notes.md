---
layout: posts
categories: 
  - ApTranscriptome
title: May 26 - 30 notes
tags: 
  - BLAST
  - RefSeq
  - DAVID
  - aster
  - species distribution models
---

## 2014-05-24

### ApTranscriptome

For working with DAVID database, needed gene IDs for high quality reference hits. Used the [RefSeq protein database](http://www.ncbi.nlm.nih.gov/refseq/) targeting *Apis mellifera* and *Drosophila* as preliminary examination by Sara showed these returned the most hits that were in the DAVID database.

The following script 

* downloads the RefSeq protein database, 
* makes a database alias for *Apis mellifera* and *Drosophila* as explained [here]({% post_url 2014-04-24-notes %}) but using taxid 7460 for Apis mellifera. note that the 'gi.list' file needs to be created and in the directory before running the script
* runs `blastx` in parallel creating a file in BLAST archive format

~~~
#!/bin/bash

transcriptome="/home/jstantongeddes/research/ApTranscriptome/results/trinity-full/Trinity_cap3_uclust.fasta"

## download newest version of database using `update_blastdb.pl` script
update_blastdb.pl refseq_protein

## uncompress files
for filename in *.tar.gz
do
    tar zxf $filename
done

## make alias to A. mellifera and Drosophila
blastdb_aliastool -gilist ../amellifera_drosophila_gi.list -db refseq_protein -out refseq_protein_amellifera_drosophila -title "Apis mellifera and Drosophila Refseq Protein database"


# blastx using GNU parallel 
cat $transcriptome | parallel -j 8 --block 100k --recstart '>' --pipe blastx -evalue 0.01 -max_target_seqs 1 -outfmt 11 -db  refseq_protein_amellifera_drosophila -query - > ApTranscriptome_parallel_blastx_refseq_protein_amellifera_drosophila
~~~

I then created a table format file with 1 hit per query using `blast_formatter`:

    blast_formatter -archive ApTranscriptome_parallel_blastx_refseq_protein_amellifera_drosophila -max_target_seqs 1 -outfmt 6 -out test6

Of the initial 105k transcripts, 29,080 had BLAST hits to the *Apis mellifera* & *Drosophila* RefSeq protein database. This is the file I then used for DAVID.


## 2014-05-27

### ApTranscriptome

Figuring out how to use rDAVIDWebService...

----------------------

- Started [Aster analysis user's group](https://groups.google.com/forum/#!forum/aster-analysis-user-group)!
- [Hacker's guide to git](http://wildlyinaccurate.com/a-hackers-guide-to-git)
- First meeting of bioinformatics bootcamp group
- Update Silene aster analysis




## 2014-05-29

## Centennial paper

Reading...

Jay et al. 2012 Molecular Ecology

- applying SDMs to genetic clusters prone to two errors
  - statistical errors in assignment of individuals to clusters would not be accounted for
  - inaccurate modeling of admixture
- ancestry distribution models account for these two problems
- project ancestry coefficients on geographic maps
- limit the number of clusters to < 4 .... why?

Sork et al. 2010 Molecular Ecology

- range-wide characterization of genetic structure of California valley oak
- patterns of population relatedness using [PopGraph](http://dyerlab.bio.vcu.edu/docs/popgraph.html)
  - significant connectivity among populations, especially in north. evidence for long-distance gene flow along foothills. central valley a barrier for direct east - west gene transfer in south
- correlations between nuclear genetic variation and climate variation
  - strong association
- region-specific bioclimatic models (SDMs)
  - size and proximity of predicted suitable habitat varies considerably among regions, from nearly complete overlap to separation of > 100 km
  
D'Amen et al. 2013 Global Ecology and Biogeography

- examination of how species-level niche modeling can bias evaluation of conservation requirements in presence of intra-specific variation
- 10 mammal species in Africa with multi-gene phylogenetic trees
- 3 sets of ecological niche models (ENMs)
  * ENM-S: standard species-level ENM
  * ENM-L: for each lineage within a species
  * ENM-C: composite to summarize across each lineage
- species-level models substantially over-predict range expansion


Espindola et al. 2012 Ecology Letters

- investigate distribution dynamics of cold-adapted globeflower
- characterized population structure using STRUCTURE
- niche-based SDMs to predict future species and population distribution
- compared hind-casted SDMs to phylogeographic 
- simulated 


Pease et al. 2009

- identify lineages of California mule deer using Structure
- significant overlap of lineages at LGM 
- present-day genetic divergence appears to be recent, driven by ecological factors



## 2014-05-30

* Meet with NG to discuss Centennial paper
* Writing.
* Working on DAVID analysis.
* Meet with Scott Tighe at sequencing facility. 
  - Went over protocol for bead purification and size selection using E-gels
  - very light DNA smear of post-PCR product. suggested we check PCR and do a titration with different # of cycles to confirm PCR is working

