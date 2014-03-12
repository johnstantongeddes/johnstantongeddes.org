---
layout: posts
categories: 
  - ApAdaPt
  - ApPopGen
title: ddRADseq ligation
tags: 
  - ddRADseq
  - ligation
---

Yesterday spent on R code and writing...today the lab.


### ddRADseq

Due to possible (I don't think I did, but can't be 100% sure I didn't) contamination between adapters P1.45 and P1.46, I remade stocks for these two adapters.

Made 10x dilutions of annealed primer stocks - 30:270 ul for a total of 300 ul so that I can put 2 ul in each of 96 rxns with plenty to spare.

**Adapter ligation**

Performed adapter ligation for both ApPopGen (JSG001) and ApAdaPt (JSG002) plates.

* Normalized all samples to 50 ng which required all 38 ug of digested DNA for some samples. Thus, increased reaction volume to 50 ul, and correspondingly the volume of adapters P1 and P2 to 2.5 ul per reaction.
* Made working adapter stocks for ligation using [ddRAD ligation molarity calculator](https://docs.google.com/spreadsheet/ccc?key=0Ar5IymziRJ_9dEtyYzRfd0cteDc1cEM1ekN5M1doZEE&usp=drive_web#gid=0) with 10x diluted (4umol/ul) annealed adapter stocks.
* Made T4 master mix for two plates - 1 ul T4 in 400 ul T4 10X buffer, which works out to about [20 units per sample]({% post_url 2014-03-10-Monday-notes %}.
* Added H2O to a total reaction volume of 50 ul.
* Transfered samples to PCR plate so I could do incubation in PCR machine.
* Incubated 30 min at 23C, 10 min at 65C, and cooled 2C every 90 sec to room temp. 
* Placed in freezer for pooling and size selection tomorrow...


**Size selection**

To experiment with gel excision, ran a large gel with 5 lanes of 1kb ladder. 

Note - for *real* samples, run ladder on each side of sample and use both bands to circumscribe the region to excise. 


### Computing

[Using iPython notebooks](http://nbviewer.ipython.org/github/jrjohansson/scientific-python-lectures/blob/master/Lecture-0-Scientific-Computing-with-Python.ipynb)

