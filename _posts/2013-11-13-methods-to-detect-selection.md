---
layout: posts
categories: Ecological Genetics
title: Thoughts on methods to detect selection along environmental gradients
tags:
  - selection
  - logistic regression
  - GWA
---

De Mita et al. (2013) evaluate eight methods (3 correlation, 5 differentiation-based) to detect signatures of selection in sequence data. 

A broad conclusion (with many caveats) is that correlation-based approaches have greatest power, but are prone to false positives if populations have isolation-by-distance (e.g. stepping-stone or hierarchical) population structure, as is likely along environmental gradients.

The logistic-regression approach (Joost et al 2007) is appealing as it can work directly on sequence data from a single individual per population. More samples per population actually increase the false positive rate.  

The logistic regression method (Joost) does this:

SNP ~ Environment

where the slope is $\beta = \frac{Cov(x,y)}{Var(x)}$. A second model using only the intercept is also fit, and a log-likelihood test is used to estimate significance of the model.

An alternative approach (Fourner-Level 2011) is to use a GenomeWide Association (GWA) analysis which switches the response and predictor:

Environment ~ SNP

so the slope is $\beta = \frac{Cov(x,y)}{Var(y)}$ and the *P*-value for the SNP term is used directly for significance.

These two models will only be equal if $Var(x) == Var(y)$ (nicely demonstrated on [crossvalidated](http://stats.stackexchange.com/questions/22718/what-is-the-difference-between-linear-regression-on-y-with-x-and-x-with-y)). 

For a biallelic SNP, the maximum variance possible is 0.25, when mean allele frequency is 0.5. Variance in the environmental terms is almost certainly greater. Thus, the GWA method is more conservative as the slope $\beta$ will be biased downward. 

Additionally, population-structure can be readily implemented in a GWA approach using EMMAX (Kang et al. 2010) which should further control for false positives. It should be possible to add this to the logistic regression approach (see [here](http://www.ats.ucla.edu/stat/r/dae/melogit.htm) for example of mixed effects logistic regression) but would need to be optimized for computational efficiency. 

#### References

De Mita, S., Thuillet, A.-C., Gay, L., Ahmadi, N., Manel, S., Ronfort, J. & Vigouroux, Y. (2013). Detecting selection along environmental gradients: analysis of eight methods and their effectiveness for outbreeding and selfing populations. Molecular Ecology, 22, 1383–1399.

Fournier-Level, A., Korte, A., Cooper, M.D., Nordborg, M., Schmitt, J. & Wilczek, A.M. (2011). A Map of Local Adaptation in Arabidopsis thaliana. Science, 334, 86–89. Retrieved November 13, 2013, 

Joost, S., Bonin, A., Bruford, M.W., Després, L., Conord, C., Erhardt, G. & Taberlet, P. (2007). A spatial analysis method (SAM) to detect candidate loci for selection: towards a landscape genomics approach to adaptation. Molecular Ecology, 16, 3955–3969.

Kang, H.M., Sul, J.H., Service, S.K., Zaitlen, N. a, Kong, S.-Y., Freimer, N.B., Sabatti, C. & Eskin, E. (2010). Variance component model to account for sample structure in genome-wide association studies. Nature Genetics, 42, 348–54.

