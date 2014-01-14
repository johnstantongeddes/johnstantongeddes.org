---
layout: posts
categories: ApTranscriptome ApGXL
title: Tuesday Jan 7
tags:
  - blast
  - RNA extraction
---

### ApTranscriptome

Based on recommendation, used [FastAnnotator](http://fastannotator.cgu.edu.tw/index.php) for annotation - GREAT web resource!

Results for [AphVT](http://fastannotator.cgu.edu.tw/job.php?jobid=13890970425392#page=basicinfo) assembly. 


**Meeting with Mahesh**

Discussed transcriptome assembly and analysis. 

Advocates using full (not digitally-normalized) assembly with all reads from both colonies

1. Using full assembly, identify thermally-responsive genes for *both* colonies combined
2. Map reads for *each colony individually* to subset of thermally-responsive genes
  - prediction: clustering by temperature, not by colony ID


### ApGXL

RNA extraction with 3 samples from ApTranscriptome. Trial run and will use these to evaluate DGE against full RNAseq.

Took about 5 hours for complete protocol. 

Total yield 140-600 ng per sample.
Well above minimum of 10 ng for DGE kit.


### Other

Comments to Yun on Medicago GWAS manuscript

Set up `blastn` job for Chagas on mason cluster
