---
layout: posts
categories: 
  - ApTranscriptome
title: Friday ddRADseq debugging
tags: 
  - ddRADseq
  - expression
  - Sailfish
  - contaminants
---

### ddRADseq

Worked with SCH in lab to continue trouble-shooting ddRADseq protocol. 

1. To validate that digested samples contain DNA after purification, ran on gel
    - 1.5% low melt agarose gel for 1.5hrs at 120V
    - Loaded 4 ul of each sample (8 - 100 ng based on [previous]({% post_url 2014-04-23 ddRADseq-summary %}) data) with 1 ul orange gel loading dye

![Gel image]({{ site.url }}/assets/files/20140502-digested-DNA.jpg)

<br>

Note clear smears of DNA! Corresponds to [Bioanalyzer results of same samples]({% post_url 2014-04-23 ddRADseq-summary %})

DNA is present after digestion and purification. Indicates that DNA is lost during ligation, pooling or size selection.

2. To evaluate purification methods, pooled remaining digested DNA, ~ 80 ul. Split into 2 35 ul samples.
    - Sample 1: MinElute column precipitation. Eluted in 20 ul EB
    - Sample 2: AMPure bead purification on plate. Eluted in 40 ul EB

Quantified concentration with Qubit.

Sample        Initial (ng/ul)       Total (ng)         Final (ng/ul)     Final Total (ng)      Recovery
----------   ----------------     --------------     -----------------  ------------------   ------------
MinElute          96.3                3370.5               131                  2620             78%
AMPure            96.3                3370.5                42                  1680             50%

<br>

In this case, the MinElute purification is clearly superior. 

3. After running gel, excised band 250 - 300 bp from each sample to test gel purification using QIAquick gel purification kit, eluting in 12 ul Buffer EB.

Table gives initial mass of DNA loaded in 4 ul, the maximum expected DNA to be recovered within the 250 - 300 bp using estimate of 10% of total fragments in this window from Bioanalyzer, and the acutal mass recovered. 

Sample        Initial DNA (ng)   Max. expected (ng)     Recovered (ng)       
--------     -----------------  --------------------  -------------------
T1-200           43.6                  4.3                  0.82
T2-200           98.0                  9.8                  1.32
T3-200           20.8                  2.1                  0
T4-200           40.8                  4.1                  0.72
T5-200           23.3                  2.3                  0

<br>




### ApTranscriptome

Response from the Sailfish [google user's group](https://groups.google.com/forum/?utm_medium=email&utm_source=footer#!msg/sailfish-users/bCzPIg3fTps/8gYOfjZlhiEJ) in response to my query:

> I realize this is a bit of a general question but as I'm using sailfish I thought I'd start here...
> 
> I have a de novo transcriptome for an ant species of about 100k transcripts assembled by Trinity. I've quantified expression using Sailfish and performed some analyses to identify genes with significant expression patterns.
> 
> Then, I became aware of the program DeconSeq to remove contaminants. I ran the program and removed ~5k of my transcripts, and spot-checking shows they all BLAST to bacteria or human. All good so far. Then, I re-ran Sailfish on the "cleaned" transcriptome. My naive expectation was that this should barely effect the results - the reads that mapped to the "contaminants" shouldn't map at all. Instead, I find substantial changes, with about twice as many genes having significant expression patterns. I checked the unmapped ratio and it stays the same between mappings to the two transcriptome files.
> 
> So - my conundrum is how to deal with mapping reads to known contaminants?
> 
> Do I
> 
> a) Map reads to the complete transcriptome, including contaminants, and then remove the known contaminants. In this case, it seems that I risk incorrectly mapping reads to the contaminants and losing information (false negatives), analogous to a Type I (producer's) error.
> 
> b) Map reads to the "cleaned" transcriptome. This seems more analogous to a Type II (consumer's) error where I risk finding significant changes in expression that are due to incorrectly mapping 'contaminant' reads to true transcripts (false positives).
> 
> I was wondering if any insight could be gleaned from knowledge of how Sailfish performs mapping (which I fully admit not to understand terribly well) to suggest which is a more likely problem?



Response 1: 

> I strongly favor your choice a:
> 
> a) Map reads to the complete transcriptome, including contaminants, and then remove the known contaminants. In this case, it seems that I risk incorrectly mapping reads to the contaminants and losing information (false negatives), analogous to a Type I (producer's) error.
> 
> Trinity has already assembled your reads into contigs. Take advantage of that. Sailfish will assign reads best if the transcriptome is more complete (without regard to species of origin; it doesn't know about the species of origin).  The main cause of false positives is when the true source of the k-mers involved is not in the index. 
> 
> Presumably, you used all of the data for your Trinity run.  Now, you're asking a different question, about differential expression. Giving Sailfish all of the information you have (your complete transcriptome) will give you the best result from the EM algorithm.  The EM algorithm will do better when it knows about all of the possible sources -- I can't see any reason why it would map reads to the contaminants if has a better choice.


Response 2:

> Steve makes good points here, and I think his proposed solution may currently be the best way to go (if there are contaminants in your transcriptome, then that's where the reads should be assigned).  If you have a particular desire / need to remove these contaminants from your target transcript set, another potential solution I can think of (though it would require a little bit more work) would be to actually align (e.g. using BWA / Bowtie) the raw reads to just the contaminant transcripts.  Since there are a relatively small number of these in your experiment, this should still be relatively fast (much faster than mapping to the entire transcriptome).  These reads could then be removed from the read files, and the estimation done on the cleaned transcriptome and filtered reads.  I would anticipate that this approach and your option a may yield similar results, but it's difficult to say for certain.


A similar suggestion to map reads to contaminants and remove them from the fastq files before quantifying expression was made on [Biostars](https://www.biostars.org/p/99574/)


**CONCLUSION**

I should continue using my *first* results based on mapping reads to the entire transcriptome including known contaminants, and then remove the known contaminants from downstream analysis.
