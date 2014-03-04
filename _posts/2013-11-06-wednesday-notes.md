---
layout: posts
categories: ApTranscriptome ApGenome
title: Wednesday notes
tags:
  - cap3
  - uclust
  - Genomic-tip
---

### ApTranscriptome

Following up on yesterday's [conversation]({% post_url 2013-11-05-Tuesday-VGN-meeting %}):

uclust is the same as CD-HIT but faster because it doesn't search all transcripts, but stops when probability of a match declines below threshold.

Ran CAP3 on Trinity assembled transcripts from all reads.

    cap3 Trinity.fasta -f 50 -a 50 -k 0 -p 90 -o 100 > Trinity_cap3.out

Took about 2 hours to run.

Started with 126,172 transcripts.

15,250 transcripts were clustered into 6,567 contigs, leaving 110,922 singlets and a total of 117,489. Some reduction...but far from the half expected based on read mapping.

Ran uclust on this fasta file to further reduce.

   # sort
   uclust --sort Trinity_cap3.fasta --output Trinity_cap3_sorted.fasta
   # cluster by 90% similarity threshold
   uclust --input Trinity_cap3_sorted.fasta --uc Trinity_cap3_uclust.fasta --id 0.90


### ApGenome

Last trial yielded zero DNA. Bummer.

Round 3 of Genomic-tip extraction - use overnight incubation with Proteinase K as with first round.

- 2 sets of 10 ants, 2 per tube
- 1 set homogenized in 200ul Buffer ATL (used in first round) 
- 1 set homogenized in 200ul Buffer G2 (included in Genomic-tip kit)
- no RNAse A. High concentration of RNAse relative to DNA may degrade DNA

Finish extraction tomorrow morning.

### Teaching

Very interesting project for [teaching stats with R](http://ncarchedi.github.io/swirl/). Worked through the first 5 minutes or so. Nice integration of text, video and figures.

### Stats

Some great stuff from Andrew Gelman on [spurious](http://andrewgelman.com/2013/07/28/50-shades-of-gray-a-research-story/) [results](http://andrewgelman.com/2013/11/06/marginally-significant/)

### Reading

Nosek, B.A., Spies, J.R. & Motyl, M. (2012). Scientific Utopia II. Restructuring Incentives and Practices to Promote Truth Over Publishability. Perspectives on Psychological Science, 7, 615–631.

  - fascinating self-reflection by authors after an exciting initial result
  - great commentary by [Andrew Gelman](http://andrewgelman.com/2013/07/28/50-shades-of-gray-a-research-story/)


