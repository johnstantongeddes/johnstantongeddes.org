---
layout: posts
categories: 
  - ApPopGen
  - ApAdaPt
title: ddRADseq PCR amplification
tags: 
  - ddRADseq
  - Phusion PCR
  - gut microbes
---


Awesome [open science initiative](https://sciencehack.synbiota.com/#intro). Would make a great teaching opportunity.

In general, this is a pretty cool open science platform: [Synbiota](https://www.synbiota.com/welcome_page/welcome)

From Twitter, [John Edmonstone](http://en.m.wikipedia.org/wiki/John_Edmonstone), a former black slave that taught taxidermy to Charles Darwin!


### Bio Seminar

[Jake Russell](http://www.pages.drexel.edu/~jar337/people.html): Microbial profiling of gut symbionts of ants

- symbionts key for use of poor diets; wood, sap, blood
- Rhizobiales found in ants that have switched to herbivorous diet
- Entomoplasmatales in predatory army ants
- Within Cephalotes, one strain per individual, but multiple strains per colony
- long-lived symbioses in existence for millions of years

My question: how are the mutualisms (assuming actually mutualistic) maintained? In legume - rhizobia and fig - fig wasps, sanctions (or partner fidelity) can occur on 'organ' level. How is this done for the whole gut? Jake suggested that it might occur at colony level. That is...'cheater' strains will be weeded out through expression in individuals...does this make sense? Need to think about and/or model it...

Also pointed out in talk that can use 'blank' sample in Illumina sequencing to quantify contamination. Doh! Should **definitely** do this for RADseq.


### ddRADseq

The final stretch! 

**PCR amplification**

PCR for each size selected band (200, 300, 400) for each library (JSG001, JSG002).

Diluted stock PCR primers 2x to get 10uM working stock solutions.

Shared P1 for both libraries. 

* JSG001 amplify with P2_1 
* JSG002 amplify with P2_2

Used all 10ul of Dynabead-purified sample in PCR, as according to [Dynabeads FAQ]({% post_url 2014-03-20-ddRADseq-dynabeads %}) can use straight in PCR

For each sample, 20 ul reaction volume

Reagent       Volume (ul)
---------    -------------
DNA               10
HF Buffer          5
10mM dNTPs         0.4
PCR1               1
PCR2_X             1
DNA Polymerase     0.2
H20                2.4

-------------------------------------------

Made a seperate master mix for each PCR2 primer (one for each library). Ran PCR

Step                     Cycles       Temp(c)       Time (sec)
---------------------   --------    ----------   --------------
Initial denaturation       1           98          30
Denaturation               8           98          10  
Annealing                  8           65          10
Extension                  8           72          15
Final extension            1           72          5 min

-----------------------------------------------------------------

With the annealing temp from Yihong's protocol with Pogos.

**AMPure purification** of the PCR-amplified product.

Eluted in 35ul.

Sent 2ul for Bioanalyzer, and will run a sample on Qubit tomorrow.



### Reading

Gustafson, D.J., Major, C., Jones, D., Synovec, J., Baer, S.G. & Gibson, D.J. (2014). Genetic Sorting of Subordinate Species in Grassland Modulated by Intraspecific Variation in Dominant Species. PLoS ONE, 9, e91511.

  - how does intraspecific genetic variation in dominant species affect genetic structure of subordinate species?
  - community assembly experiment. cultivars or local ecotypes of *Andropogon gerardii*, *Sorghastrun nutans*, *Schizachyrium scoparium*
  - sif. differences in genetic structure of *Chamaecrista fasciculata* and *Silphium integrifolium* between cultivars and local ecotypes of dominant grasses
  - positive relationship between dominant and subordinate genetic diversiyt
  - "filtered through competitive exclusion of subordinate species genotypes by dominant species during community assembly" 


