---
layout: posts
category: ApTranscriptome
title: Transcriptome assembly notes
tags:
  - Aphaenogaster
  - RNAseq
  - transcriptome
  - FLASH
  - khmer
  - git
---

### ApTranscriptome

Script to run diginorm on interleaved files failed due to error:

    Error: Improperly interleaved pairs HWI-ST1073:326:D25DAACXX:6:1101:1359:1925 HWI-ST1073:326:D25DAACXX:6:1101:1359:1925
making hashtable

This is an outstanding [issue](https://github.com/ctb/khmer/issues/23) with [khmer](https://github.com/ctb/khmer/issues/20).

PYTHONPATH [status]({% post_url 2013-07-26-transcriptome-fun %}) not remembered between sessions so need to set in script. 

Modified /khmer/sandbox/interleave.py script to add Illumina 1.3 fastq format read tag ('/1' or '/2') to sequence names

	#! /usr/bin/env python
	import screed, sys, itertools

	srfile = sys.argv[1]

	n = 1

	for read in screed.open(srfile):
		name = read.name 
		if n%2!=0:
			name += '/1'
		else:
			name += '/2'
		n += 1
		print '@%s\n%s\n+\n%s' % (name,
		                          read.sequence,
		                          read.accuracy,
		                         )

First useful python script! Not much, but have to start somewhere. Saved as [gist](https://gist.github.com/johnstantongeddes/6113112)


Scripts are working! Confirmed that the [--paired option](http://lists.idyll.org/pipermail/khmer/2013-July/000123.html) discards both reads of paired group by running `grep -c @HWI.*/1 A22-00.notCombined.fastq.out.keep` and confirming that the same number as `grep -c @HWI.*/2 A22-00.notCombined.fastq.out.keep`. Note that I first ran this with the pattern only `/1` and this *did not* result in the same number of reads as it also matched at some places in the quality scores. 

Problem in that final normalization is across both paired and unpaired fastq files. Could use `strip-and-split-for-assembly.py` or after recommendation from C. Titus Brown on khmer list, switch order of workflow to 

1) normalize reads using the -p option *first*
2) then merge reads using FLASH
3) run velvet with the extended and notCombined files output from FLASH

Huh. Turns out that Trinity can also do [in silico normalization](http://trinityrnaseq.sourceforge.net/trinity_insilico_normalization.html)

Got XSEDE account for [mason]() so can try this out!


### ApGXL

Email from CP that worrying levels of mortality in 26C Phytotron. Discussed removing the daily ramp of 3C (23-29C in the 26C chamber) but this could cause problems with CP's work as ants from multiple projects are in the same phytotron chambers. Availability of other chambers? Otherwise move to the 23C (20-26C) chamber. Will still experience chronically warmer temps, even if there is overlap with the 20C chamber. 


### Computing

Wow. Did a dumb thing while setting up [ssh](https://help.github.com/articles/generating-ssh-keys) access for my github repository on antlab. Accidentally set `origin` to *wrong* repository and after a pull ended up with lots of commits files that did not belong! Yike. 

[Stackoverflow](http://stackoverflow.com/questions/5815448/how-to-just-undo-a-git-pull) yet again came to the rescue. 

To undo the last `git pull` use `git reset HEAD@{1}`. 

Also note that `git reflog` can be useful as it shows the history of HEAD

https://help.github.com/articles/changing-a-remote-s-url

More git fun. Started working on a development 'transcriptome' branch that pipes together all my working scripts, but breaks everything at this point. Exactly what branches are for! So did

    git checkout -b transcriptome

Made all the changes I wanted. Commited them.

Then changed back to master `git checkout master`

But I actually would like to include updates to the README file in my master branch. [Google](http://jasonrudolph.com/blog/2009/02/25/git-tip-how-to-merge-specific-files-from-another-branch/) yet again gave the answer and it's quite simple

    jstantongeddes@AntLab:~/climate-cascade$ git branch
    * master
    transcriptome
	jstantongeddes@AntLab:~/climate-cascade$ git checkout transcriptome projects/ApTranscriptome/scripts/README.txt
	jstantongeddes@AntLab:~/climate-cascade$ git status
	# On branch master
	# Changes to be committed:
	#   (use "git reset HEAD <file>..." to unstage)
	#
	#	modified:   projects/ApTranscriptome/scripts/README.txt
	#
	# Untracked files:
	#   (use "git add <file>..." to include in what will be committed)
	#
	#	projects/ApTranscriptome/results/01-trimclip/
	#	projects/ApTranscriptome/results/A22-velvet_61/
	jstantongeddes@AntLab:~/climate-cascade$ git commit -m "Update to README.txt in /projects/ApTranscriptome/scripts"
	[master e1e2259] Update to README.txt in /projects/ApTranscriptome/scripts
	 1 file changed, 20 insertions(+), 1 deletion(-)
	 rewrite projects/ApTranscriptome/scripts/README.txt (100%)

And that's it! Changes from the README file on my transcriptome branch are now in master.



