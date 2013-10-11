---
layout: posts
categories: ApTranscriptome
title: Mapping reads to de novo assembly
tags:
  - transcriptome
  - TPM
  - BWA
  - oases
  - Bioconductor
---

### Climate-cascade meeting

Discussion of molecular methods for identifying loci experiencing spatially-divergenet selection:

	Keller, S.R., Levsen, N., Olson, M.S. & Tiffin, P. (2012). Local Adaptation in the Flowering-Time Gene Network of Balsam Poplar, Populus balsamifera L. Molecular Biology and Evolution, 29, 3143–3152.

Requires population-level genetic data, which we currently aren't planning to collect with ApGXL samples (only 2 colonies per site). After mentioning the possibility of using logistic regression, Sara and I independently thought of the following paper:

	Yang, W.-Y., Novembre, J., Eskin, E. & Halperin, E. (2012). A model-based approach for analysis of spatial structure in genetic data. Nature Genetics, 44, 725–733.

SPA software available [here](http://genetics.cs.ucla.edu/spa/)

### Transcriptome

[Yesterday]({% post_url 2013-08-23-transcriptome-simulation-2 %}) successfully mapped reads to known transcripts and recovering simulated expression levels, but mapping reads to oases assembled transcripts failed (all zero counts).

Had to learn some Bioconductor to work with fasta sequences

    library(Biostrings)
    fasta <- readDNAStringSet("file.fasta") # read fasta file
    names(fasta) # gives names of sequences
    width(fasta) # gives sequence length
    substring(fasta[1]), from=1, to=10) # shows substring of sequence
    writeXStringSet(fasta[1], file="out.fa", append=TRUE) # writes fasta sequence out

 
AHA! After spending the day working with BioConductor to reduce the oases transcripts to the single best match to the 'known' (a worthwhile excercise for evaluating quality of assembly, but worthless when working with real 'unknown' data) I found that the problem with mapping was that I had skipped steps to make BAM files for the oases transcripts! When I fixed this, reads mapped to transcripts:

Locus                                                     Start   Stop    Count
-------------------------------------------------------  ------- ------  -------
Locus_1_Transcript_1/10_Confidence_0.450_Length_1487	   0	  1487	   489
Locus_1_Transcript_2/10_Confidence_0.325_Length_1543	   0	  1543	   326
Locus_1_Transcript_3/10_Confidence_0.550_Length_1398	   0	  1398	   799
Locus_1_Transcript_4/10_Confidence_0.525_Length_1705	   0	  1705	   0
Locus_1_Transcript_5/10_Confidence_0.525_Length_1401	   0	  1401	   1778
Locus_1_Transcript_6/10_Confidence_0.450_Length_1669	   0	  1669	   3218

-----------------------------------------------------------

Now to compare with results of mapping reads to known transcripts!
