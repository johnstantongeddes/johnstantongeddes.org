---
layout: posts
categories: ApTranscriptome
title: Week Notes 9-13 September
tags:
  - Aphaenogaster
  - transcriptome 
---

## 2013-09-09

Revisions to stats commentary...

Partial regression plots - use avPlot() in car package.

Line is a simple linear regression of residuals against residuals (as explained here)[https://stat.ethz.ch/pipermail/r-help/2007-February/125791.html]


## 2013-09-11

[Upgrading to Jekyll 1.0](http://jekyllrb.com/docs/upgrading/)

Had to upgrade [jekyll-pandoc plugin](https://github.com/dsanson/jekyll-pandoc-plugin) for pandoc to work.

### Cool

Website for journal trolling: http://www.biosemantics.org/jane/

### ApTranscriptome

Editing scripts for transcriptome assembly using mason cluster. Standard no-frills velvet-oases assembly for comparison with Trinity and assembly using digital normalization

### Computing

Installed [raxML](https://github.com/stamatak/standard-RAxML) on antlab.



## 2013-09-12

Edits to stats commentary

Helms-Cahan Lab meeting on how to make maps in R using [Molecular Ecologist blog post](http://www.molecularecologist.com/2012/09/making-maps-with-r/)

### ApTranscriptome

Running standard velvet assembly (no diginorm or merging reads) on mason where memory is not limiting.

Cloned github repository and including new (modified) scripts for full transcriptome assembly.

Full details on running jobs on mason [here](https://www.xsede.org/web/xup/iu-mason#running). I ran 

     qsub -l nodes=1:ppn=4,vmem=16gb -l walltime=06:00:00 -m e script

to specifify 1 node, 4 processors, 6 hours walltime and `-m e` to have job summary mailed when job terminates.

### Burak seminar: Reproducibility in Science

Jim Berger

'a statistician being grumpy' and some suggestions for solving problems with Bayesian statistics

- Evidence for lack of reproducibility
  * Bayer Healthcare less than 1/4 of published research replicated
  * Phase II drug trials success rates falling (Arrowsmith 2011)
- Reasons for lack of reproducibility 
  * Publication bias (Ioannides)
  * Experimental bias (Particle Data Group)
  * rewards for positive results
  * statistical biases and errors
    - Reinhart-Rogoff theory due to error in Excel spreadsheet
  * incorrect use of P-values
  * failure to adjust for multiplicities
- P-values
  * doesn't like, wants to see replaced with Bayesian
  * Bayesian example
    - Two drugs (Alvac and Aidsvax) showed no effect in isolation. Tried in combination
    - 74 HIV cases in 8198 placebo
    - 51 HIV cases in ~5000 treatment
    - P-value = 0.02
    - Bayesian analysis
      - Posterior odds of H1 to H0
      - calculate Bayes factor...4 to 1 odds that treatment reduces infection compared to placebo
    - Robust Bayesian theory (Sellke, Bayarri and Berger 2001 Am. Stat)
      - P-value of 0.05 comparable to odds of 0.409; 2:1 odds in favor of alternative
      - formula {{ -e p log(p) }}
    - Ioannides 2008 Am J. Epidemiol.
- Bayesian approach to multiple testing
  * GWAS
  * Bayes argument for cutoff
    - pre-experimental odds of true positive to false position
      = prior odds X ((1-Beta)/alpha)
    - chose prior odds of 10:1... 1/100,000
- "Setting the default to reproducible research" ICERM
  
  
## 2013-09-13

Climate Cascade Meeting - ecological stoichiometry and Aphaenogaster

Received shipment of ApGXL ants from Clint:

Colony      Status
--------   --------
01-A         alive
01-B         alive
01-C         alive
02-B         alive
04-A	     dead
05-B         dead
05-D         alive
06-B         alive
08-A         alive
09-A         alive
10-A         alive
10-B         alive
12-A         alive
12-D         alive
13-A         alive
13-B         alive
16-A         alive
16-B         dead
17-C         alive
19-A         alive
20-D         alive
21-A         alive
21-B         alive
22-A         alive
22-B         alive
22-C         alive
24-A         alive
24-B         alive


### ApAdaPt

Meeting with undergrad about research project involving DNA extraction
