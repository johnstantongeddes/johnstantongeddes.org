---
layout: posts
category: ApTranscriptome
title: Wednesday 21 August 
tags:
  - Aphaenogaster
  - RNAseq
  - transcriptome
  - simulation
  - fastq
  - git
  - zotero
---

Writing...

### ApTranscriptome

Long titles of the Arabidopsis mRNA fasta files causing problems with downstream programs. After foolishly trying BioPython for the simple task of stripping everything after the sequence ID, [found](http://www.biostars.org/p/51735/) obvious in hind-sight solution of using `cut -f1 -d" " example.fasta > out.fasta` which converts this

    >ENA|AAA16571|AAA16571.1 Arabidopsis thaliana (thale cress) partial auxin-responsive protein : Location:1..558
    ATGGAAAAAG

to the more manageable

    >ENA|AAA16571|AAA16571.1
    ATGGAAAAAG

Debugging script...


    

### Reading

Turner, T.L., Miller, P.M. & Cochrane, V.A. (2013). Combining Genome-Wide Methods to Investigate the Genetic Complexity of Courtship Song Variation in Drosophila melanogaster. Molecular Biology and Evolution, 30, 2113–2120.
  
  - no significant GWAS hits. candidates from Evolve and Resequence experiment are over-represented for GWAS P-values < 0.01, suggesting highly polygenic basis to trait
>

MacLeod, I.M., Larkin, D.M., Lewin, H.A., Hayes, B.J. & Goddard, M.E. (2013). Inferring Demography from Runs of Homozygosity in Whole-Genome Sequence, with Correction for Sequence 
Errors. Molecular Biology and Evolution, 30, 2209–2223.

Patro, R., Mount, S.M. & Kingsford, C. (2013). Sailfish: Alignment-free Isoform Quantification from RNA-seq Reads using Lightweight Algorithms. Retrieved August 21, 2013, from http://arxiv.org/abs/1308.3700

  - new fast method for gene expression analysis. description of method [here](http://nextgenseek.com/2013/08/sailfish-isoform-quantitation-at-the-speed-of-making-a-cup-of-coffee/)

Sipos, B., Slodkowicz, G., Massingham, T. & Goldman, N. (2013). Realistic simulations reveal extensive sample-specificity of RNA-seq biases. Retrieved August 21, 2013, from http://arxiv.org/abs/1308.3172

  - `rlsim` paper is on arXiv! good time to be using the program

### Computing

**Zotero**

Finally found out why Zotero has been REALLY slow. [Known issue]() that default setting of "Import all keywords as tags" causes hundreds of useless tags to be downloaded, slowing search time to a worthless crawl. 

- *Uncheck default options "Automatically tag items with keywords and subject headings" so meaningless tags are not downloaded*
- *Follow [these guidelines](https://forums.zotero.org/discussion/4051/) to remove all previously-collected tags*:
  * Downloaded [Zotero SQlite manager](https://addons.mozilla.org/en-US/firefox/addon/sqlite-manager/)
  * - Installed and opened zotero.sqlite database in ~/.zotero/zotero/8cbcgkkc.default/zotero/zotero.sqlite
  * Selected 'imageTags' table
  * In the "Execute SQL" tab, typed `delete from itemTags`
  * Selected 'tags' table
  * Execute SQL `delete from tags`
  * Reopened Zotero - 5k meaningless tags deleted!


**Github**

Article on using github for [data management](http://polmeth.wustl.edu/methodologist/tpm_v20_n2.pdf) I found while looking into [reading files into R from Dropbox](http://christophergandrud.blogspot.com/2013/04/dropbox-r-data.html)

[repmis](http://cran.r-project.org/web/packages/repmis/index.html) package :

    A collection of miscellaneous tools for reproducible research with R. Currently the package includes tools to load R packages and automatically generate BibTeX files citing them as well as load plain-text data stored on Dropbox, GitHub, and from other sources

As described:

    With some modifications I was able to easily create a function that could download data from non-Public Dropbox folders. The source_DropboxData command is in the most recent version of repmis (v0.2.4) is the result. All you need to know is the name of the file you want to download and its Dropbox key. You can find both of these things in the URL for the webpage that appears when you click on Share Link. Here is an example:

    https://www.dropbox.com/s/exh4iobbm2p5p1v/fin_research_note.csv
    The file name is at the very end (fin_research_note.csv) and the key is the string of letters and numbers in the middle (exh4iobbm2p5p1v). Now we have all of the information we need for source_DropboxData:

~~~
FinDataFull <- repmis::source_DropboxData("fin_research_note.csv",
                                  "exh4iobbm2p5p1v",
                                  sep = ",",
                                  header = TRUE)
~~~

or, as posted in the comments, using the [rDrop package](https://github.com/karthikram/rDrop)

>



