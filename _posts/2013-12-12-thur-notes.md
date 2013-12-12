---
layout: posts
categories: ApTranscriptome ApGenome ClimateCascade
title: Tuesday - Thursday notes
tags:
  - transcriptome
  - Trinity
---

## 2013-12-10

### Computing

Nice [github guide](http://readwrite.com/2013/09/30/understanding-github-a-journey-for-beginners-part-1#awesm=~opCXll4gWGwQH8)

### ApGenome

Finished fourth extraction and pooled all together. 

----------------------------------------

Sent Ap001 DNA sample to Delaware Biotechnology Institute for PacBio and Illumina sequencing.

**Sample**: *Aphaenogaster picea* ant collected from Molly Bog, VT

DNA was extracted from 4 sets of 20-40 ants using Qiagen DNeasy kit. Elutions of 300-400 ul per exctraction were pooled for a total volume of about 1300 ul. 

Nanodrop quantification showed 15.5 ng/ul with a 260/280 ratio of 1.8. Approximate total of 18 ug DNA.

### Ethics

Took required ethics training course for NSF grant at [https://www.citiprogram.org/]


## 2013-12-11

Writing group from 9-10. Added about 700 word to Methods sections of Aphaenogaster transcriptome paper!

### ApTranscriptome

Results of BLASTING known spike-in transcripts to A22 assembly:

Metric                                              Result
-----------------------------------------------    ---------
Number spike-in 	                                 100 
Mean length spike-in (bp) 	                         865.28 
Number assembled 	                                  99 
Mean length assembled (bp) 	                         872.26
Mean length missing (bp) 	                         174 
Mean proportion of original transcript mapped 	       0.97 
Mean number assembled transcripts per starting 	       1.2 
Proportion bp assembled to starting bp 	               1.06 
--------------------------------------------------------------

Very nice results! 

* 99 of 100 known transcripts assembled
* only missing transcript is short (under 200 bp)
* most transcripts assembled to full length in single contig
* only 6% of assembly is redundant!

### computing

Set up shell script [knit](https://github.com/yihui/knitr/blob/master/inst/bin/knit) on `home/scripts` on workstation, symbolic linked in `usr/local/bin` such that globally accessible. Problem that R libraries not installed globally...copied my libraries to `/usr/local/lib/R/site-library/` following [Administration and Maintenance of R packages](http://cran.r-project.org/bin/linux/ubuntu/README). To globally install package, start R as super-user

    sudo R

and install packages to global library

    install.packages("aster2", lib="/usr/local/lib/R/site-library")


## 2013-12-12

### ApTranscriptome

Confirmed that the `sim.assembly.eval` function fails to find any siginificant matches to the VGN Trinity full data assembly that did not include simulated reads!

Using CAP3 or CD-HIT gives similar results (Yang and Smith 2013) so use only CAP3. As I'm now merging contigs *within* a species, increase similarity threshold to 98%. Previously used 90% when trying to merge orthologs among species.

Found error - removed `trimclip` directory with filtered reads, but need these reads for gene expression quantification! 

To check reproducibility of script and get these reads, cloned repo into `/home/projects/climate-cascade/projects/ApTranscriptome` and ran

   knit ApTran_assemble.R

to start assembly...

2013-12-12 9:26

/scripts (master *)$ nohup nice -n 19 knit ApTran_assemble.R &
[1] 12512
nohup: ignoring input and appending output to `nohup.out'


Updates to script
 
* use CAP3 to remove redundant transcripts and chimeras
  - changed percent identity to 98% because am merging within a species, not between the two species transcriptome assemblies as before
* evalute CAP3 assembly against *in silico* transcripts
  - basically no difference - full assembly does as well as reduced
* use sailfish for quantification! 
  - ran into some problems with the "LD_LIBRARY_PATH". emailed Google Group for [help](https://groups.google.com/forum/#!topic/sailfish-users/QAbwRPE7QX4)
  - for a single sample (A22-00), quantification done in about 20 minutes!!

