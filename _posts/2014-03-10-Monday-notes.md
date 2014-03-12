---
layout: posts
categories: 
  - ApAdaPt
  - ApPopGen
  - ApTranscriptome
title: Monday notes
tags: 
  - ddRADseq
  - teaching
  - slides
---

### Teaching
    
Stack Overflow [on teaching](http://academia.stackexchange.com/questions/17933/good-slide-design-for-teaching)

### ApTranscriptome

1. Input from Nick on calculating variance of region over which gene expression occurs for "Intermediate" and "Bimodal" expressed transcripts - draw 1000 X values with probability weighted by predicted expression level. Estimate variance of this random draw.

```
Tlm <- lm(TPM ~ val + I(val^2), data = df)
temp <- seq(0:38, by = 0.05)
pred <- predict(Tlm)
random.draw <- sample(1000, temp, p = pred)
expsd <- sd(random.draw)
```

2. Make plot that plots density of maximum values of expression against temperature for each colony, faceted by expression type.


### ddRADseq

Continuting on protocol from where I finished [last week]({% post_url 2014-03-06-ddRADseq-adapters %}):

1. Normalizing samples to 50 ng each, but many have less than this mass of DNA.
For these, I will use all the available sample (38 ul). After adding 2 ul of each adapter, the reaction volume will be over 40 ul prior to adding the T4 ligase.

2. T4 ligase. The ddRADseq protocol semi-helpfully directs me to the NEB "unit definition" for the amount of T4 ligase to add to each sample. T4 ligase comes at 2e6 units per ml, so 2000 units per ul. The supplemental material of Peterson et al. (2012) states that they used 20 units of T4 ligase for each sample of 50 - 500 ng. Following this, I only need 1 ul to get 41.6667 units per sample, with 4 ul T4 buffer in each sample. This adds an additional 4 ul to each reaction.

3. To accomodate the larger volume of reaction, increase total reaction volume to 50 ul each. 

4.[ddRAD ligation molarity calculator](https://docs.google.com/spreadsheet/ccc?key=0Ar5IymziRJ_9dEtyYzRfd0cteDc1cEM1ekN5M1doZEE&usp=drive_web#gid=0) is unclear in a few cases. annealing buffer is 10x stock - added row to specify 20 ul of this in 200 ul total for 1x final concentration, and remainder solution H20.


