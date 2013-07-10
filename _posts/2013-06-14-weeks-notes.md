---
layout: posts
category: ecological genetics
title: Notes for week of June 10
tags:
  - Aphaenogaster
  - Medicago
---

## 2013-06-11

One of the amazing aspects of google scholar citation alerts is that it pulls up patents in addition to scholarly articles. [Transgenic Plants with Enhanced Agronomic Traits](http://www.freepatentsonline.com/y2013/0145493.html) turned up this morning with this rather expansive description:

    1. A recombinant DNA construct comprising a promoter that is functional in a plant cell and that is operably linked to a polynucleotide that, when expressed in a plant cell: (a) encodes a protein: i) having an amino acid sequence selected from the group consisting of SEQ ID NO: 45-68, and 70-88; ii) having an amino acid sequence having at least 90% identity over at least 90% of a reference sequence selected from the group consisting of 45-68, and 70-88 when said amino acid sequence is aligned to said reference sequence; or iii) that is a homolog of a protein with an amino acid sequence selected from the group consisting of SEQ ID NO: 45-68, and 70-88; or (b) is transcribed into an RNA molecule that suppresses the level of an endogenous protein in said plant cell wherein said endogenous protein has an amino acid sequence of SEQ ID NO: 69 or is a homolog thereof; wherein said construct is stably integrated into plant chromosomal DNA. 

Without being an expert on patent law, looks like the are trying to patent a specific gene in group SEQ ID NO 45-68. Bradyrhizobium (my search term) comes up as a source of the potential promoter. So, should I (or UMN?) patent my Bradyrhizobium genomes when I publish them???

Wow, and this line

    Yet another aspect of the invention provides anti-counterfeit milled seed having, as an indication of origin, plant cells of this invention.

makes it clear that they plan to track and prosecute the 'patented' genes.

-------------------------------------------------------------------------------------------

Tool to draw [custom Venn diagrams](http://bioinformatics.psb.ugent.be/webtools/Venn/)

#### Meeting with NG

  - discussed adaptive potential project
    * to avoid becoming overwhelmed, pilot study this year in MA
    * collect colonies at Harvard Forest, and nearby 'warm' site in Worchester
  - project version control
    - use github as planned
    - write up explanation using github user interface
    - include data in local directories, but hide in .gitignore
    - how to share data among collaborators? dropbox too small...server?
      * use amazon!!!



## 2013-06-12

#### Aphaenogaster

Updated Google Earth with sampling sites. Pursuing contacts in NY and VT for collecting at alternatives to state lands.

Working in github tutorial for version control of scripts.

#### P-value commentary

Went over responses with Cintia and Cristian. Tabulated 'data'


## 2013-06-13

Note - from discussion at Aphaenofest with AE and SD, should include sessionInfo() in every R script! Important for reproducibility 5+ years in future...

#### Maps

Update map script in climate-cascade project.

Tried to install `rgdal` library. First had to install gdal `sudo apt-get install libgdal-dev` and confirmed this worked by running `gdal-config` and seeing options. But when I tried to install rgdal, error message that "proj_api.h" not found in standard or given locations...

Success! First had to install libproj: `sudo apt-get install libproj-dev` [suggested](https://groups.google.com/forum/?fromgroups#!topic/spatialite-users/xlA7D_4vqqw) 

To summarize, to install R package rgdal:

  1) install gdal using `sudo apt-get install libgdal-dev` in shell
  2) install proj using `sudo apt-get install libproj-dev` in shell
  3) install R library `install.packages("rgdal")` 

Not clear how to plot MAT in ggplot so deferred for later...

#### P-value commentary

Writing...


#### Aphaenogaster permits

Permission from Bard College Field Station (Hudsonia): Eric Kiviat (kiviat@bard.edu). Call in advance and check in at field station before sampling.

Left message at Cary Institute for Kelly ???

Green Mountain National Forest - 3 week permitting process. Called Killington and was told sampling would not be a problem! Score.

Contacted Ken Howard at Albany Sage College (recommendation from Amy Savage at Bard). 

He has had collecting permits in past 2 years and gave new contact name. Also recommended some private sites:

  - Huyck Preserve, where Joan Herbers and Suzanne Foitzik have collected
  - Ann Lee Pond, next to Albany airport
  - Rattlesnake Mtn in Willsboro, NY as potential collecting site. Private land so not permit needed. http://www.lakechamplainregion.com/recreation/outdoors/hiking/rattlesnake-mountain-trail
  - field stations at Williams, Binghamton, Skidmore and Ithaca College



#### Website

Add [ImpactStory](http://impactstory.org/collection/lntwgn) to publications page

Need to make [columns](http://stackoverflow.com/questions/9966890/best-way-to-do-columns-in-html-css) for correct layout 

Probably need to use bootstrap [scaffolding](http://twitter.github.io/bootstrap/scaffolding.html)


#### Reading

Barshis et al (2012) Genomic basis for coral resilience to climate change. PNAS

  - discussed relevance to Aphaenogaster transcriptome
  - we will have complete reaction norms for all genes, not simply two temperature points


##2013-06-14

#### Climate Cascade

Bingo - use Amazon S3 for data storage. Read files into R as [described](http://stackoverflow.com/questions/13637825/correct-parameters-to-download-file-using-amazon-s3-api-get-requests)


#### P-val commentary

Finishing...

#### Computing

Installed kompozer for html using [guide](https://help.ubuntu.com/community/InstallKompozer)
 
Argh. Upgrade to R 3.0.1 to install devtools broke the `rptR` package. Had to install R 2.15.1 into /opt and run from there to repeat analyses. Emphasizes the need for sessionInfo() in R scripts!!


