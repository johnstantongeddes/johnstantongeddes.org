---
layout: posts
categories: 
  - ecological genetics
title: wednesday
tags:
  - aphaenogaster
  - pandoc
  - transcriptomics
  - simulations
---

## Research

Continuing working on permits for Aphaenogaster collection. Need to submit separate permit to PA State Forests (even though in same Dept Conservation and Natural Resources). 

For Maine, potential collection sites

- Sebago Lake State Park
- Chesterville Wildlife Management Area
- Mt. Blue State Park
- Lily Bay State Park
- Bangor City Forest
- Dow Pines Recreation Area
- Debsconeag Lakes Wilderness Area
- Mattawamkeag Wilderness County Park
- Aroostook State Park
- Aroostook National Wildlife Area
	- as this site is U.S. Fish and Wildlife, would require a seperate permit.called number listed online and got contact information for Steve Agius (steve_agius@fws.gov) to send permit application to for special use permit

Sent follow-up emails to state agencies I hadn't heard from. Received response from Tom Charles in Maine with special use permit form. Filled it out and returned. 


### Transcriptomics

While waiting for sequence data, should I simulate analysis pipeline? Based on Vijay (2013), mapping to a species up to 15% diverged may give higher gene recovery than de novo assembly. Based on an ant phylogeny (this one just happened to land in my mailbox (Moreau 2013)), the closest sequenced ant genomes to Aphaenogaster are Solenopsis and then Pogonomyrmex.

To do

1) evaluate sequence divergence between Aphaenogaster, Solenopsis and Pogonomyrmex
2) download genome data from both species
3) simulate Illumina reads for Pogo using [DWGSIM](http://sourceforge.net/apps/mediawiki/dnaa/index.php?title=Whole_Genome_Simulation). 
4) map Pogo reads to Solenopsis using STAMPY and then CUFFLINKS as described in Vijay (2013)
5) de novo assembly using Trinity.
6) compare results...assume that with true Aphaeno transcriptome data that mapping approach will work even better as more closely related to Solenopsis than Pogo is, so de novo approach needs to have a considerable improvement to be the favored approach.


For (1)...very simplistically, I went to BLAST and searched for Aphaenogaster. Found [37 matches for Aphaenogaster rudis](http://www.ncbi.nlm.nih.gov/nuccore/?term=aphaenogaster+rudis). Took the longest one, 'target of rapamycin (tor) mRNA, partial cds' and got FASTA 
 
~~~~~~~
>gi|260408183|gb|GQ892187.1| Aphaenogaster rudis target of rapamycin (tor) mRNA, partial cds
TAGCCGAGTTTATGGAACATTGCGACAAGGGTCCCCTGCCATTGGACAACAAGATTCTCGGAGATACGGC
GATGCACTGTCGTGCATACGCCAAGGCGTTGCACTATAAAGAGGACGAGTTCCACAAGAGCAGAAACAGC
AGCGTGTTCGAGTCTCTGATCTCCATCAATAATAGACTTCAACAGAAGGAGGCGGCCGAGGGCTTGCTGG
AGTACGTGATGAATCACAATCAGCAAGATCTCAAGGTCCAGATACGTCGGTACGAGAAGCTTCACAACTG
GGACAAAGCGTTGCAGTTGTACCAGGAACGTCTGGACAGCGATGCCACGGATGTGGAATCCACTTTAGGG
GAGATGCGTTGTATGGAAGCTCTCGGCGAGTGGGGACAATTGCACGAGGTCGCTACGAAACAATGGACGA
ATCAATGTGACGATATCAAGCAAAGAATGTCGAGGATGGCAGCAGCTGCGGCATGGGGTTTGGGTCAGTG
GGAAAGTATGCAGAAGTACGTTTCGTTGATACCGAAGGACACTCAAGATGGAGCGTTTTACAGAGCGGTA
CTGGCGATTCATGACGAGCAGTACAACGTCGCACATCAACTCATCGACAGCGCCAGAGATTTGTTGGATA
CCGAGCTGACCGCTATGGCTGGCGAGAGTTACCAGCGGGCGTACAATGCCATGGTGGAAGTGCAGAAGTT
GGCAGAATTAGAAGAAGTGATTCAATTCAAATTAGTGCCCGAACGTAGAGCGGCTATTAAGGCCATGTGG
TGGGAGAGGCTTCAAGGTGGACAGAAGATCGTAGAAGACTGGCAGAAAATCATACAGGTGCACACACTGG
TGGTTTCGCCGCAGGACGATATGTATACATGGCTCAAGTATGCCAGTCTGTGCCGGAAGAGCGGTAGTTT
GATGCTATGTCACAAGACATTGGTGATGTTGATGGGCACGGATCCATCCTTAACTGCGGATCAGCCGCTG
CCGACTACTCATCCCCAGGTGACCTTTGCTTATTGCAAGCACCTATGGGTCGCGAATAAACGCGAAGAGG
CTTACGGTCAGCTGCAGCGATTCGTGCAGACTTACTTGCAGCCAACAACGACGGCGATAATAAATCAAGA
GGACGAGAAGCAGCACGAGAGCAAAAAGAGATTGCTTGCCAGATGTTACCTCAAGCTCGGCGAGTGGCTG
GAGGCCTTGCAGGGTATAAACGAGCATTCTATTCCCGCAGTACTGTCTTACTATGCCGCGGCGACGGAGC
ACGATCCTACGTGGTACAAAGCTTGGCACGCCTTTGCCTATACCAATTACGAGACCGTTTTGTTTTACAA
GCATCAGCAAGGTAGCGATTCTGCGCCCGCGGAGGTTGCACCGGGCAACGGTGCGCGCAGTAATATCTCC
AGCTCGCAATATATATCTCAATTTACGGTCCCAGCTGTGGAGGGATTTTTCAGATCTATTAACTTGTCGG
ACGGCAACTCCTTACAAGACACTCTCCGTCTACTCACACTCTGGTTTGATTACGGCCAGTGGCCGGAGGT
ATATGACGCTGTCGTCGGGGGTATAAGATTAATAGAGATAAACACTTGGCTACAAGTTATACCGCA
~~~~~

blastp this sequence against Solenopsis and Pogo in antgenomes blast

Top hat:

> lcl|Si_gnF.scaffold01722  length=1169549 [Genome Browser]
> Length=1169549
>
> Score = 2071 bits (2296),  Expect = 0.0
> Identities = 1423/1606 (89%), Gaps = 0/1606 (0%)
> Strand=Plus/Plus

Fourth hit is to a "Tor-RA transcript" in Pogo! So probably the same in Solenopsis but not annotated

> lcl|Pbar_Tor-RA transcript offset:0 AED:1 QI:0|0|0|0|0|0|5|0|2470 
> Length=7413
>
> Score = 1905 bits (2112),  Expect = 0.0
> Identities = 1387/1607 (87%), Gaps = 3/1607 (0%)
> Strand=Plus/Plus

The bounds of sequence divergence are 21-23% here...between the 15 and 30% simulations of Vijay so unclear if a mapping approach will be better than de novo assembly. Probably should repeat this for multiple genes to get range of estimates.




- Vijay, N., Poelstra, J. W., Künstner, A., & Wolf, J. B. W. (2013). Challenges and strategies in transcriptome assembly and differential gene expression quantification. A comprehensive in silico assessment of RNA-seq experiments. Molecular Ecology, 22(3), 620–634. doi:10.1111/mec.12014
- Moreau, C. S., & Bell, C. D. (2013). Testing the Museum Versus Cradle Tropical Biological Diversity Hypothesis: Phylogeny, Diversification, and Ancestral Biogeographic Range Evolution of the Ants. Evolution, n/a–n/a. doi:10.1111/evo.12105

## Lab notebook

Test of showing R code in lab notebook

```r
x <- seq(1:10)
y <- x^2
summary(lm(y~x))
plot(x,y)
```

To actually run this R code and generate results, simply run through `knitr`


## 

When converting pandoc to pdf, the default latex settings gave HUGE margins. [stackoverflow](http://stackoverflow.com/questions/13515893/set-margin-size-when-converting-from-markdown-to-pdf-with-pandoc) gave the answer:

    pandoc -V geometry:margin=1in -o output.pdf input.md

## Reading

- Ormeño-Orrillo, E., Servín-Garcidueñas, L. E., Imperial, J., Rey, L., Ruiz-Argueso, T., & Martinez-Romero, E. (n.d.). Phylogenetic evidence of the transfer of nodZ and nolL genes from Bradyrhizobium to other rhizobia. Molecular Phylogenetics and Evolution. doi:10.1016/j.ympev.2013.03.003

- Gelman, A. (2013). P Values and Statistical Practice. Epidemiology, 24(1), 69–72. doi:10.1097/EDE.0b013e31827886f7








