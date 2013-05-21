---
layout: posts
category: ecological genetics
title: Reflections on “Insights from population genetics for range limits of a widely-distributed annual plant”
tags:
  - chamaecrista
  - population genetics
---

This paper is the final of four papers (Stanton-Geddes and Anderson
2011, Stanton-Geddes et al. 2012b, 2012a) from my PhD examining range
limits of the native annual legume *Chamaecrista fasciculata*. Upon
reflection of the publication of this paper (I finished the preliminary
analysis for this paper almost three years ago, and had the first draft
done by my thesis defense in August 2011. Of the four papers, this one
changed the most between drafts and reviews, and most fully represents
my thinking on range limits in *C. fasciculata*), there are three
aspects of this paper that I find to be generally interesting.

First, the “abundant center” model of species’ distributions has been
tested in hundreds of studies using molecular markers (Eckert et al.
2008)\^1^. Most of these studies used allozymes (62%) or microsatellites
(23%) and few used actual sequence data. Thus, the statistic most
commonly reported was expected heterozygosity (H~e~).
[H~e~](http://en.wikipedia.org/wiki/Zygosity#Heterozygosity_in_population_genetics)
is a supposedly simple statistic that’s frustratingly confusing as it
depends on the number of alleles at a locus and the frequency of each
allele. Thus, you can end up with low or high values depending not only
on the number of alleles, but also their evenness. By using actual
sequence data, I was able to calculate a much clearer statistic,
[nucleotide
diversity](http://en.wikipedia.org/wiki/Nucleotide_diversity) which is
simply the average number of nucleotide differences per site between any
two DNA sequences. Interestingly, I found that while H~e~ did not differ
among populations, nucleotide diversity was significantly higher in my
“interior” population than the edge populations. So - given how cheap
and easy it is to get sequence data these days, stop using microsats and
collect sequence data!

Second, ecologists are often interested in whether a population is
expanding or contracting. For example, if a population at a range edge
is expanding, this may suggest the species is currently undergoing range
expansion, but the time scale is too slow for us to observe. In
contrast, a stable or contracting population is not likely expanding its
range (in that direction). It’s difficult to collect enough years of
demographic data for most species to assess this, which is why we turn
to population genetics. In an expanding population (thus evolving
non-neutrally) we will observe an excess of low frequency polymorphisms
compared to expectations, which is captured by negative values of the
statistic [Tajima’s D](http://en.wikipedia.org/wiki/Tajima’s\_D). It’s
worth nothing that Tajima’s D was created to identify sequences that are
evolving non-neutrally, and not just due to population expansion. When I
looked at Tajima’s D in the 9 sequences I had, I found no significant
differences among populations or deviations from the null expectation of
zero.

My PhD adviser Peter Tiffin, based on previous experience with Tajima’s
D not behaving as ‘expected’ (Moeller et al. 2007), prompted me to
perform simulations to evaluate what values I would expect for this
statistic given what is known about the demographic history of this
species. So I plugged a range of likely values into the program
[ms](http://home.uchicago.edu/rhudson1/source.html) given the geologic
history of the locations examined (e.g. last glaciation \~ 16k years
ago) and then calculated Tajima’s D a bunch of times. From these
simulations, I found that there may be **no demographic signal** in
Tajima’s D, even if the population had experienced a substantial
bottleneck followed by expansion. This occurs because the two processes,
contraction and expansion, occur on different timescales and the signal
from the expansion masks the contraction. While I was writing up the
paper, a similar simulation result was published for the opposite
scenario, showing that the demographic signal of an old expansion
persists for a long time during a slow contraction (Arenas et al. 2011).
However, a sobering result is that even with the size of the dataset I
collected, we lacked power to detect to discard the alternatives. This
is where next-gen sequencing comes in so that future studies aren’t
marker limited!

Finally, at a seminar I gave to the EEB department during my PhD,
paleoecologist Ed Cushing pointed out that the northern range limit of
*C. fasciculata* in Minnesota south and west of the Minnesota and
Mississippi Rivers in Minnesota is also the geographic region that would
have been kept clear of trees by fires set by Native Americans. Also,
Native Americans used the rivers as “highways” and often moved seed.
This idea was intriguing. A little searching revealed that there
**were** ethnobotanic uses for *C. fasciculata*. Further, I found that
the Cahokian culture had its epicenter near modern day St. Louis (which
I vaguely knew about having lived in the area), but also included
settlements as far north as modern day Trempeleau, Wisconsin, where you
can still find *C. fasciculata* today. Tantalizingly, the population
structure did indicate that there may have been gene flow north from the
Missouri to Iowa to Minnesota populations, but not to the west. So, the
scenario I envision is that Cahokians moved the seed, which otherwise
has very limited dispersal, from where it was trapped by the Last
Glacial Maximum, into southern Minnesota. The plant was “pre-adapted” to
environmental conditions up to Minnesota, and prospered in the areas
maintained clear of forest by fire. So, while my conclusion today is
that the species is in equilibrium with climate, this may only be
because it was moved “everywhere” by people (before cars and planes!)
and fills the ecological conditions it can tolerate. However, if I had
performed my study 800 years ago, I might have found that it was not
limited by climate and still had the potential to expand its range
northward.

Ecologists are constantly writing about the effects that humans are (and
will) have due to C0^2^ induced climate change, forgetting that humans
have been one of the major factors influencing biota since that
neolithic revolution. It’s worth keeping this in mind when studying the
distribution and abundance of species!

**Footnotes**

1: The best way to assess population size is to go out and measure it
(e.g. the Christmas Bird Survey), year after year. But this isn’t
possible or practical for most species. And in other cases, we’d like a
longer time-scale than is possible (e.g. many generations of a
long-lived species). This is where population genetics comes in.
Molecular genetic diversity can be used as a proxy for effective
population size. Simply put - the more diversity, the larger the
population. Of course, there are all sorts of confounding factors such
as history of colonization, bottlenecks, generation time and gene flow,
but in general, this pattern holds up.

**References**

Arenas, M., N. Ray, M. Currat, and L. Excoffier. 2011. Consequences of
Range Contractions and Range Shifts on Molecular Diversity. Molecular
Biology and Evolution.

Eckert, C. G., K. E. Samis, and S. C. Lougheed. 2008. Genetic variation
across species geographical ranges: the central–marginal hypothesis and
beyond. Molecular Ecology:1170–1188.

Moeller, D. a, M. I. Tenaillon, and P. Tiffin. 2007. Population
structure and its effects on patterns of nucleotide polymorphism in
Teosinte (Zea mays ssp. parviglumis). Genetics 176:1799–1809.

Stanton-Geddes, J., R. G. Shaw, and P. Tiffin. 2012a. Interactions
between Soil Habitat and Geographic Range Location Affect Plant Fitness.
PLoS ONE 7:36015.

Stanton-Geddes, J., P. Tiffin, and R. G. Shaw. 2012b. Role of climate
and competitors in limiting fitness across range edges of an annual
plant. Ecology 93:1604–1613.

Stanton-Geddes, J., and C. G. Anderson. 2011. Does a facultative
mutualism limit species range expansion?. Oecologia 167:149–155.
