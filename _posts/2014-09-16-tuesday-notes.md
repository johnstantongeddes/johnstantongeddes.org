---
layout: posts
categories: 
  - ApTranscriptome
  - ApPopGen
  - MtGIRAFFE
title: Tuesday notes
tags: 
  - demultiplex
  - sickle
  - sabre
  - qrqc
---

### MtGIRAFFE

Continuing work on script. Treating data as diploid after finding 24 heterozygous SNPs in VCF data.

Completed [v1.0.0 of analysis](https://github.com/johnstantongeddes/MtGIRAFFE) at commit `abeaf0eec8`!

### ApTranscriptome

Debugging Sailfish bootstrap on EC2...

Silly mistake left from debugging caused results to rewrite each other. Fixed and started 20 reps.


### ApPopGen

Using [Sabre](https://github.com/najoshi/sabre) to demultiplex data. 
Need to make `barcode.txt` file in this [format](https://pods.iplantcollaborative.org/wiki/display/DEapps/Sabre-barcode-demultiplexing)

~~~
AGTGAGAAGCAGTGGTATCAACGCAGAGT	sabreN_1.fq
TACGGAAAGCAGTGGTATCAACGCAGAGT	sabreC_1.fq	
~~~

where the first column is the barcode and the second is the outfile name.

Generated `dd_RAD_barcodes_1-48.txt`"

~~~
ACACTCTTTCCCTACACGACGCTCTTCCGATCTGCATGCATG	GCATG_flex.fastq
ACACTCTTTCCCTACACGACGCTCTTCCGATCTAACCACATG	AACCA_flex.fastq
ACACTCTTTCCCTACACGACGCTCTTCCGATCTCGATCCATG	CGATC_flex.fastq
ACACTCTTTCCCTACACGACGCTCTTCCGATCTTCGATCATG	TCGAT_flex.fastq
...
~~~

Command to allow 5 mismatches in barcode:

    sabre se -m 5 -f scahan_VGN_20140730_2014_ddRad1_R1.fastq -b ddRAD_barcodes_1-48.txt -u unknown_barcodes.fastq &


Results

~~~
Total FastQ records: 152946005

FastQ records for barcode ACACTCTTTCCCTACACGACGCTCTTCCGATCTTTACCCATG: 108
FastQ records for barcode ACACTCTTTCCCTACACGACGCTCTTCCGATCTTGGAACATG: 123
FastQ records for barcode ACACTCTTTCCCTACACGACGCTCTTCCGATCTTCTGCCATG: 54
FastQ records for barcode ACACTCTTTCCCTACACGACGCTCTTCCGATCTTCCGGCATG: 5
FastQ records for barcode ACACTCTTTCCCTACACGACGCTCTTCCGATCTTCAGTCATG: 1
FastQ records for barcode ACACTCTTTCCCTACACGACGCTCTTCCGATCTTCACGCATG: 7
FastQ records for barcode ACACTCTTTCCCTACACGACGCTCTTCCGATCTTATACCATG: 77
FastQ records for barcode ACACTCTTTCCCTACACGACGCTCTTCCGATCTTAGTACATG: 35
FastQ records for barcode ACACTCTTTCCCTACACGACGCTCTTCCGATCTTACGTCATG: 0
FastQ records for barcode ACACTCTTTCCCTACACGACGCTCTTCCGATCTTACCGCATG: 55
FastQ records for barcode ACACTCTTTCCCTACACGACGCTCTTCCGATCTGTCGACATG: 2
FastQ records for barcode ACACTCTTTCCCTACACGACGCTCTTCCGATCTGTCCGCATG: 4
FastQ records for barcode ACACTCTTTCCCTACACGACGCTCTTCCGATCTGTAGTCATG: 0
FastQ records for barcode ACACTCTTTCCCTACACGACGCTCTTCCGATCTGGCTCCATG: 91
FastQ records for barcode ACACTCTTTCCCTACACGACGCTCTTCCGATCTGGCCACATG: 0
FastQ records for barcode ACACTCTTTCCCTACACGACGCTCTTCCGATCTGGATACATG: 0
FastQ records for barcode ACACTCTTTCCCTACACGACGCTCTTCCGATCTGCTGACATG: 0
FastQ records for barcode ACACTCTTTCCCTACACGACGCTCTTCCGATCTGCCGTCATG: 0
FastQ records for barcode ACACTCTTTCCCTACACGACGCTCTTCCGATCTGAGTCCATG: 0
FastQ records for barcode ACACTCTTTCCCTACACGACGCTCTTCCGATCTGAGATCATG: 0
FastQ records for barcode ACACTCTTTCCCTACACGACGCTCTTCCGATCTGACACCATG: 1
FastQ records for barcode ACACTCTTTCCCTACACGACGCTCTTCCGATCTCTTGGCATG: 1
FastQ records for barcode ACACTCTTTCCCTACACGACGCTCTTCCGATCTCTGTCCATG: 1
FastQ records for barcode ACACTCTTTCCCTACACGACGCTCTTCCGATCTCTGCGCATG: 59
FastQ records for barcode ACACTCTTTCCCTACACGACGCTCTTCCGATCTCTGATCATG: 0
FastQ records for barcode ACACTCTTTCCCTACACGACGCTCTTCCGATCTCGTCGCATG: 0
FastQ records for barcode ACACTCTTTCCCTACACGACGCTCTTCCGATCTCGTACCATG: 41
FastQ records for barcode ACACTCTTTCCCTACACGACGCTCTTCCGATCTCGGTACATG: 2
FastQ records for barcode ACACTCTTTCCCTACACGACGCTCTTCCGATCTCGGCTCATG: 5
FastQ records for barcode ACACTCTTTCCCTACACGACGCTCTTCCGATCTCGAATCATG: 0
FastQ records for barcode ACACTCTTTCCCTACACGACGCTCTTCCGATCTCATATCATG: 4
FastQ records for barcode ACACTCTTTCCCTACACGACGCTCTTCCGATCTATTACCATG: 30
FastQ records for barcode ACACTCTTTCCCTACACGACGCTCTTCCGATCTATGAGCATG: 19
FastQ records for barcode ACACTCTTTCCCTACACGACGCTCTTCCGATCTATACGCATG: 20
FastQ records for barcode ACACTCTTTCCCTACACGACGCTCTTCCGATCTACTTCCATG: 1
FastQ records for barcode ACACTCTTTCCCTACACGACGCTCTTCCGATCTACTGGCATG: 0
FastQ records for barcode ACACTCTTTCCCTACACGACGCTCTTCCGATCTACGGTCATG: 1
FastQ records for barcode ACACTCTTTCCCTACACGACGCTCTTCCGATCTAATTACATG: 1
FastQ records for barcode ACACTCTTTCCCTACACGACGCTCTTCCGATCTACACACATG: 7
FastQ records for barcode ACACTCTTTCCCTACACGACGCTCTTCCGATCTAGCTACATG: 35
FastQ records for barcode ACACTCTTTCCCTACACGACGCTCTTCCGATCTAAGGACATG: 2
FastQ records for barcode ACACTCTTTCCCTACACGACGCTCTTCCGATCTGGTTGCATG: 2
FastQ records for barcode ACACTCTTTCCCTACACGACGCTCTTCCGATCTCAACCCATG: 14
FastQ records for barcode ACACTCTTTCCCTACACGACGCTCTTCCGATCTTGCATCATG: 10
FastQ records for barcode ACACTCTTTCCCTACACGACGCTCTTCCGATCTTCGATCATG: 1
FastQ records for barcode ACACTCTTTCCCTACACGACGCTCTTCCGATCTCGATCCATG: 3
FastQ records for barcode ACACTCTTTCCCTACACGACGCTCTTCCGATCTAACCACATG: 24
FastQ records for barcode ACACTCTTTCCCTACACGACGCTCTTCCGATCTGCATGCATG: 4

FastQ records with no barcode match: 152945155

Number of mismatches allowed: 5
~~~

Definitely not good. Turns out that I should only have used the *barcode* sequence (positions 34-38) for demultiplexing. Also worth noting that the barcodes are still unique if the first posiiton is missing, as many of the reads have an N at the first position.

~~~
GCATG	GCATG_flex.fastq
AACCA	AACCA_flex.fastq
CGATC	CGATC_flex.fastq
~~~

Re-ran sabre allowing single mismatch (`-m `) to deal with N at first position. Much better results!

~~~
FastQ records for barcode TTACC: 4275731
FastQ records for barcode TGGAA: 2595394
FastQ records for barcode TCTGC: 2552441
FastQ records for barcode TCCGG: 3196900
FastQ records for barcode TCAGT: 2493173
FastQ records for barcode TCACG: 3381451
FastQ records for barcode TATAC: 3288965
FastQ records for barcode TAGTA: 2751938
FastQ records for barcode TACGT: 5171345
FastQ records for barcode TACCG: 5537585
FastQ records for barcode GTCGA: 5046445
FastQ records for barcode GTCCG: 4767314
FastQ records for barcode GTAGT: 1975614
FastQ records for barcode GGCTC: 2935593
FastQ records for barcode GGCCA: 2541945
FastQ records for barcode GGATA: 1575601
FastQ records for barcode GCTGA: 2368128
FastQ records for barcode GCCGT: 2359235
FastQ records for barcode GAGTC: 3006513
FastQ records for barcode GAGAT: 2067871
FastQ records for barcode GACAC: 4726443
FastQ records for barcode CTTGG: 2579598
FastQ records for barcode CTGTC: 1085679
FastQ records for barcode CTGCG: 3175215
FastQ records for barcode CTGAT: 2544480
FastQ records for barcode CGTCG: 3605274
FastQ records for barcode CGTAC: 2035376
FastQ records for barcode CGGTA: 288454
FastQ records for barcode CGGCT: 2023708
FastQ records for barcode CGAAT: 2584915
FastQ records for barcode CATAT: 7331024
FastQ records for barcode ATTAC: 2586808
FastQ records for barcode ATGAG: 4612287
FastQ records for barcode ATACG: 4287136
FastQ records for barcode ACTTC: 1518915
FastQ records for barcode ACTGG: 1874829
FastQ records for barcode ACGGT: 2962749
FastQ records for barcode AATTA: 2276665
FastQ records for barcode ACACA: 2899588
FastQ records for barcode AGCTA: 2639168
FastQ records for barcode AAGGA: 1281569
FastQ records for barcode GGTTG: 2858257
FastQ records for barcode CAACC: 6181619
FastQ records for barcode TGCAT: 2792088
FastQ records for barcode TCGAT: 1083199
FastQ records for barcode CGATC: 5194011
FastQ records for barcode AACCA: 5852849
FastQ records for barcode GCATG: 5579773

FastQ records with no barcode match: 595147

Number of mismatches allowed: 1
~~~



Next, used [sickle](https://github.com/najoshi/sickle) for quality-trimmming. Sample AGCTA is middle-of-the-road, so used this as trial.

    sickle se -f AGCTA_flex.fastq -t sanger -o CAACC_flex_trimmed.fastq -q 20 -l 20 
    
Most reads retained!

Instead of fastqc, looking into using [qrqc](https://github.com/vsbuffalo/qrqc) as it's implemented in R and therefore more extensible (by me). 

