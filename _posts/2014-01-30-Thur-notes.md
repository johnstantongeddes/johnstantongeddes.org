---
layout: posts
categories: ApTranscriptome
title: Thursday notes
tags: 
  - RSEM
  - AmPure
---

### ApAdaPt

Meet with Nicole to do AmPure Bead purification of double digest...but PCR plates and tubes don't fit the magnetic plate. Had to order 300 ul round bottom PCR plates.

### ApTranscriptome

Debugged analysis and repeatable results. 

50% speed improvement using `ddply` over for loop to identify significant transcripts.

FDR correction is too conservative. For A22, while 11,846 transcripts have uncorrected P<0.05, only 4 are significant at 5% FDR, and none for Ar. 

## 
## Call:
## qvalue(p = pvals)
## 
## pi0: 0.3924  
## 
## Cumulative number of significant calls:
## 
##         <1e-04 <0.001 <0.01 <0.025 <0.05  <0.1    <1
## p-value     52    344  2845   5674 11846 17600 99811
## q-value      0      0     0      3     4  1085 99811

Split the analysis into 'low' and 'high' temps as discussed yesterday, and the result is no different. 

---------------------------------------------------

* Helms-Cahan lab meeting
* PBio seminar - Eric von Wettberg


