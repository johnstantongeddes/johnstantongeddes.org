---
layout: posts
categories: ApGenome
title: Friday notes
tags:
  - Genomic-tip
  - DNA extraction
---

### ApGenome

Sara suggested that I wasn't observing a pellet in the 15ml glass centrifuge tubes because small amount of DNA spread thinly across bottom. To confirm this and visually observe that yesterday's ATL-extracted sample did have DNA, I precipatated the 200ul DNA elution with 300ul ethanol, and added 2ul glycogen to co-precipicate. Centrigured 10k rpm for 4 minutes - observed pellet! 

Key point of the last week of lab work: Buffer ATL needed for cell lysis during homogenization of ant tissue for DNA purification! The Buffer G2 provided in the Genomic-tip kit *is not* and adequate substitute.

Drafted Genomic-tip DNA extraction protocol for ants separately in [next post]({% post_url 2013-11-08-Genomic-tip-DNA-extraction-protocol %})

### R

Use [colorbrewer2](http://colorbrewer2.org/) to choose colors for figures and presentations.

### Reading

Hughes, J.F., Skaletsky, H., Bellott, D.W., Chowdhary, B.P., Warren, W.C., Worley, K.C., Wilson, R.K., Gibbs, R.A. & Page, D.C. (2013). No bull: Upholding community standards in public sharing of biological datasets. Proceedings of the National Academy of Sciences, 201315122.

  - bad news for pre-publication of data. authors get "scooped", but do get the final say with this letters

Wei, Q., Shen, Y., Chen, X., Shifman, Y. & Ellis, R.E. (2013). Rapid creation of forward-genetics tools for C. briggsae using TALENs: lessons for non-model organisms. Molecular Biology and Evolution, mst213.

  - "However, each TALEN requires 15-20 repeat units to bind a unique target, so we adapted golden gate shuffling to streamline the process of making custom TALENs for nematodes. Furthermore, new mutations can be difficult to study unless other genetic resources are available, so we used information from a set of C. elegans null mutations to identify and target genes needed to create markers, balancers and tools for C. briggsae. This approach could be adapted to develop many other species as genetic model organisms."

Lenski, R.E., Ofria, C., Pennock, R.T. & Adami, C. (2003). The evolutionary origin of complex features. Nature, 423, 139–144.

  - cool paper using digital evolution to examine origin of complexity
  - great for teaching using this [example](http://nbviewer.ipython.org/urls/raw.github.com/beacon-center/2013-intro-computational-science/master/notebooks/hw6-The%2520evolutionary%2520origin%2520of%2520complex%2520features.ipynb)

Yang, Y. & Smith, S.A. (2013). Optimizing de novo assembly of short-read RNA-seq data for phylogenomics. BMC Genomics, 14, 328. 

  - goal of paper is to evaluate use of RNAseq to generate on representative transcript of each gene for phylogenetic analysis
  - de novo assembly results in redundant transcripts that are chimeras of reads
  - methods to remove redundant and chimeric transcripts:
    - filtering transcripts with cap3 and CD-HIT 
    - post-assembly removal of chimeric transcripts by blastx against known protein sequences
  - chimeras and redundancy persisted after using cap3 
  - Trinity assembly, keeping only the highest covered transcript (pickH), combined with cap3 and blastx produced cleanest, least redundant assembly
  - NOTE: given problems with transcriptome assembly (rGASP; Steijger et al. 2013 Nature Methods) it seems that most downstream analyses using *de novo* transcriptome assembly would benefit from this stringent approach to a single transcript for each gene

  
### Things

On Nature blogs, [How to write a cover letter](http://blogs.nature.com/methagora/2013/09/how-to-write-a-cover-letter.html)

**Do**
  
  - brief, largely non-technical summary of the method
  - put the work in context
  - suggest referees
  - related work from your group under consideration or in press elsewhere
  - mention any unusual circumstances
  - mention if you have previously discussed the work with an editor

**Don't**

  - Don’t simply reiterate that you have submitted a paper to us and/or copy and paste the title and abstract of the paper
  - don't go on for pages, use jargon, overhype, assume reputation will sway editor


