---
layout: posts
categories:
  - ecological genetics
title: Bioinformatics Monday
tags:
  - Bradyrhizobium
---

## Bradyrhizobium

Ran [seqtk](https://github.com/lh3/seqtk) for quality filtering over the weekend. While the program appeared to run fine, the output files were always 0 lines.
Checked that grooming worked correctly:

In Galaxy, the files go from the original Illumina 1.3 format

    @HWI-ST261:8:1:1222:2141#CGATGT/2
    ATGCCGTGCTCGCGAACGAGCCGACTGGCGCGATTCAGCCACGTGCCAGTCAGGACACGCGTATGTGGACGGTCTGCGCAGAGCGTGTGTGTACGCGTAT
    +
    f_ffUdcdBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB
    @HWI-ST261:8:1:1418:2082#CGATGT/2
    ATCGCCGCATGCGAGGCGGAGAGGCTGGATGTGCAGGGGCAGACGGCGGCGGGTATACAGTTGCGCAACGAGCTCGTCTCGAGTGTCGCACGCGACACGA
    +
    BBBBBBBBBBBBBBBBBBBBBBBBBBBBB

and after grooming to fastq-sanger

    @HWI-ST261:8:1:1222:2141#CGATGT/2
    ATGCCGTGCTCGCGAACGAGCCGACTGGCGCGATTCAGCCACGTGCCAGTCAGGACACGCGTATGTGGACGGTCTGCGCAGAGCGTGTGTGTACGCGTAT
    +
    G@GG6EDE############################################################################################
    @HWI-ST261:8:1:1418:2082#CGATGT/2
    ATCGCCGCATGCGAGGCGGAGAGGCTGGATGTGCAGGGGCAGACGGCGGCGGGTATACAGTTGCGCAACGAGCTCGTCTCGAGTGTCGCACGCGACACGA
    +
    ##########################

and confirmed that the BioPython write function did the same.

Spot checked that this is the correct fastq conversion.
Illumina 1.3 encoding: 38=f, 31=_, 2=B,
Sanger/Illumina 1.8:   38=G, 31=@, 3=#

NOTE - while checking this, found that I used the files in the directory:
/home/tiffinp/stanton1/bmgc_incoming/110527_SN261_0347_B81JM9ABXX_L8/fastq_flt
However, there were 3 directories provided by BMGC
 - fastq
 - fastq_flt
 - fastq_flt_syn

and they differ in file size. Based on file size, it appears that the files imported into Galaxy are the 'fastq_flt' files, so I should probably restart my workflow from these when all is running. However, the 'fastq_flt_syn' files are only marginally smaller and look the same in spot-checking, so probably another filter was applied so I will use these files.

Used seqtk to trim files.
**NOTE** that no reads are removed by seqtk. I found the answer to this buried in a [biostars post](http://www.biostars.org/p/1923/):

    I have just added quality based trimming in seqtk. It uses the Phred algorithm to trim both ends. If after trimming, the read length is below 30 (by default), it tries to find a 30bp window with the highest sum of quality.

So, a second-step should be removing any files with length < 30 bp. Was also able to do this using seqtk

    seqtk seq -L 31 in.fastq > out.fastq

Worked perfectly. As I had previously found from Galaxy, about 10 million more R2 reads are removed as they had high quality for only ~60 bp.

Sample    Direction   Num reads     Reads after trimming
-------   ----------  -----------   ---------------------
IC1       R1           55,277,504       54,330,756
IC1       R2           55,277,504       41,378,320
ENC4      R1           53,690,116       52,845,976
ENC4      R2           53,690,116       41,618,276
EWC3      R1           50,995,944       50,161,016
EWC3      R2           50,995,944       39,365,136
---------------------------------------------------------

**NOTE** that this results in unpaired reads. Script available as part of velvet that removes singleton reads:  https://github.com/dzerbino/velvet/blob/master/contrib/select_paired/select_paired.pl

## Lab Notebook

Checked off two items on website TODO list!

* ~~set background image~~
* ~~how to properly display tags~~

For tags, my question on stackoverflow was [answered](http://stackoverflow.com/questions/15843107/jekyll-make-a-list-of-page-tags)!

Useful reference for jekyll:
https://github.com/mojombo/jekyll/wiki/Liquid-Extensions

For background image, was almost there before...just had to change css to

    body {
	background-image: url('/assets/img/natural_paper/natural_paper.png');
	background-repeat: repeat;
    }

