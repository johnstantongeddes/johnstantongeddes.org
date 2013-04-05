---
layout: posts
categories: 
  - ecological genetics
title: wednesday
tags:
  - aphaenogaster
  - pandoc
  - transcriptomics
  - simulations
---

## Research

Continuing working on permits for Aphaenogaster collection.

### Transcriptomics

Planning to simulate sequence data to develop and evaluate
transcriptome assembly pipeline, follow method of Vijay et al 
(2013)

- Vijay, N., Poelstra, J. W., Künstner, A., & Wolf, J. B. W. (2013).
Challenges and strategies in transcriptome assembly and differential gene
expression quantification. A comprehensive in silico assessment of RNA-seq
experiments. Molecular Ecology, 22(3), 620–634. doi:10.1111/mec.12014
- Moreau, C. S., & Bell, C. D. (2013). Testing the Museum Versus Cradle Tropical Biological Diversity Hypothesis: Phylogeny, Diversification, and Ancestral Biogeographic Range Evolution of the Ants. Evolution, n/a–n/a. doi:10.1111/evo.12105


## Lab notebook

Test of showing R code in lab notebook

```r
x <- seq(1:10)
y <- x^2
summary(lm(y~x))
plot(x,y)
```

To actually run this R code and generate results, simply run through `knitr`


## 

When converting pandoc to pdf, the default latex settings gave HUGE margins. [stackoverflow](http://stackoverflow.com/questions/13515893/set-margin-size-when-converting-from-markdown-to-pdf-with-pandoc) gave the answer:

    pandoc -V geometry:margin=1in -o output.pdf input.md

## Reading

- Ormeño-Orrillo, E., Servín-Garcidueñas, L. E., Imperial, J., Rey, L., Ruiz-Argueso, T., & Martinez-Romero, E. (n.d.). Phylogenetic evidence of the transfer of nodZ and nolL genes from Bradyrhizobium to other rhizobia. Molecular Phylogenetics and Evolution. doi:10.1016/j.ympev.2013.03.003

- Gelman, A. (2013). P Values and Statistical Practice. Epidemiology, 24(1), 69–72. doi:10.1097/EDE.0b013e31827886f7








