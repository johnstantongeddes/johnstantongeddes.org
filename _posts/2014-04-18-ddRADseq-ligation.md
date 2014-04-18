---
layout: posts
categories: 
  - ApGxL
  - ApAdaPt
title: Friday notes
tags: 
  - ddRADseq
  - T4
---

### ApTranscriptome

Working on tables, figures.


### ddRADseq ligation

[Yesterday's Bioanalyzer results]({% post_url 2014-04-17-notes %}) only give DNA within selected region. Ran Qubit to get total DNA concentration of sample.

Sample          Conc (ng/ul)
--------       --------------
T1                  10.9
T2                  24.5
T3                   5.19
T4                  10.2
T5                   5.82
T6                   2.1
T7                   0.13

<br>

- *Contamination* in T7 which is the blank control. 

For each sample, used this volume to get 100 ng DNA as input for ligation. Sample T6 not enough DNA for 100ng, so used all available.

Sample        Volume DNA      
--------    --------------  
T1               9.2 
T2               4.0 
T3              19.3 
T4               9.8  
T5              17.2  
T6              47.6  
T7              40.0  

<br>

Ligation reaction: combined DNA with adapter and T4 ligase

Reagent         Volume (ul)
----------     -------------              
DNA               see above
T4 mix            4
P1 (4uM)             0.5
P2 mix               3
H~2~O             to 50 ul

<br>

**P1**: Rather than make a working stock for each adapter P1, just used 0.5 ul of adapters P1.1 - P1.7 for samples T1 - T7, respectively. Made master mix of universal adapter P2 following [ligation molarity calculator](https://docs.google.com/spreadsheet/ccc?key=0Ar5IymziRJ_9dEtyYzRfd0cteDc1cEM1ekN5M1doZEE&usp=drive_web#gid=0)

**T4 mix**: Mixed 0.5 ul T4 ligase with 28 ul buffer. Added 4 ul to each reaction. 

Incubated samples for 30 min at room temp, heat kill for 10 min at 65°C, then cooled to 21°C. 

### Reading

Szymańska, Z. & Zylicz, M. (2009). Mathematical modeling of heat shock protein synthesis in response to temperature change. Journal of Theoretical Biology, 259, 562–569.

  - mathematical model of heat shock protein synthesis
  - Hsp70 binds heat shock factor (HSF) in steady state, but binds denatured proteins when present
  - when free of Hsp70, HSF binds heat shock elements (HSE) which are promoters of Hsp70
  - compare dynamics of heat shock, slow heating and short heat shock

