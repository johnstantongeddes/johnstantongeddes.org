---
layout: posts
categories: 
  - ApGxL
title: 18 -- 22 August notes
tags: 
  - DGE
  - Illumina library prep
  - KAPA
---

## 2014-08-18

### ApGxL

Qubit for DGE libraries

KAPA library quant and Qubit results are off by an order of magnitude. ST recommended running Bioanalyzer before proceeding.

Talked to Illumnia reps about new technologies

- Nextra sample prep
  - 1.5 hour library prep!
  - 50 ng DNA input
  - Transposome technology?
  
  
2014-08-19
===============

### ApGxL

NOTE - Bioan.nM were all diluted ~4 fold

|  Sample.Name  |  Qubit.nM  |  Bioan.nM  |  KAPA.nM  |
|:-------------:|:----------:|:----------:|:---------:|
|    05-B-HS    |   65.19    |            |  0.2576   |
|    07-A-HS    |   273.9    |   17.22    |   1.155   |
|    07-B-CT    |   153.8    |    6.56    |  0.9051   |
|    08-D-CT    |   173.8    |    9.02    |  0.1989   |
|    11-C-CT    |   95.94    |            |  0.9481   |
|    15-A-CT    |   97.58    |    1.64    |   1.859   |
|    15-B-HS    |   277.2    |    4.92    |   4.145   |
|    20-C-CT    |   82.41    |            |   1.841   |
|    26-C-CT    |   53.71    |   11.89    |  0.8283   |
|      J1       |   51.66    |    4.92    |  0.4814   |
|     J2-A      |   47.56    |     0      |  0.5548   |
|     J3-A      |   35.67    |            |  0.6746   |
|      J4       |   116.4    |    4.51    |  0.6859   |
|     J1-P      |   31.16    |            |           |
|     J2-P      |   62.32    |   10.25    |           |


mean ratio Qubit to Kappa: 175

mean ratio Qubit to Kappa: 24.6


### ApTranscriptome

Comments from SHC


## 2014-08-20

- Bad news comes in threes. -80 freezer broke and up to 6C by the time we discovered it and moved samples.

### ApGxL

Pooled samples using Qubit values for all to get 200nM for each sample

|  Sample.Name  |  Qubit.nM  |  vol_200nM  |
|:-------------:|:----------:|:-----------:|
|    05-B-HS    |   65.19    |    3.068    |
|    07-A-HS    |   273.9    |   0.7302    |
|    07-B-CT    |   153.8    |    1.301    |
|    08-D-CT    |   173.8    |    1.15     |
|    11-C-CT    |   95.94    |    2.085    |
|    15-A-CT    |   97.58    |    2.05     |
|    15-B-HS    |   277.2    |   0.7216    |
|    20-C-CT    |   82.41    |    2.427    |
|    26-C-CT    |   53.71    |    3.724    |
|      J1       |   51.66    |    3.871    |
|     J3-A      |   35.67    |    5.607    |
|      J4       |   116.4    |    1.718    |
|     J1-P      |   31.16    |    6.418    |
|     J2-P      |   62.32    |    3.209    |

<br>

- Dropped J2-A as Bioanalyzer showed no DNA
- Only 4.2 ul available for J1-P

Total volume = 35.9 ul containing 2,730 nM for a final concentration of 76 nM/ul.

**KAPA qPCR**

Made 1e-3, 1e-4 and 1e-5 dilutions of pooled sample and ran KAPA qPCR.


|  Well  |  Sample.Name  |  Quantity  |  Cт   |  Dilution  |
|:------:|:-------------:|:----------:|:-----:|:----------:|
|   A1   |     Std1      |     20     |       |     1      |
|   A2   |     Std1      |     20     |       |     1      |
|   A3   |     Std2      |     2      |       |     1      |
|   A4   |     Std2      |     2      |       |     1      |
|   A5   |     Std3      |    0.2     | 21.4  |     1      |
|   A6   |     Std3      |    0.2     | 10.59 |     1      |
|   A7   |     Std4      |    0.02    | 12.6  |     1      |
|   A8   |     Std4      |    0.02    | 14.33 |     1      |
|   A9   |     Std5      |   0.002    | 16.45 |     1      |
|  A10   |     Std5      |   0.002    | 16.51 |     1      |
|  A11   |     Std6      |   0.002    | 20.2  |     1      |
|  A12   |     Std6      |   0.002    | 20.45 |     1      |
|   B1   |    Pool-D1    |   971.9    | 8.949 |   0.001    |
|   B2   |    Pool-D1    |   264.5    | 9.822 |   0.001    |
|   B3   |    Pool-D1    |   362.6    | 9.61  |   0.001    |
|   B4   |    Pool-D2    |  0.00021   | 19.24 |   1e-04    |
|   B5   |    Pool-D2    |  0.00069   | 18.44 |   1e-04    |
|   B6   |    Pool-D2    |  0.00241   | 17.6  |   1e-04    |
|   B7   |    Pool-D3    |     0      | 32.15 |   1e-05    |
|   B8   |    Pool-D3    |     0      | 29.49 |   1e-05    |
|   B9   |    Pool-D3    |            |       |   1e-05    |

<br>

- Standards 1 and 2 were 'missing' (pipetting error) and only consistent for Standards 5 and 6. Pipetting error?
- Standards 5 and 6 okay, allowing rough quantification
- Dilution 1 (10e-3) Ct ~ 9.5
- Dilution 2 (10e-4) Ct ~ 18 but at edge of measurable range
- Dilution 3 not measurable

Using only Dilution 1, median Quantity = 362, mean = 532

**KAPA calculations of concentration 818 - 1,202 nM/ul**

Qubit on the pooled sample: 22.2 ng/ul

Rough conversion to nM: 22.2 * 4.1 = **91 nM/ul**

Baffling - this time the Qubit is an order of magnitude lower than KAPA...



### Computing

- Fixed Jekyll by upgrading to 13.10 following [my own notes on stack overflow](http://askubuntu.com/questions/341295/install-pandoc-required-for-docverter/439968#439968) so back to updating website



## 2014-08-22

- James Waters visited lab. Went out to East Woods and showed him how to find Aphaenogaster - collected 2 queen-right colonies!

### ApTranscriptome

Writing...

### ApGxL

Repeated KAPA qPCR.

Dilutions

- 1:1000 (1*10e-03)
- 1:2000 (5*10e-04)
- 1:4000 (2.5*10e-04)

Ran each dilution in triplicate with standards.

Beautiful results! r2 of standard curve = 0.99

|  Well  |  Sample.Name  |  Quantity  |  Cт   |  Dilution  |
|:------:|:-------------:|:----------:|:-----:|:----------:|
|   A1   |     Std1      |     20     | 4.941 |     1      |
|   A2   |     Std2      |     2      | 8.357 |     1      |
|   A3   |     Std3      |    0.2     | 11.26 |     1      |
|   A4   |     Std4      |    0.02    | 14.76 |     1      |
|   A5   |     Std5      |   0.002    | 17.43 |     1      |
|   A6   |     Std6      |   2e-04    | 21.49 |     1      |
|   B1   |     Std1      |     20     | 4.691 |     1      |
|   B2   |     Std2      |     2      | 8.555 |     1      |
|   B3   |     Std3      |    0.2     | 11.21 |     1      |
|   B4   |     Std4      |    0.02    | 15.02 |     1      |
|   B5   |     Std5      |   0.002    | 18.36 |     1      |
|   B6   |     Std6      |   2e-04    | 21.57 |     1      |
|   C1   |     Std1      |     20     | 4.987 |     1      |
|   C2   |     Std2      |     2      | 8.632 |     1      |
|   C3   |     Std3      |    0.2     | 11.45 |     1      |
|   C4   |     Std4      |    0.02    | 14.61 |     1      |
|   C5   |     Std5      |   0.002    | 18.22 |     1      |
|   C6   |     Std6      |   2e-04    | 21.71 |     1      |
|   D1   |     Lib1      |   0.5856   | 9.99  |   0.001    |
|   D2   |     Lib1      |   0.4298   | 10.43 |   5e-04    |
|   D3   |     Lib1      |   0.1427   | 12.01 |  0.00025   |
|   E1   |     Lib1      |   0.4971   | 10.22 |   0.001    |
|   E2   |     Lib1      |   0.2283   | 11.34 |   5e-04    |
|   E3   |     Lib1      |   0.124    | 12.22 |  0.00025   |
|   F1   |     Lib1      |   0.4769   | 10.29 |   0.001    |
|   F2   |     Lib1      |   0.3325   | 10.8  |   5e-04    |
|   F3   |     Lib1      |   0.168    | 11.78 |  0.00025   |


Quantification of original library:


Sample.Name     KAPA.pM    KAPA.nM
-----------   ----------  ----------
Lib1            1,325       1.325


1.3 nM/ul / 4.1 = 0.32 ng/ul

Submitted qPCR amplified samples to Bioanalyzer for accurate estimation of library fragment size.

