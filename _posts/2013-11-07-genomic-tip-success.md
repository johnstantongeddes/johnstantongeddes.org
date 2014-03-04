---
layout: posts
categories: ApTranscriptome ApGenome
title: Thursday notes
tags:
  - Genomic-tip
  - gedit
  - markdown
---

### ApTranscriptome

uclust finished in 9 hours. Reduced assembly to 105,536 transcripts.
Total reduction after CAP3 and uclust of only about 20,000 transcripts. 
Unlikely to be enough to resolve issue of unique transcripts from each colony for same gene. Next step is to `blastx` against other ant transcriptomes.

### ApGenome

Success! Yesterday's trial of using Buffer ATL (from DNeasy kit) and Buffer G2 (from Genomic-tip kit) showed that the G2 buffer is not lysing cells.

Nanodrop results - average of 2-3 trials per sample

Sample              ng/ul     260:280
----------------  --------   ----------
G2 - aliquot 4      15.2       0.47
G2 - DNA             1.8       0.26
ATL - aliquot 4      26        4.4
ATL - DNA           22.2       1.63 
--------------------------------------

Aliquot 4 is the elution, prior to precipitating with isopropanol and ethanol. 

The concentration of the G2 aliquot is suspect given the terrible quality (lower 260 than 280 peak). The [wikipedia page on nucleic acid quantitation](http://en.wikipedia.org/wiki/Nucleic_acid_quantitation) supports this showing a sample with 100% protein and 0% nucleic acid to have 260:280 at 0.57. The G2 DNA sample confirms this with DNA concentration near zero.

In contrast, the ATL aliquot has high concentration and a low 280 peak indicating little protein contamination. The ATL DNA has high concentration and good quality.  


### Computing

Testing out new text editors: [Scribes](http://scribes.sourceforge.net/) has promise. Nice interface.

Added markdown syntax-highlighting following this [guide](http://blog.micronarrativ.org/blog/2012/06/03/scribes-og-markdown/). Interesting to see that a [gedit plugin](http://www.jpfleury.net/en/software/gedit-markdown.php) exists to preview html of markdown within gedit.

The "Markdown plugin" initially failed to work, but when running from the terminal I saw this error message:

~~~
Traceback (most recent call last):
File "/home/jsg/.local/share/gedit/plugins/markdown-preview/__init__.py", line 86, in <module>
    with open(confFile, "wb") as confFile:
IOError: [Errno 13] Permission denied: '/home/jsg/.config/gedit/gedit-markdown.ini'
~~~

Went to the specified file '/home/jsg/.config/gedit/gedit-markdown.ini' and changed permissions

    sudo chmod a+rwx gedit-markdown.ini

and ran fine after that!

