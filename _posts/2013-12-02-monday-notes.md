---
layout: posts
categories: ApTranscriptome
title: Monday notes
tags:
  - shell
  - transcriptome
  - ddRADseq
---

Over Thanksgiving break, completed running Trinity on digitally-normalized reads. Script [here](https://github.com/johnstantongeddes/ApTranscriptome/tree/master/scripts).

**Comparison of Trinity transcriptome assemblies**

Assembly                       Total trinity transcripts     Total trinity components     Contig N50
--------------------------    --------------------------    --------------------------   ------------
Trinity-full                       126172                           96093                     1631
Trinity-diginorm                   143078                           88080                     2047 

------------------------------------------------------------------------------------------------------

The diginorm assembly has more total transcripts, but *fewer* components. Interesting...

Trying to evaluate similiary among assemblies using BLAST.

Damn - ran into memory limits with R! 

    Error: C stack usage is too close to the limit

[Increase limit](http://stackoverflow.com/questions/14719349/error-c-stack-usage-is-too-close-to-the-limit) using

     ulimit -s 16384 # enlarge stack limit to 16 megs
     # check R memory limit
     R --slave -e 'Cstack_info()["size"]'
    
Better solutions:

* simply read as table...no memory problems. wonder what read.blast() does that causes these problems
* run blast with flags to keep only matches with significant evals and only keep top hit

    blastn ... -max_target_seqs 1 -evalue 1e-20

This reduces blast results table from 681k lines to 115k

**Even better**

Use Trinity provided script to compare [assemblies](http://trinityrnaseq.sourceforge.net/analysis/full_length_transcript_analysis.html)

~~~
# Make BLAST database for diginorm assembly
makeblastdb -dbtype nucl -in ../results/trinity/Trinity.fasta

# BLAST full assembly against diginorm assembly
blastn -query ../results/trinity-full/Trinity.fasta -db ../results/trinity/Trinity.fasta -evalue 1e-20 -max_target_seqs 1 -outfmt 6 -out blast-full-vs-diginorm.txt

# Examine percent of diginorm target length aligned to best matching transcript in full assembly
/opt/software/trinityrnaseq_r2013_08_14/util/analyze_blastPlus_topHit_coverage.pl blast-full-vs-diginorm.txt ../results/trinity/Trinity.fasta ../results/trinity/Trinity.fasta
~~~

**Table of percent length of diginorm assembly transcripts aligned by full assembly transcripts**

hit_pct_cov_bin     count_in_bin     >bin_below
----------------   --------------   ------------
100	                   73880            73880
90                     5925             79805
80                     5382             85187
70                     3800             88987
60                     2989             91976
50                     1607             93583
40                     1157             94740
30                     1060             95800
20                     1053             96853
10                     0                96853
0                      0                96853
--------------------------------------------------------

* Of 143,078 transcripts in diginorm assembly, 96,853 (68%) have significant matches to transcripts in full assembly
* 73,880 (76%) are 100 percent matches
* 85,187 (88%) have greater than 80% length alignment


**Table of percent length of full assembly transcripts aligned by diginorm assembly transcripts**

hit_pct_cov_bin     count_in_bin     >bin_below
----------------   --------------   ------------
100	                   80308            80308
90                     4381             84689
80                     3277             87966
70                     2664             90630
60                     2189             92819
50                     1218             94037
40                     828              94865
30                     554              95419
20                     390              95809
10                     0                95809
0                      0                98509
--------------------------------------------------------

* Of 126,172 transcripts in full assembly, 98509 (78%) have matches in diginorm assembly
* 80,308 (82%) are 100 percent matches
* 87,966 (89%) have greater than 80% length alignment

**NOTE** the diginorm assembly includes 100 *in silico* spike-in sequences that do not exist in full assembly...plan to use these to computationally check assembly. need to remove for fair comparison

