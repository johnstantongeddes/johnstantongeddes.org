---
layout: posts
categories: ApPopGen ApAdaPt
title: ddRADseq anneal adapters
tags: 
  - ddRADseq
  - adapters
  - chemistry
---




### ddRADseq

Annealed adapters following [protocol](https://docs.google.com/document/d/14LzChQSHRMghGaWL55EYsZ09Ve-3ncHIJzv6TLYvBcg/edit?hl=en_US) from (<a href="http://dx.doi.org/10.1371/journal.pone.0037135">Peterson et al. 2012</a>). First had to prepare annealing buffer:

**Annealing buffer (10X)**

reagent       volume (ml)
-----------  -------------
500mM EDTA       1
1M NaCl         25
Tris-HCl         5
H2O             19
**TOTAL**       50

Adjusted pH to 8.

To prep 1M NaCl, added 11.7g NaCl to 200ml H2O. Felt like chemistry class again figuring this out. 

0.2 L solution * 1 mole NaCl/1 L solution = 0.2 moles NaCl

0.2 moles NaCl * 58.5 g NaCl/1 mole = 11.7g NaCl

where 58.5 is the molecular weight of NaCl.

**Anneal adapters**

All oligos were ordered at concentration of 200uM so I could follow recommended prep:

* 20 ul oligo 1.1
* 20 ul oligo 1.2
* 10 ul 10x annealing buffer
* 50 ul H2O

In thermocycler, incubated at 97.5C for 2.5 minutes, then step down 3C every minute until reached 21C (95 - 92 - 89 ... 21).

Used all 48 oligos provided by <a href="http://dx.doi.org/10.1371/journal.pone.0037135">Peterson et al. (2012)</a>. Made two tubes of the common P2 adapter.

Stopped here today, but planning for adapter ligation. Need to make working stocks. Calculate concentration using copy of their ligation molarity calculator [worksheet](https://docs.google.com/spreadsheet/ccc?key=0Ar5IymziRJ_9dEtyYzRfd0cteDc1cEM1ekN5M1doZEE&usp=drive_web)

**Adapter ligation**

To determine working stock concentration, need "average distance between sites for each enzyme". This comes from Andrew's Bioanalyzer results for single digest of each enzyme:

Enzyme     Sample     Average size [bp]
-------   ---------  -------------------
NlaIII      rudis          3,416
NlaIII      picea          1,079
MluCl       rudis          422
MluCl       picea          335

Average distance between sites for each enzyme is 2247.5 bp for *NlaIII* and 378.5 bp for *MluCl*.

Inputting these values into the [ligation molarity calculator worksheet](https://docs.google.com/spreadsheet/ccc?key=0Ar5IymziRJ_9dEtyYzRfd0cteDc1cEM1ekN5M1doZEE&usp=drive_web) with an input DNA of 0.001 ug (1 ng total per sample from Qubit) gives input of 0.17 ul (P1) and 1.00 ul (P2) annealed adapter stocks to make working adapter solution.


### References


- Brant K. Peterson, Jesse N. Weber, Emily H. Kay, Heidi S. Fisher, Hopi E. Hoekstra, Ludovic Orlando,   (2012) Double Digest Radseq: an Inexpensive Method For de Novo Snp Discovery And Genotyping in Model And Non-Model Species.  *Plos One*  **7**  e37135-NA  [10.1371/journal.pone.0037135](http://dx.doi.org/10.1371/journal.pone.0037135)

