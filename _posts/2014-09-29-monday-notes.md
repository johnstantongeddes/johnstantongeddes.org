---
layout: posts
categories: 
  - ApGenome
title: DNA extraction for PacBio
tags: 
  - Phenol-Chloroform
  - DNA
---

### ApGenome

Attempt 3 to get genomic DNA for PacBio sequencing from Aphaenogaster.

Modified the ant phenol-chloroform DNA extraction protocol combined with the Thermo Scientific [Phenol/Chloroform Extraction and Ethanol Precipitation](http://www.thermoscientificbio.com/uploadedFiles/Resources/phenol-chloroform-extraction-ethanol-precipitation.pdf) protocol.

- Made STE buffer (0.1 M NaCl / 0.05 M Tris pH8 / 1mM EDTA)
  - for 100ml:
    - 10 ml 1M NaCl
    - 0.2 ml 0.5M EDTA
    - 84.8 ml H~2~O
  
- Collected about 50 ants (weight = 0.27 g) from Molly Bog colony JSG002
- Flash froze in liquid nitrogen
- Crushed ants with mortar and pestle (bleach sterilized)
- Mixed sample with STE + 0.5% SDS + 200ug/ml Proteinase K
  -for 10 ml:
    - 9.42 ml STE 
    - 0.5 ml SDS 10%
    - 82.98 ul Proteinase K (24.1 mg/ml)
- **NOTE:** the 10 ml digestino volume was **way** too much. I used this erroneously based on 'DNA extraction for spermathecae' protocol which listed ~3.8ml for 50 eggs. This measure was actually the volume to make, using only 50 ul per egg. I probably could have used only 1-2 ml of the mixture.
- Incubated overnight at 55°C


### R

Example of how to reproduce *old* R scripts: [http://blog.revolutionanalytics.com/2014/08/gran-and-switchr-cant-send-you-back-in-time-but-they-can-send-r-sort-of.html]

- [GRAN](https://github.com/gmbecker/gRAN)

Are these better than [packrat](http://rstudio.github.io/packrat/)

- packrat is for the future...stores packages at the time of your work
- GRAN is more multi-purpose...allows you to roll-back to any previous version of R packages


