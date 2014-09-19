---
layout: posts
categories: 
  - ApTranscriptome
title: Friday notes
tags: 
  - McNemar test
  - marginal homogeneity
---

### ApTranscriptome

With analysis finally online, back to finishing ms. 

Residual detail is how to deal with the analysis of the contingency table of expression patterns for each species.
I posted [this question to CrossValidated](http://stats.stackexchange.com/questions/116066/chi-squared-test-when-variables-dependent):

~~~
For a square matrix, is it appropriate to use a chi-squared distribution when each level of the variables are assumed to have the same overall frequency? 

Specifically, I'm analyzing a dataset of the number of genes that have increased expression in an experimental treatment in two related species. My data look like this, with species 1 on the columns and species 2 on the rows:

<pre><code>                  Low       Intermediate      High
 Low              2594          163            405

 Intermediate     1350          558            155

 High              467           65            322

</code></pre>

I *a priori* expect each class to have been the same in the common ancestor of the species (off-diagonals = 0). That is:

<pre><code>                  Low       Intermediate      High
 Low              3786          0              0

 Intermediate      0          1425             0

 High              0           0              868

</code></pre>

My question is which of the off-diagonal cells have diverged more than expected by chance. 

As a simple first pass, I've modified the standard `chisq.test` (in R) to use the *overall* total for each class (Low, Intermediate, High) rather than the marginal total for each class (assuming species independent...which they aren't). 

<!-- language: lang-r -->
    
    # data
    d <- matrix(c(2594L, 1350L, 467L, 163L, 558L, 65L, 405L, 155L, 322L), nrow=3, ncol=3)

    # row and column sums
    rs <- rowSums(d)
    cs <- colSums(d)

    # grand mean for each class
    gm <- (rs + cs) / sum(d * 2)

    Ec <- outer(gm, gm, "*") * sum(d)


where `Ec` is the Expected value for each cell using the grand mean for each class.

Is it reasonable to use a chisq distribution to determine if the observed values deviate from the expected values by more than chance? 

<!-- language: lang-r -->
   
    Ec.chistat <- sum((data-Ec)^2 / Ec)
    pchisq(Ec.chistat, df=(nrow(data)-1) * (ncol(data)-1), lower.tail = FALSE)


I realize I could probably use a GLM for this, but it's convenient to keep in table format to directly address which of the off-diagonals have increased more than expected by chance.

Note: for comparison, the standard chisq assuming independence of variable would be:

<!-- language: lang-r -->
   
    rs <- rowSums(d)
    cs <- colSums(d)
    n <- sum(d)
    (E <- outer(rs, cs, "*")/n)
    chistat <- sum((d - E) ^ 2 / E)
    pchisq(chistat, df=(nrow(d)-1) * (ncol(d)-1), lower.tail = FALSE)
~~~
>

And quickly received a response recommending [McNemar's paired odds ratio test](http://en.wikipedia.org/wiki/McNemar's_test), with the caveat that it only works for *binary* outcomes. Some Wikipedia revealed that there are at least two generalizations of the McNemar test to square tables with more than two observations. This [SAS paper](http://www2.sas.com/proceedings/forum2008/382-2008.pdf). 

Found two R packages that include functions for Stuart-Maxwell or Bhapkar's test:

[coin](http://www.uni-kiel.de/psychologie/rexrepos/posts/npStuartMaxwell.html)

[irr](http://cran.r-project.org/web/packages/irr/irr.pdf)

Can I connect these to something like the `chisq.posthoc` test from the [polytomous](http://cran.r-project.org/web/packages/polytomous/index.html) package? Or just report overall lack of marginal homogeneity and then pick out the cells with the greatest deviation?


