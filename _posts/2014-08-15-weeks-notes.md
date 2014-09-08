---
layout: posts
categories: 
  - ApGxL
  - ApTranscriptome
  - MtGIRAFFE
title: 11 -- 15 August notes
tags: 
  - DGE
  - Illumina library prep
  - haplotype imputation
  - BEAGLE
  - KAPA
---

## 2014-08-11

### ApGxL

Ovation DGE for eight samples.

Contacted Ashesh at Nugen Tech Support

~~~
uses oligo(T) to initiate the first strand synthesis.  The length of the product is determined by the processivity of the reverse transcriptase.  This is the reason that you get cDNA of varying lengths.  When you fragment the cDNA you will have fragments that are adjacent to the poly(A) and fragment further upstream depending on the size of the initially generated cDNA.   There is no specific selection of just fragments proximal to the poly(A) tail. 
 
I would recommend using 1ug of cDNA as input into the Encore Rapid library system.  You should fragment at least 1.5 ug of cDNA and then purify the fragmented cDNA.  The purified, fragmented cDNA should be quantified and 1ug of the fragmented cDNA used as input into the library construction system.
~~~

So - this DGE protocol is not only a single tag per transcript, but simply a reduced length cDNA transcript?!? Not quite as efficient as I thought/hoped. 


### MtGIRAFFE

Desktop can't process whole chr8 file - workstation still in shop. Working with smaller test file.

Export to VCF

    bcftools view -f PASS -r chr5:1000-6000 -O v -o test.vcf chr5-filtered-set-2014Apr15.bcf

Convert to BEAGLE format using [Beagle utility program](http://faculty.washington.edu/browning/beagle_utilities/utilities.html#vcf2beagle)

    cat test.vcf | java -jar vcf2beagle.jar ? BeagleTest

Run BEAGLE

	java -Xmx1000m -jar beagle.jar unphased=BeagleTest.bgl.gz missing=? out=BeagleTest



## 2014-08-12

### ApGxL

- Post-SPIA protocol for yesterday's samples
- Purified using QIAquick into 32 ul TE

Qubit cDNA assay results

Sample           ng/ul
---------     -----------
07-B-CT           69
11-C-CT           104
15-A-CT           77
20-C-CT           64.6
26-C-CT           27.3
07-A-HS           32.7
07-B-HS            0.7
11-C-HS            7.1

<br>

Samples 1 - 4 had > 60 ng/ul with 2 ul in 198 working solution, diluted 2x by adding another 200 ul Qubit DNA buffer to get readings.

**Ovation library prep**

- Pooling 16 samples 
- First step, fragment DNA using Covaris.
- For each sample, added volume to get 1500 ng DNA or all DNA available

Number          Sample         stock (ng/ul)    volume for 1.5ug (ul)   actually added (ul)
---------     -----------     ---------------  ----------------------  ---------------------
1               08-D-CT           >60                25                        30
2               15-B-HS           26.9               55.8                      25
3               05-B-HS           18.0               83.3                      25
4               07-B-CT           69                 21.74                     21.8
5               11-C-CT          104                 14.4                      14.4
6               15-A-CT           77                 19.5                      19.5
7               20-C-CT           64.6               23.2                      23.2
8               26-C-CT           27.3               55.0                      25
9               07-A-HS           32.7               45.9                      28
10              11-C-HS            7.13             210.4                      28
11              J3-A             104                 15                        15
12              **J3-B**         104                 15                        **1**
13              J2-A             215                  7							5
14              **J2-B**         215                  7                         1
15              J1               194                  7.7                       5
16              J4                34.2               43.8                      25

- Used a range of input concentrations to assess effect of DNA input mass on library prep
- Transferred sample to Covaris tubes and filled to 50ul with Tris
- Covaris S2 fragmentation settings: Time 120 seconds, Intensity 5, Duty Cycle 10% and Cycles per burst 200. 
- Sent aliquot of each sample to Bioanalyzer 

## 2014-08-13

### ApGxL

- Library prep
  - concentrated fragmented cDNA using Qiagen QIAquick to get small volume, ~11 ul per sample
  - 8 ul are used on library prep, with target of 1ug of DNA

Discussed questions about DGE from Ashesh's email with SCH. Possibility of using un-fragmented DNA. In this case, only ~50% of reads would be useful - those that map to 3' end of transcript. If used paired-end sequencing, might be able to use pair to anchor read to transcript. Might be a problem with using fragments of varying length in Illumina...

- Extracted RNA from 12 more samples

**UVM-AGTC**: Problems with Bioanalyzer for fragmented DNA - possible contaminant that is masking ladder and making it difficult to get clear trace.
  
  
## 2014-08-14

### ApGxL

- Library prep
  - DNA concentration after fragmentation and purification

Number          Sample         stock (ng/ul)
---------   ---------------     ---------------
1               08-D-CT           102
2               15-B-HS           132
3               05-B-HS           106
4               07-B-CT            93
5               11-C-CT            94
6               15-A-CT            90
7               20-C-CT            98
8               26-C-CT            27.8
9               07-A-HS           139
10            **11-C-HS**         **0**
11              J3-A               41
12            **J3-B**            **1.3**
13              J2-A               23
14            **J2-B**            **1.2**
15              J1                 26
16              J4                 63

<br>

- Low-input samples (11-C-HS, J3-B, J2-B) have about zero DNA - drop from sequencing library. 
- For input of 500 ng in 7 ul, need concentration of 71 ng/ul. 5 samples (26-C-CT, J3-A, J2-A, J1, J4) are below this level but non-zero. Proceed with them anyway to see what happens with low-input library prep.
- As I have 'extra' barcodes, decided to pool all the J1 and J2 fragments from last week as they were about the same size into a single sample and include in library prep
  - concentrated fragmented cDNA using protocol in Encore Rapid Protocol. eluted into 20 ul TE
  - quantified DNA
    - J1-P: 28.9 ng/ul
    - J2-P: 27.9 ng/ul
- Followed libary prep protocol.


**DGE library JSG001**

Number          Sample           Barcode        Sequence
---------     -----------     ------------    ------------
1               08-D-CT         L2DR01           AAGGGA
2               15-B-HS         L2DR02           CCTTCA
3               05-B-HS         L2DR03           GGACCC
4               07-B-CT         L2DR04           TTCAGC
5               11-C-CT         L2DR05           AAGACG
6               15-A-CT         L2DR06           CCTCGG
7               20-C-CT         L2DR07           GGATGT
8               26-C-CT         L2DR08           TTCGCT
9               07-A-HS         L2DR09           ACACGA
10              J3-A            L2DR10           CACACA
11              J2-A            L2DR11           GTGTTA
12              J1              L2DR12           TGTGAA
13              J4              L2DR13           ACAAAC
14              J1-P            L2DR14           CACCTC
15              J2-P            L2DR15           GTGGCC


--------------------------------------------------------

**Kappa Library Quant qPCR**
  - called tech support to ask if I could use the kit we ordered for LightCycler 480 with new ABS StepOnePlus (S1P)
  - Yes! S1P uses a reference dye (Rox High) while the LightCycler did not. Simply need to turn off reference dye in S1P settings. To do this, under `Plate Settings` select the `Assign Target and Samples` tab. In bottom-right, set Reference Dye to `None`
  - Could result in more jagged curves, not as smooth as with reference dye
  - For future, order KK4835
  - Very good tech support from Kappa!
  
### UVM-AGCT

Meeting with Tim Hunter and Scott Tighe

- Discussed sequencing plans
  - cost of full RNAseq vs DGE
  - use *low EDTA* TE Buffer: Tris 10 mM EDTA 0.1 mM
  - ST specified SPIA product, not cDNA
  - Qubit and Kappa often consistent. Cheaper and faster to pool samples based on Qubit values, than run single Kappa qPCR. For first run, do Kappa qPCR for all samples then use values to normalize for library prep
  - should I be using more ants at the extraction step?
- Bioanalyzer results wonky; standards not showing up
  - DNA too concentrated? dilute to under 5 ng/ul
  - trace pattern still looks okay, consistent with fragmented SPIA product
  
  
### R
 
UseR was this week - information via Twitter: 

  - [review of sessions from Karl Broman](http://kbroman.wordpress.com/2014/07/02/2014-user-conference-days-1-2/)
  - [Tutorials](http://user2014.stat.ucla.edu/#tutorials)
  - [Writing an R package](http://hilaryparker.com/2014/04/29/writing-an-r-package-from-scratch/)


  
2014-08-15
==============

### ApGxL

KAPA Library Quantification qPCR


1. Diluted library 1:1000 ul in 10mM Tris
    - made a 1:2000 dilution (100 ul dilution 1 in 100ul Tris)
2. Mixed samples

Reagent                  Volume (ul)
------------------     --------------
KAPA master mix             12
H~2~O                        4
DNA/standard                 4

<br>

3. Set-up plate with: 
    - 6 Illumina standards in triplicate
    - Triplicate samples of each dilution for each sample
4. Ran qPCR
    - standard curve
    - SYBR green
    - 2 hr run
    - **Passive reference: none** 
    - Cycling: 95C - 5 min, 35x {95C - 30sec, 60C - 45sec}
    

**Results**

- Set standards to 20, 2, 0.2, 0.02, 0.002 and 0.0002 pM
- Recorded "Quantity* from Unknown samples
- Could only fit 13 samples on plate

Calculated concentration of undiluted library stock (pM):

$$ C = \overline{quantity} \times \frac{452}{200} \times Dilution^-1  $$

where 200 is the average fragment length. 

Number          Sample           pM
---------     -----------     ------------
1               08-D-CT           198
2               15-B-HS         4,144
3               05-B-HS           257
4               07-B-CT           905
5               11-C-CT           948
6               15-A-CT         1,858
7               20-C-CT         1,840
8               26-C-CT           828
9               07-A-HS         1,154
10              J3-A              674
11              J2-A              554
12              J1                481
13              J4                685

<br>

- Great! Have amplifiable inserts for all samples!

