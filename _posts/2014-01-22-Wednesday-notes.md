---
layout: posts
categories: ApTranscriptome ApGXL
title: Wednesday notes
tags: 
  - Arudino
  - laser-trip
---

* Lab Safety training

### ApTranscriptome

Using [RCurl](http://www.omegahat.org/RCurl/) to read data files into script. 

**Problem 1**

Started trying to read file from Google Drive but not straighforward as the "share link" provides link to a download page, not the file itself. After a discouraging amount of Googling, *finally* found this [link](http://mynixworld.wordpress.com/2013/02/23/transparently-download-from-google-drive/) that had the solution: Use **https://googledrive.com/host/<FILEID>** where <FILEID> is the file hash. This provides a direct link to file that worked as such:

```
library(RCurl)
myURL <- getURL("https://googledrive.com/host/0B75IymziRJ_9Tlg1U1Vxbjk1bzg")
```

Also uploaded file to AWS where it read without problem.

**Problem 2**

`read.table` did not work with error "line 226 did not have 12 elements". The cause of this error was an apostrophe in the **best.hit.to.nr** column: "gi|106322|pir||B34087 hypothetical protein (L1H 3' region)" that lead to all following text until subsequent apostrophe being read as a single cell. 

Fixed this by using `read.csv`.

```
file <- read.csv(textConnection(myURL), header = TRUE, sep = "\t")
```

Try this for zipped files

```
zz <- read.csv(gzfile("zipped.file.gz"))
```

** Gene Enrichment Analysis **

Working through vignette for [topGO](http://www.bioconductor.org/packages/2.12/bioc/html/topGO.html) to do gene set enrichment analysis

Wrote simple R function to create a geneid2go.map file in this format

~~~
068724  GO:0005488, GO:0003774, GO:0001539, GO:0006935, GO:0009288
119608	GO:0005634, GO:0030528, GO:0006355, GO:0045449, GO:0003677, GO:0007275
049239	GO:0016787, GO:0017057, GO:0005975, GO:0005783, GO:0005792, GO:0004345, GO:0005788, GO:0047936, GO:0006098, GO:0005488, GO:0006006, GO:0055114, GO:0016491
067829	GO:0045926, GO:0016616, GO:0000287, GO:0030145, GO:0005739, GO:0000166, GO:0005575, GO:0006099, GO:0005524, GO:0008152, GO:0006102, GO:0005759, GO:0005975, GO:0004449, GO:0055114, GO:0016491
106331	GO:0043565, GO:0000122, GO:0003700, GO:0005634, GO:0045597, GO:0006355, GO:0045595, GO:0045449, GO:0003677, GO:0007275
214717	GO:0004803, GO:0005634, GO:0008270, GO:0003677, GO:0000228, GO:0046872, GO:0046983
133103	GO:0015031, GO:0005794, GO:0016020, GO:0017119, GO:0000139
121005	GO:0005576
155158	GO:0005488
160828	GO:0005488
~~~

Up to three functions in the "RxNseq.R" source file of required functions for "ApTranscriptome_TR.Rmd" - need to keep organized!


## ApGXL ##

Bioanalyzer results - odd that same as the last round, the first two samples have very poor qualities though the Nanodrop results look good. Andrew is running qPCR as third validation.


```r
library(pander)
```

```
## 
## Attaching package: 'pander'
## 
## The following object is masked from 'package:knitr':
## 
##     pandoc
```

```r
Sample <- c("RQ3-1", "RQ1-1", "RQ3-2", "RQ1-2", "RQ3-3", "RQ1-3", "RQ3-1", "RQ1-1", 
    "RQ3-2", "RQ1-2", "RQ3-3", "RQ1-3", "Q1-1", "Q1-2", "Q1-3")
Colony <- c("2012 A1", "2012 A1", "EW200", "EW200", "EW1000", "EW1000", "2012 A1", 
    "2012 A1", "EW200", "EW200", "EW1000", "EW1000", "2012 A1", "EW200", "EW1000")
Num_ants <- c(rep(c(3, 1), 6), rep(1, 3))
Extraction <- c(rep("R", 6), rep("R+Q", 6), rep("Q", 3))
Nano_conc <- c(31.6, 13.9, 26.6, 16.2, 60.3, 21.4, 18.9, 0.7, 0.7, 5.9, 5.5, 
    1.6, 3.8, 2.1, 3.5)
Nano_qual <- c(1.6, 1.7, 1.8, 1.9, 1.7, 1.6, 2.1, NA, 0.9, 0.5, 3, 1.6, 2, 1.6, 
    2.3)
Bio_conc <- c(0.1, 0.7, 1.9, 1.4, 7.4, 5.1, 7.6, NA, NA, NA, 5.7, NA, 1.7, NA, 
    NA)
RIN <- c(2.7, 8.8, 7.5, 7.1, 9.6, 9.5, 5.9, NA, NA, NA, 9.7, NA, 7.7, NA, NA)

rnatable0120 <- cbind(Sample, Colony, Num_ants, Extraction, Nano_conc, Nano_qual, 
    Bio_conc, RIN)

samples <- c("2012 A1", "EW200", "EW1000", "ApGXL 21-C HS", "ApGXL 13-D HS", 
    "ApGXL 10-F HS", "2012 A1", "EW200", "EW1000")
extraction <- c(rep("R", 6), rep("R+Q", 3))
Nano_conc <- c(148, 50, 68, 384, 62, 75, 3.3, 10, 10)
Nano_qual <- c(1.7, 1.6, 1.6, 2.1, 1.6, 1.6, 0.01, 2.97, 0.02)
Bio_conc <- c()
RIN <- c()

rnatable0120 <- cbind(samples, extraction, nano_conc, nano_qual)
```

```
## Error: object 'nano_conc' not found
```

```r

pandoc.table(rnatable0120, style = "rmarkdown", caption = "Nanodrop (Nano) and Bioanalyzer (Bio) results for different RNA extraction methods. Concentration in ng/ul. Extraction: R = RNAzol; R+Q = RNAzol + RNeasy")
```

```
## 
## 
## |  Sample  |  Colony  |  Num_ants  |  Extraction  |  Nano_conc  |
## |:--------:|:--------:|:----------:|:------------:|:-----------:|
## |  RQ3-1   | 2012 A1  |     3      |      R       |    31.6     |
## |  RQ1-1   | 2012 A1  |     1      |      R       |    13.9     |
## |  RQ3-2   |  EW200   |     3      |      R       |    26.6     |
## |  RQ1-2   |  EW200   |     1      |      R       |    16.2     |
## |  RQ3-3   |  EW1000  |     3      |      R       |    60.3     |
## |  RQ1-3   |  EW1000  |     1      |      R       |    21.4     |
## |  RQ3-1   | 2012 A1  |     3      |     R+Q      |    18.9     |
## |  RQ1-1   | 2012 A1  |     1      |     R+Q      |     0.7     |
## |  RQ3-2   |  EW200   |     3      |     R+Q      |     0.7     |
## |  RQ1-2   |  EW200   |     1      |     R+Q      |     5.9     |
## |  RQ3-3   |  EW1000  |     3      |     R+Q      |     5.5     |
## |  RQ1-3   |  EW1000  |     1      |     R+Q      |     1.6     |
## |   Q1-1   | 2012 A1  |     1      |      Q       |     3.8     |
## |   Q1-2   |  EW200   |     1      |      Q       |     2.1     |
## |   Q1-3   |  EW1000  |     1      |      Q       |     3.5     |
## 
## Table: Nanodrop (Nano) and Bioanalyzer (Bio) results for different RNA extraction methods. Concentration in ng/ul. Extraction: R = RNAzol; R+Q = RNAzol + RNeasy (continued below)
## 
##  
## 
## |  Nano_qual  |  Bio_conc  |  RIN  |
## |:-----------:|:----------:|:-----:|
## |     1.6     |    0.1     |  2.7  |
## |     1.7     |    0.7     |  8.8  |
## |     1.8     |    1.9     |  7.5  |
## |     1.9     |    1.4     |  7.1  |
## |     1.7     |    7.4     |  9.6  |
## |     1.6     |    5.1     |  9.5  |
## |     2.1     |    7.6     |  5.9  |
## |             |            |       |
## |     0.9     |            |       |
## |     0.5     |            |       |
## |      3      |    5.7     |  9.7  |
## |     1.6     |            |       |
## |      2      |    1.7     |  7.7  |
## |     1.6     |            |       |
## |     2.3     |            |       |
```


