---
layout: posts
categories: ApTranscriptome ApGenome ClimateCascade
title: Wed - Fri notes
tags:
  - ddRADseq
  - restriction enzymes
---

## 2013-12-04

### ApGenome

Ground about 40 *Aphaenogaster* in liquid nitrogen with mortar and pestle. Transferred to 1.5ml screw-cap tube with 500ul Buffer ATL. Added 1 scoop zirconium silicate beads. Bullet Blend for 3 minutes. Centrifuged 1 minute top speed. Added 50ul Proteinase K. Vortexed. Incubate overnight at 50C. 

Proceed with Qiagen DNeasy extraction tomorrow.

### Reading

Golan, D. & Rosset, S. (2011). Accurate estimation of heritability in genome wide studies using random effects models. Bioinformatics, 27, i317–i323.

> However, the method suggested by Yang et al. (2010) might carry some hidden pitfalls. Replacing the correct genetic correlation matrix by a different matrix estimated from the data as if the latter matrix were the correct matrix is unfounded statistically. Indeed, using the A* matrix as the variance–covariance matrix introduces two additional sources of variance to the estimation. One is the error originating from the element-wise difference between A* and G (the noise from the non-causal variants) and one stems from the built-in variance of the estimated β. The former in particular is highly sensitive to the proportion of causal SNPs, as our simulations have demonstrated: with few causal SNPs, the noise in A* overwhelms the signal and estimation accuracy in the approach of Yang et al. (2010) deteriorates significantly.



## 2013-12-05

### climate cascade

ddRAD protocol - putting together list for about 500 samples

[Oligo ordering](http://www.operon.com/products/custom-oligos/custom-oligo-price-list.aspx)

[T4 ligase](https://www.neb.com/products/m0202-t4-dna-ligase#tabselect0)


### ApGenome

Great concentration of DNA from DNeasy *Aphaenogaster* extraction! 

elution 1 - 13.8 ng/ul * 200 ul = 2760 ng 

elution 2 - 8.7 ng/ul * 200 ul = 1740 ng

total of about 4.5 ug DNA

Set up two more extractions with 30 ants each. 


## 2013-12-06

### unix

`rm` doesn't accept regular expression as an argument. Use [this command](http://superuser.com/questions/392872/delete-files-with-regular-expression) instead

    ls | grep -p "yourstring$" | xargs -d"\n" rm

### ApTranscriptome

Debugging [ApTran_assemble.R](https://github.com/johnstantongeddes/ApTranscriptome/blob/master/scripts/ApTran_assemble.R) script...

### climate cascade

Supplies for ddRADseq - order list on workstation in `home/projects/climate-cascade/protocols/ddRAD_ordering_20131209.xlsx`

Automatic size selection of DNA fragments requires Sage Sciences system.

Pippin Prep 
90bp to 2kb
$9,900

Blue Pippin
90bp to 50kb 
$15,000

Consumables cost the same - $.84/sample according to ddRAD protocol.

Either will have to do gel excision or find alternate method for DNA fragment size selection. 

### ApGenome

Two more DNA extractions of 30 *Aphaenogaster* each.

For each sample, did 1 elution of 200 ul and a second of 100 ul into the same tube.

ApDNA.2 - 10.1 ng/ul * 300 ul = 4.2 ug 

ApDNA.3 - 6.2 ng/ul * 300 ul = 1.8 ug

combined two elutions from first extraction

ApDNA.1 - 10.1 ng/ul * 400 ul = 4 ug 

TOTAL = 10 ug DNA

Right at minimum level for PacBio - do one more extraction, pool together and ship to [Delaware](http://www.udel.edu/dnasequence/Site/Home.html)for sequencing! They will evaluate if fragment size is in fact greater than 20kb as promised by Qiagen for PacBio sequencing.


