---
layout: posts
category: computing
title: antlab workstation guidelines
tags: 
  - reproducible research
  - system administration
  - git
---

## System
Dell T7600 workstation running Ubuntu 12.04

* Processor: Four core XEON E5-2609, 2.4GHz
* Memory: 64GB DDR3 RDIMM 1600 ECC, 8x8GB
* Hard drive: 4x3TB 3.5inch 7200 SATA 6Gb/s in mirrored RAID for redundancy

Note that regardless of Dell stating that the system could run linux, no linux drivers were available for the installed PERC H310 SATA/SAS RAID controller. [Pine Computers](http://pinecomputers.net/) replaced the PERC card with an Adaptec AAC-RAID and were then able to install Ubuntu. 


## File management

File management for organization and reproducibility of results based on 
 guidelines suggested on [biostars](http://www.biostars.org/p/821/) and in [Noble WS (2009)](doi:10.1371/journal.pcbi.1000424) but modified for analyses performed primarily using R. Each top-level directory should contain a README file explaining the contents.

Organizational outline:

- `/home/projects` directory, in which each subdirectory corresponds to a separate project
- `/home/data` directory, which contains data used by more than one project
- `/home/lab` directory, used to hold files miscellaneous lab files such as protocols, lab meeting papers and notes, etc

Within each project directory, I recommend the following directories

- `planning/` directory containing all the files related to the early phase of the project and miscellaneous file
- `data/` directory containing the different data I need to use, can include symbolic links to or from /home/data
- `src/` directory containing bash, python, other scripts
- `R/` directory containing R scripts, ideally with [Roxygen](http://roxygen.org/) documentation
- `results/` directory containing results
    - organize subdirectories with results by date such as "2013-05-18", with each subdirectory containing a driver script with specific parameters for results. For R, this should be in [R markdown]( http://www.rstudio.com/ide/docs/authoring/using_markdown) format
- `doc/` directory with a subdirectory for each manuscript, etc
    - manuscript/
    - figures/
    - tables/


## Version control

[git](http://git-scm.com/) should be used extensively, especially on files in `src` and `R` directories


## Running a job

With 4 cores, only 3 long-term jobs can be run simultaneously. Before scheduling a job, check processor usage by typing in the command line:

~~~
top -n 3
~~~  

You will see the list of commands, updated every 3 seconds,  sorted by their current CPU usage. The long running jobs will be at the very top consuming >85% of CPU time (3d column.) Only 3 jobs consuming >85% of CPU can be run simultaneously. You can also check memory usage by hitting `Shift-f` and selecting `n` then press enter. The active processes will be ordered by memory usage and you can see what percent is still available.


## References

Noble WS (2009) A Quick Guide to Organizing Computational Biology Projects. PLoS Comput Biol 5(7): e1000424