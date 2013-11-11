---
layout: posts
categories: ApTranscriptome
title: Meeting with VGN notes
tags:
  - Trinity
  - Trinotate
  - rGASP
---

### ApTranscriptome

Meeting with Sara and Mahesh (VGN) to discuss his transcriptome assembly results.

Mahesh ran Trinity to assemble transcriptome with all reads from both ant colonies (Ar and A22). Resulted in 126,172 transcripts. Then mapped reads to assembly and generated heatmap. 

<figure align="middle">
    <img src="{{ site.url }}/assets/img/ApTranscriptome_expression_heatmap.png" alt="expression heatmap" heigth="300" width="300">
    <figcaption> Heatmap of correlation of expression levels of samples from each of two colonies (Ar and A22) against composite transcriptome assembly </figcaption>
</figure>

Two patterns of note:

1) Gene expression groups primarily by ant colony (Ar and A22) indicating that differences among colonies are large enough that a unique transcript is assembly for each homolog. We are assuming that these colonies are fairly closely related and do not want independent contigs of each gene for each colony. We want a single transcriptome with one transcript per gene. Thus, in the figure we should a primary effect of temperature on gene expression, with less of an effect due to colony. 
2) Temperature samples (the -00 to -38 suffix) group together *with the exception of Ar-07 and A22-07* (circled in figure) that are found in opposite group. Parsimonius explanation for this pattern is that samples were mislabeled before sequencing. Damn. This also explains the global "dip" in expression that we noted in initial read-mapping [last week]({% post_url 2013-10-24-summarizing-transcriptome-assembly %}) as I generated the transcriptome with only A22 reads, and trying to map Ar reads to this assembly would result in reduced mapping and thus expression levels. 

Suggested solutions to these issues:

1) Use programs (CAP3 and [uclust](http://drive5.com/usearch/manual/uclust_algo.html)) that reduce redundancy (collapse similar contigs). Assume divergence is less than 10%, so require only 90% sequence similarity to cluster contigs. See Yang & Smith (2013) BMC Genomics paper. 
2) Conservative (and easy) solution is to *remove A**-07* samples from the assembly process. Can then perform expression analyses both including and without this sample and evaluate to what extent it influences results.

Also discussed annotation. Trinotate uses the SwissProt database which is very conservative in having only manually curated and reviewed genes. A quick search revealed that only 36 Solenopsis genes are even in this database, so this program will not map many 'ant' genes and we in fact do not see any. Decided to first run blastx against ant genomes, then for remaining unannotated genes use Trinotate. 


### Reading

Yamada, T., Letunic, I., Okuda, S., Kanehisa, M. & Bork, P. (2011). iPath2.0: interactive pathway explorer. Nucleic Acids Research, 39, W412–415.

**A set of two papers from the [RNA-seq Genome Annotation Assessment Project](http://www.gencodegenes.org/rgasp/)**. These papers seem to over-shadow the Alamancos paper I read Monday.

Engström, P.G., Steijger, T., Sipos, B., Grant, G.R., Kahles, A., The RGASP Consortium, Rätsch, G., Goldman, N., Hubbard, T.J., Harrow, J., Guigó, R. & Bertone, P. (2013). Systematic evaluation of spliced alignment programs for RNA-seq data. Nature Methods, advance online publication. 

  - evaluates programs for *mapping* real and simulated RNAseq data to human and mouse genome sequences 
  - STAR performs best, partly due to allowing mapping of truncated reads
  - Tophat2 better for spliced-reads
  - "all methods dispersed reads across too many genes: whereas reads from the first simulation should map to 16,554 Ensembl genes, all protocols reported primary alignments for more than 17,800 genes. This effect was largely due to the placement of reads at pseudogenes..."
  - differences in read mapping were reduced in transcript reconstruction using Cufflinks
  - on real data, 51% recall with 70% precision using Tophat or STAR for mapping

Steijger, T., Abril, J.F., Engström, P.G., Kokocinski, F., The RGASP Consortium, Hubbard, T.J., Guigó, R., Harrow, J. & Bertone, P. (2013). Assessment of transcript reconstruction methods for RNA-seq. Nature Methods, advance online publication.

  - evaluates programs for transcript reconstruction (Engstrom paper only used Cufflinks)
  - most programs recover 60-80% of exon sequence (sensitivity), but also a substantial proportion of transcripts assembled that are not in the reference exons (20% and up), though this depended on species
  - why isn't Trinity included in evaluation?
  - Transcript assembly performance:
    - "substantial reduction in sensitivity observed from gene to transcript level"
    - "at most 56-59% of spliced protein-coding transcripts for C. elegans, 43% for Drosophila and 21% for humans"
    - coverage >4x needed for assembly of transcripts
    - introns reduce assembly of transcripts
    - often missing exons within transcripts, also fail to link exons when all present
  - Quantification of expression
    - compared RPKM to empirical NanoString counts
    - highly variable; cufflinks did best with r=0.72 when using any isoform from locus
    - "Comparing NanoString coutns with RPKM values of the predominant isoform reported for each gene (irrespective of whether the targeted exon or junction wsa identified) improved correlation for most methods"
  - Key points for my work:
    - while assembly works well for genes, poor resolution of alternative transcripts 
    - improved quantification of expression when using predominant isoform 

