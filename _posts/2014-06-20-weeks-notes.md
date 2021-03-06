---
layout: posts
categories: 
  - ApGxL
  - MtGiraffe
title: Monday July 28 notes
tags: 
  - DGE
  - Medicago
  - giraffe
  - VCF
---

### ApGxL

Started DGE!

Pre-SPIA protocol done in Agnarsson lab. Washed all surfaces and lab tools with bleach. New tips, etc. 

4 samples to start. Stopped after SPIA protocol. Samples in -20°C. Took 2ul aliquot for qPCR. 


### Medicago

For MtGIRAFFE project, need to extract SNPs for giraffe gene. Started this a [few week's ago]({% post_url 2014-06-20-weeks-notes %}) but ran into problem with wrong SNPs recorded. Not surprising, this was a simple error due to missing a digit when specifying the SNP range: 677902-6783193 instead of 6779092-6783193. 

When corrected the SNP extraction

    bcftools query -H -r chr8:6779092-6783193 -f "%CHROM\t%POS[\t%TGT]\n" chr8-filtered-set-2014Apr15.bcf > Medtr8g_GIRAFFE.txt

gave 345 SNPs, all within correct range!

Can extract to VCF format with this command:

    bcftools view -f PASS -r chr8:6779092-6783193 -O v -o test.vcf chr8-filtered-set-2014Apr15.bcf


Next - infer haplotypes from SNP data. The major problem of bioinformatics - every program has it's own input. Some options and my success with them...

- [fastPHASE](http://stephenslab.uchicago.edu/software.html#fastphase). google-fu found script to convert [vcf2fastPHASE.pl](https://github.com/lstevison/vcf-conversion-tools). Tried to use script, but asks for "positions file"?
- [BEAGLE](http://faculty.washington.edu/browning/beagle/beagle.html) - has utility program [vcf2beagle.jar](http://faculty.washington.edu/browning/beagle_utilities/utilities.html) to convert VCF to BEAGLE format
- [MACH](http://www.sph.umich.edu/csg/abecasis/MACH/index.html)
 
