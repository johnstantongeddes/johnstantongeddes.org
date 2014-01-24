---
layout: posts
categories: ApTranscriptome
title: Thursday - Friday notes
tags: 
  - expression 
---

## 2014-01-23

* Lab safety training

### ApTranscriptome

Preliminary finished analysis 

Odd pattern that of 1,870 transcripts with significant responsive expression, 98% shared among colonies.
Double-checking all code to see if this can be correct.


* Lab safety training
* Helms-Cahan lab
* Steve Keller seminar in Plant Biology


## 2014-01-24

### ApTranscriptome

Trying to figure out why each colony has such similar expression patterns...could this really be true?

In debugging script, found *major* error where sailfish quantification mis-matched levels. Though a problem, this shouldn't change the shared pattern among colonies, just which transcripts show significant responsiveness.

Also trying to speed up RxN analysis by using plyr instead of a for loop. 
Steep learning curve.

TODO:

- cross-check results with RSEM

