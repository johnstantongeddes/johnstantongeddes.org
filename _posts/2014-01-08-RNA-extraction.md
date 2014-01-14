---
layout: posts
categories: ApGXL
title: Wednesday Jan 8
tags:
  - blast
  - RNA extraction
---

### ApGXL 

RNA extractions for Phytotron samples

-------------------------------------------------------
Sample      RNAzol     RNAzol     RNeasy      RNeasy
            ng/ul      260/280     ng/ul      260/280
-------    -------    ---------  --------    -----------
04-A HS     23.06       1.69       17.12       1.54
04-B HS     12.89       1.81       11.27       1.42  
05-B HS     63.73       1.66       14.48       1.82
06-A HS     80.00       1.69       11.19       1.46
06-B HS     31.24       1.70        5.68       1.15
08-A HS     47.97       1.65        8.32       1.55
09-A HS     22.68       1.60        5.31       1.11
10-A HS     42.40       1.59        9.11       1.35
10-B HS     13.10       1.61	   15.18       1.34
12-A HS     38.57       1.69       14.38       1.52
12-D HS     21.5        1.57       14.85       1.33
13-A HS     17.44		1.63	    9.24       1.24
13-B HS     10.58       1.49        9.34       1.30
16-A HS      6.31       1.57        9.76       1.45
16-B HS     15.26       1.59        5.55       1.00
21-A HS     19.00       1.64        8.97       1.29
21-B HS     16.85       1.58        4.83       1.21
22-A HS     13.55       1.38        5.73       1.19
22-B HS     22.9        1.67        11.35      1.35
22-C HS     66.41       1.66        21.77      1.62
---------------------------------------------------------

Concentration and quality okay after RNAzol, but both decreased considerably after RNeasy.
Disappointing. 


**Phone call with NuGen Tech Support**

*With*: Ashesh
*About*: Protocol for DGE and NGS library prep

Ovation DGE:

- input 10-100ng RNA
- okay to use [MRC polyacryl carrier](http://www.mrcgene.com/precipcarrier.htm) in RNA extraction
- normalize input RNA, at 100 ng RNA if possible, or max available for smallest concentration
- yields average 3 ug cDNA
- quantify DGE w/ Qubit
- purify with QIAquick PCR purification
- Bioanalyzer on a few samples after purification to check for problems before proceeding to library prep
- negative control not possible due to chimerica DNA/RNA amplification


Rapid DR multiplex NGS library prep:

- with SPIA-generated input cDNA use 500ng to 1 ug, preferably 1 ug input
- input cDNA needs to be fragmented!
- perform some controls with fragmented DNA - check Bioanalyzer traces
- 16 samples at a time. if less than 16, follow [Low-plex Pooling Guidelines](http://www.nugeninc.com/nugen/index.cfm/linkservid/9616D418-7D46-439D-B1D72360E2D128B6/showMeta/0/)
- ethanol concentration important - make fresh daily
- run Kappa qPCR to determine library size 



