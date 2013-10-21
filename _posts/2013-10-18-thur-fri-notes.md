---
layout: posts
categories: ApTranscriptome
title: Thursday - Friday notes
tags:
  - gene expression
  - CD-HIT
---

### ApTranscriptome

And my suspicions were correct! Using CD-HIT on the oases assembled transcripts reduced them from ... to ... for the full data and from 203 to 99 for the normalized data. 
Quite intriguing that the normalized data did better on transcript recovery than the full data alone; 70 vs 58 original transcripts recovered. 

Posted to Biostar asking about the excess of expected transcripts from assembly.

Useful responses to my [biostars question](http://www.biostars.org/p/83863/#83938) on excess transcripts in assembly.

One suggestion to map reads - select true isoforms as those with the most reads mapping to them.

Botond Sipos, programmer of rlsim, suggested the following:

> I've looked at the pipeline, and here are my tips for investigating this issue from the simulation side:
> 
> First, biases (both in simulated and real data) could confuse de novo assemblers and lead to erroneous transcripts.
> 
> It seems that you are using rlsim's default fragmentation method and GC-dependent efficiency function when simulating fragments. However, the default GC-dependent efficiency profile is quite simplistic and it might introduce biases which are too strong for your purposes. I suggest you run a simulation with the priming biases turned off and fixed efficiencies, just to get a sense of how much the biases affect your results: -f after_noprim_double -e 1.0
> 
> In order to simulate more realistic GC biases, you could use one of the paramter files estimated from real datasets from https://github.com/sbotond/rlsim-params. You migh have to modify the parameter files if you want ot use your own fragment size distribution.
> 
> You could also play with the priming bias parameter -p to tune the strenght of priming biases with the default fragmentation method.


In general, some positive interest - maybe I should develop this into a full program to allow researchers to test various aspects of transcriptome assembly. Emailed Brendan to ask about making a python program. He suggested [configparser](http://docs.python.org/2/library/configparser.html) to allow reading a file with configuration options for all the included programs.

### Helms-Cahan lab meeting

Insect systematics - ants most closely related to bees!

--------------------------

Useful [blog by Lior Pachter on genome assembly and RNA-seq](http://liorpachter.wordpress.com/). Found this [post](http://liorpachter.wordpress.com/2013/08/26/magnitude-of-effect-vs-statistical-significance/) especially interesting.

### Computing 

Cool trick to use bash calculator in shell script

    answer=$(bc <<< "scale=0;($cov * $X * $ml) / $rl")

and can then use `$answer` in downstream commands!



