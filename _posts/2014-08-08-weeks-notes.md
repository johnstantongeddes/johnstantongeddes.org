---
layout: posts
categories: 
  - ApGxL
  - ApTranscriptome
  - MtGIRAFFE
title: 4 -- 8 August notes
tags: 
  - DGE
  - Covaris
  - DNA fragmentation
---

## 2014-08-04

* Major computer problems
  - workstation shutdown over weekend while backing up. Did I start upgrades to new kernel? refuses to boot into operating system
  - desktop freezes on wake-up from suspend in both 12.04 LTS with new kernel and with 14.04
* Observed Grace's experimental ant colonies

### ApGxL

RNA extraction. Started with 6 samples for Qiagen RNeasy kit but 4 of 6 (damn!) were lost when caps came off in Bullet Blender. 

Grabbed 4 replacement ants from colonies downstairs as tests.

Also ran the RNAzol extractions that had RNA according to Qubit through RNeasy kit. 

Sample          Method                ng/ul
---------   -------------------     ---------
04-B-HS      RNAzol + RNeasy          2.88
10-B-CT      RNAzol + RNeasy          0
22-B-CT      RNAzol + RNeasy          0
22-C-CT      RNAzol + RNeasy          0
15-B-HS         RNeasy                6.97
08-D-CT         RNeasy                6.84
J1              RNeasy               13.4
J2              RNeasy               14.7
J3              RNeasy                5.6
J4              RNeasy                0

<br>

- RNAzol + RNeasy losses too much RNA, use RNeasy only. Consistent with previous [tests]({% post_url 2014-01-22-Wednesday-notes %})

Sent to Bioanalyzer.


## 2014-08-05

- Watched Grace's experimental colonies and feed Pogo colonies

## ApGxL 

Ovation DGE System for 7 samples through SPIA protocol

Samples
---------
05-B-HS
15-B-HS
08-D-CT
J1
J2
J3
J4

<br>


## 2014-08-06

- Agenda for Aphaenophone


### ApGxL

Talked to Scott about settings for Covaris DNA fragmentation.

For test samples (J1-J4), checked DNA concentration with SPIA amplified samples, prior to Post-SPIA protocol and purification. 

Sample          ng/ul
---------     --------
J1              42.9
J2              52.0
J3              40.1
J4              38.1

<br>

- Looks great for all samples!

After Post-SPIA protocol, used Qiagen QIAquick PCR purification protocol for samples 1-5, and compared to RNAClean XP beads for samples 6-7.

Sample          ng/ul
---------     --------- 
05-B-HS          15.2
15-B-HS          26.9
08-D-CT         >60
J1              >60
J2              >60
J3              >60
J4               34.2

<br>

Re-quantified 10^-1 dilutions of J1, J2, J3

Sample          ng/ul       original (ng/ul)
---------     ---------   ------------------
J1              19.4             194
J2              21.5             215
J3              10.4             104

<br>

Great DNA in all samples! No obvious effect of different RNA purification methods.



Re-ran DGE sample from [last week]({% post_url 2014-08-01-weeks-notes %}) that was out of range

Samples      ng/ul     stock (ng/ul)
---------  --------   ---------------
04-A-HS      5.83          58


**Covaris DNA fragmentation**

To optimize fragmentation, ran test with different run times

Made 4 aliquots of samples J1 and J2 at final concentration of 16 ng/ul (4 ul DNA in 46 ul TE). 


Sample    Intensity    Duty Cycle    Cycles per burst    Treatment time (s)
-------  ----------   ------------  ------------------  --------------------
J1-1        5             10%             200                100
J1-2        5             10%             200                110
J1-3        5             10%             200                120
J1-4        5             10%             200                140
J2-1        5             10%             200                100
J2-2        5             10%             200                110
J2-3        5             10%             200                120
J2-4        5             10%             200                130*

<br>

* Messed up settings on final run and the last 10 seconds were Intensity 0.1, Duty Cycle 0.5% and Cycles per burst 50.

Sent samples (and unfragmented cDNA) to Bioanalyzer).


### Computing 

Re-installed Ubuntu 14.04. 

Essential progams:

- git
- LaTex
- Emacs
- R
- pandoc
- Meld


2014-08-07
=================



### Other things

- Workstation busted. Dropped off at Pine Computers for diagnostics.
- Completed review for MBE
- Painted and treated Grace's experimental colonies T2-3 and T2-4
  - made fresh methoprene solution: 2.5 ul in 500 ul acetone (5ug/ml concentration)
  - T2-3: 8 ants each red (methoprene) and yellow (acetone control). 
  - T2-4: 21 ants each red (acetone control) and silver (methoprene).



2014-08-08
=============

- [Aphaenophone conference call]({% post_url 2014-08-07-aphaenophone %})

### ApTranscriptome

Incorporated comments from NS. More revisions. Sent to SHC.

TODO:

- figure of HSP expression
- thermal safety margins
- tables with enriched gene sets


### ApGxL

![Bioanalyzer from Covaris DNA fragmentation]({{ site.url }}/assets/files/UVMAGTC-JS-4677_CahanRR_8-7-2014_High_Sensitivity_DNA_Assay_DE20901668_2014-08-07_16-08-13.pdf)

- J1-0, J2-0 and J3-0 are the un-fragmented DNA.
- Other samples are fragmented at different settings, from 100 to 130 seconds.
- Fragmentation worked well, actually quite similar for all times.
- Size about 200bp, as desired for library prep.

<br>

RNA extraction for 12 samples using RNeasy. Two-step elution, first 16 ul, second 8 ul for a total of 24 ul.

Qubit RNA assay results

Sample           ng/ul
---------     -----------
07-A-CT           0
07-B-CT           3.4
11-C-CT           3.0
15-A-CT           2.6
20-C-CT          14.2 
26-C-CT           7.4
07-A-HS          11.1
07-B-HS          17.2
11-C-HS           7.6
15-A-HS           6.4
20-C-HS           7.1
26-C-HS          12.0

<br>

- Observed Grace's ants
- Project organization
- Computer stuff...jekyll not running on new installation
- Installed Beagle for Medicago

