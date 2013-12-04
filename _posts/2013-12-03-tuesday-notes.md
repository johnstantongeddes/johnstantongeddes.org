---
layout: posts
categories: ApTranscriptome
title: Tuesday notes
tags:
  - shell
  - transcriptome
  - ddRADseq
---

Cool [website](http://explainshell.com/) to explain shell commands.

### ApTranscriptome

Both *full* and *diginorm* assembly methods result in significant clustering by colony. For comparative analysis of colonies, need to identify orthologs. 

Best approach appears to be reciprocal best hits (RBH) by BLAST.



### RADseq

*in silico* [method](http://seqanswers.com/forums/showthread.php?t=35110) to determine number of cut sites for double digest RADseq 

### Reading

Bonhomme, M., André, O., Badis, Y., Ronfort, J., Burgarella, C., Chantret, N., Prosperi, J.-M., Briskine, R., Mudge, J., Debéllé, F., Navier, H., Miteul, H., Hajri, A., Baranger, A., Tiffin, P., Dumas, B., Pilet-Nayel, M.-L., Young, N.D. & Jacquet, C. (2013). High-density genome-wide association mapping implicates an F-box encoding gene in Medicago truncatula resistance to Aphanomyces euteiches. New Phytologist, doi: 10.1111/nph.12611.

  - First GWAS citation to Medicago HapMap paper! 
  - Nice use to fine-map causative SNPs underlying disease resistance.

Hansen, T.F. (2013). Why Epistasis Is Important for Selection and Adaptation. Evolution, 67, 3501–3511.

Jones, M.R., Forester, B.R., Teufel, A.I., Adams, R.V., Anstett, D.N., Goodrich, B.A., Landguth, E.L., Joost, S. & Manel, S. (2013). Integrating Landscape Genomics and Spatially Explicit Approaches to Detect Loci Under Selection in Clinal Populations. Evolution, 67, 3455–3468.

  - similar to De Mita et al (2013) paper, uses simulations to examine performance of methods to detect loci under selection
  - focuses on "individual-based landscape genomics approaches to detect a locus under selection"
  - compares generalized linear models (GLMs), general linear mixed models (GLMMs), general additive mixed models (GAMMs) and classification and regression trees (CARTs) using simulated data
  - regression-based and two popgen methods (DFDIST, BayeScan) on empirical data 
  - simulation results: 
    * no methods detect selected loci under weak selection
    * GLM best under moderate selection; GLM, GLMM and CART equivalent under strong selection
    * CART lowest false positive under strong selection
  - empirical results
    * GLM detected most outlier loci among regression methods. 
    * DFDIST found most, prone to false positives. BayeScan identified no outliers
    * cline in summer precipitation matched by candidate loci (Fig 4).

