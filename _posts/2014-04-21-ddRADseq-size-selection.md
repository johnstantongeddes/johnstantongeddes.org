---
layout: posts
categories: 
  - ApGxL
  - ApAdaPt
title: Monday notes
tags: 
  - ddRADseq
  - size selection
---

* Finished review for PLOS Biology

* Biology seminar - [Matt Forister](https://sites.google.com/site/greatbasinbuglab/)
  - great research showing highly polygenic additive genetic basis for host switch
  - no genomic evidence for antagonistic pleiotropy
  
  
### ddRADseq

* Pooled 40 ul of each ligation in single 1.5 ml tube, leaving ~ 10 ul for diagnostics.
* AMPure bead purification - modified rack method using 96-well magnet plate
  - Total pool volume 320 ul. 
  - 480 ul AMPure beads
  - Two washes with 500 ul 70% EtOH
  - Eluted in 30 ul H~2~O
* Size selection
  - ran gel for 2.5 hrs at 120V.
  - To size select (1) 200+-20 bp, (2) 300+-20 bp, (3) 400 +- 20bp, had to account for 76 bp of adapter sequence. Cut gel pieces 250 - 300 bp, 350 - 400 bp, 450 - 500 bp
  
![gel size selection]({{ site.url }}/assets/files/gel_size_selection.png)

  - QIAquick purification, eluting in 12 ul H~2~O
* Sent all ligation samples (T1-T7) and 3 size-selected pooled samples (P1-P3) for Bioanalyzer analysis



### Reading

Alexander, J.M. (2013). Evolution under changing climates: climatic niche stasis despite rapid evolution in a non-native plant. Proceedings of the Royal Society B: Biological Sciences, 280, 20131446. 
 
  - invasion of *Lactuca serriola* to study climatic niche evolution
  - invasive genotypes primarily from Europe, with low-levels admixture from Asia
  - non-native plants flower earlier than ancestral European plants, but not different from Asian plants

> climatic niche expanded by over 30% in non-native range compared with Europe...primarily in arid regions

  - however, do not exceded phenotypic variation within native range; niche conservatism?
  - 

Moore, K.A. & Stanton, M.L. (2014). Propagule Limitation, Disparate Habitat Quality, and Variation in Phenotypic Selection at a Local Species Range Boundary. PLoS ONE, 9, e89404. 

  - fine-scale spatial heterogeneity in ecological dynamics and selection
  - decline in habitat quality beyond edge, but migrants able to establish on unoccupied microsites at and beyond edge
  - unique selection pressures in margin habitat
  
Sarup, P., Sørensen, J.G., Kristensen, T.N., Hoffmann, A.A., Loeschcke, V., Paige, K.N. & Sørensen, P. (2011). Candidate Genes Detected in Transcriptome Studies Are Strongly Dependent on Genetic Background. PLoS ONE, 6, e15644.

> ...little overlap across studies between putative candidate genes for the same traits in the same sex. Instead there was a high degree of overlap between different traits and sexes within the same genetic backgrounds. 
  
Scholes, D.R., Suarez, A.V. & Paige, K.N. (2013). Can endopolyploidy explain body size variation within and between castes in ants? Ecology and Evolution, 3, 2128–2137.

  - endoreduplication process by which nuclear genome is replicated without mitosis resulting multiple genome copies
  - flow cytometry to asses endoreduplication among castes of ants
  - among females, endoreduplication positively related with size within worker caste
  - males had highest rates of endoreduplication, compensates for haploid origin


### UseR group

Using R with SQL Server
