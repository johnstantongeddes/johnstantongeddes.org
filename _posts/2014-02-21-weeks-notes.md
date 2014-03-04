---
layout: posts
categories: ApTranscriptome CCThermBe ApPopGen
title: February 17 - 21 notes
tags: 
  - candidate genes
  - arduino
  - word cloud
---

## 2014-02-17

### ApTranscriptome

Digging into candidate genes

* Serine/threonine-protein kinase PINK1, mitochondrial
    - [protects against mitochondrial dysfunction during cellular stress](http://www.uniprot.org/uniprot/Q9BXM7)
    - expressed at low temperatures
* heat shock protein 90
    - [molecular chaperonin](http://www.uniprot.org/uniprot/P08238)
    - expressed both high and low
* heat shock protein 30
    - [Probably cooperates with other heat shock proteins in the translocation of polypeptides through membranes. It may counteract the altering effect of heat shock on the plasma membrane.](http://www.uniprot.org/uniprot/P25619)
    - expressed high
* protein lethal(2)essential for life
  - [related to heat shock protein 20](http://www.uniprot.org/uniprot/P25619)
  - expressed both high and low



### CCThermBe

Picked up parts at RadioShack

Better guide to [laser trip wire](http://keithkay.com/2013/03/03/arduino-self-calibrating-laser-trip-wire/) that is self-calibrating

the [Make guide](http://makezine.com/projects/laser-tripwire-alarm/)


## 2014-02-18

AMPure Bead purification of double digest samples for ApPopGen.

NR did same for ApAdaPt samples. Unfortunately a problem with an extra sample - we think we narrowed it down to AMPure reagent added to well 45 without any sample. Put 2 known blanks of 75ul AMPure beads in wells 47 and 48. Hope that Qubit confirms that well 45 contains no DNA, while all other wells do.

Writing and modifying code for transcriptome.



## 2014-02-19

### CCThermBe

[Simple test](http://arduino.cc/en/Tutorial/Blink#.UwUV-lRdWhO) - hooked up Arduino and connected program to make a LED flash!

Working on getting program for beam braker to run.


### ApTranscriptome

Made wordclouds for all annotation terms in transcriptome, and a 'comparison cloud' for the GO terms enriched at different temperatures

