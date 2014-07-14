---
layout: posts
categories: 
  - ApTranscriptome
  - MtGiraffe
title: June 16 - 20 notes
tags: 
  - GIRAFFE
  - Medicago
  - Aphaenogaster
---

## 2014-06-16

* Meet with NG to discuss Centennial ms
* Working on Evolution presentation, thermal reactionome analysis



## 2014-06-17

### MtGiraffe

For Hatch project with Jeanne Harris, need to extract all SNPs from the GIRAFFE gene. GIRAFFE was recently annotated in Mt4.0 - [on JBrowse here](http://medicago.jcvi.org/medicago/jbrowse/?data=data%2Fjson%2Fmedicago&loc=chr8%3A6779092..6783193&tracks=gene_models%2Cest2genome%2Cprotein2genome&highlight=).

On [Medicago HapMap site](http://www.medicagohapmap.org/downloads/mt40), found that SNPs have been called for Mt4.0. Joseph's [README](http://www.medicagohapmap.org/downloads/Mt40/Mt4.0_HapMap_README.pdf) provided necessary information to download appropriate files (chr8-filtered-set-2014Apr15.bcf, chr8-filtered-set-2014Apr15.bcf.csi) and then use `bcftools` to extract SNPs

~~~
Export a region from BCF to tab-delimited file 
# You must have also downloaded or regenerated the .csi file to perform these types of operations 
# Replace REGION below as appropriate, some examples are included below: 
# chr5 
# chr5:104932­-107932 
bcftools query ­-H -­r REGION -­f \ 
"%CHROM\t%POS[\t%TGT]\n" \ 
INPUT_FILE_NAME.bcf > OUTPUT_FILE_NAME.txt 
~~~

From [JBrowse](http://medicago.jcvi.org/medicago/jbrowse/?data=data%2Fjson%2Fmedicago&loc=chr8%3A6779092..6783193&tracks=gene_models%2Cest2genome%2Cprotein2genome&highlight=) the SNP positions I want to extract are `chr8:6779092..6783193`.

    bcftools query -H -r chr8:677902-6783193 -f "%CHROM\t%POS[\t%TGT]\n" chr8-filtered-set-2014Apr15.bcf > Medtr8g019320_SNPS.txt

gives an output file with 542,461 SNPs!!! But odd that the SNP positions repored in the output file are not exactly in the specified range:

~~~
jstantongeddes@AntLab:~/research/Mt_giraffe/data$ head Medtr8g019320_SNPS.txt | cut -f 1-3
# [1]CHROM	[2]POS	[3]HM001:GT
chr8	687854	T/T
chr8	687856	A/A
chr8	687857	G/G
chr8	687858	G/G
chr8	687862	C/C
chr8	687869	T/T
chr8	687872	G/G
chr8	687877	G/G
chr8	687884	A/A
jstantongeddes@AntLab:~/research/Mt_giraffe/data$ tail Medtr8g019320_SNPS.txt | cut -f 1-3
chr8	6783102	A/A
chr8	6783103	G/G
chr8	6783105	G/G
chr8	6783110	A/A
chr8	6783147	T/T
chr8	6783156	G/G
chr8	6783158	G/G
chr8	6783166	C/C
chr8	6783170	A/A
chr8	6783172	T/T
~~~

and appear to be in reverse order?



### ApTranscriptome

Finalizing topGO analysis for presentation/manuscript


## 2014-06-18

Working on presentation for Evolution...


## 2014-06-19

More results for presentation. *A. picea* has 7 heat shock proteins that are positively regulated, while *A. carolinensis* has only 3!

> hsp_responsive
                    Transcript                                                                        best.hit.to.nr A22.type      Ar.type
1:  15115|*|comp132715_c0_seq1                                    gi|194716766|gb|ACF93232.1| heat shock protein 90   Bimodal         High
2:   1656|*|comp147700_c0_seq1                      gi|332030522|gb|EGI70210.1| Heat shock 70 kDa protein cognate 3       Low Intermediate
3:  20675|*|comp147923_c0_seq1 gi|340729370|ref|XP_003402977.1| PREDICTED: heat shock protein beta-1-like isoform 2   Bimodal      Bimodal
4:   3269|*|comp141800_c0_seq1                      gi|332021988|gb|EGI62314.1| Heat shock 70 kDa protein cognate 4      High         High
5:   3995|*|comp145243_c0_seq1                      gi|307211659|gb|EFN87680.1| Heat shock 70 kDa protein cognate 5       Low Intermediate
6: 51985|*|comp1012776_c0_seq1                                    gi|227018528|gb|ACP18866.1| heat shock protein 30      High      NotResp
7:   9316|*|comp147545_c4_seq2                      gi|332020093|gb|EGI60539.1| Heat shock factor-binding protein 1       Low Intermediate

Similarly, if I look at all genes within the "response to stress" GO category (GO0006950), 
*A. picea* has 31 genes, while *A. carolinensis* has only 25.

> table(GO0006950.responsive$A22.type)

     Bimodal         High Intermediate          Low      NotResp 
           2            8            3           21            3 
> table(GO0006950.responsive$Ar.type)

     Bimodal         High Intermediate          Low      NotResp 
           4            8            8           13            4 



## 2014-06-20

Off to Evolution!!!




