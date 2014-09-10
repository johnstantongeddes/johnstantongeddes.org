---
layout: posts
categories: 
  - MtGIRAFFE
  - ApTranscriptome
  - Open Science
title: Wednesday 10 September notes
tags: 
  - EC2
  - Docker
---

### Open science

Pondering on the merits of Docker and virtual machines (Amazon machine image; AMI), found this [thread](https://groups.google.com/forum/#!topic/ropensci-discuss/QogAhS-tajQ) on [r-opensci google group](https://groups.google.com/forum/#!forum/ropensci-discuss).

I asked:

> My question: what's the advantage of Docker over an amazon EC2 machine image? 
> 
> I've moved my analyses to EC2 for better than my local university cluster. Doesn't my machine image achieve Carl's acid test of allowing others to build and extend on work? What do I gain by making a Dockerfile on my already existing EC2 image?  Being new to all this, the only clear advantage I see is a Dockerfile is much smaller than a machine image, but this seems like a rather trivial concern in comparison to 100s of gigs of sequence data associated with my project.

Prompt replies from Titus Brown:

> the argument here --
> ivory.idyll.org/blog/vms-considered-harmful.html
> -- which I have apparently failed to make simply and clearly, judging
> by the hostile reactions over the years ;) -- is that it doesn't really matter
> *which* approach you choose, so much as whether or not the approach you do
> choose permits understanding and remixing.  So I would argue that neither an
> AMI nor a fully-baked Docker image is sufficient; what I really want is a
> *recipe*.  In that sense the Docker community seems to be doing a better job of
> setting cultural expectations than the VM community: for Docker, typically
> you provide some sort of install recipe for the whole thing, which is the
> recipe I'm looking for.
> tl; dr? No technical advantage, but maybe different cultural expectations.

and in detail from Carl Boettiger:

> Nice to hear from you and thanks for joining the discussion.  You ask 
a very key question that ties into a much more general discussion 
about reproducibility and virtual machines.  Below I try and summarize 
what I think are the promising features of Docker.  I don't think this 
means it is *the solution*, but I do think it illustrates some very 
useful steps forward to important issues in reproducibility and 
virtualization.  Remember, Docker is still a very young and rapidly 
evolving platform. 
> 
> 1) Remix.  Titus has an excellent post, "Virtual Machines Considered 
Harmful for reproducibility" [1] , essentially pointing out that "you 
can't install an image for every pipeline you want...".  In contrast, 
Docker containers are designed to work exactly like that -- reusable 
building blocks you can link together with very little overhead in 
disk space or computation.  This more than anything else sets Docker 
apart from the standard VM approach. 
> 
> 2) Provisioning scripts. Docker images are not 'black boxes'. A 
"Dockerfile" is a simple make-like script which installs all the 
software necessary to re-create ("provision") the image.  This has 
many advantages: (a) The script is much smaller and more portable than 
the image. (b) the script can be version managed (c) the script gives 
a human readable (instead of binary) description of what software is 
installed and how. This also avoids pitfalls of traditional 
documentation of dependencies that may be too vague or out-of-sync. 
(d) Other users can build on, modify, or extend the script for their 
own needs.  All of this is what we call the he "DevOpts" approach to 
provisioning, and can be done with AMIs or other virtual machines 
using tools like Ansible, Chef, or Puppet coupled with things like 
Packer or Vagrant (or clever use of make and shell scripts). 
> 
> For a much better overview of this "DevOpts" approach in the 
reproducible research context and a gentle introduction to these 
tools, I highly recommend taking a look at Clark et al [2]. 
> 
> 3) You can run the docker container *locally*.  I think this is huge. 
In my experience, most researchers do their primary development 
locally.  By running RStudio-server on your laptop, it isn't necessary 
for me to spin up an EC2 instance (with all the knowledge & potential 
cost that requires).  By sharing directories between Docker and the 
host OS, a user can still use everything they already know -- their 
favorite editor, moving files around with the native OS 
finder/browser, using all local configurations, etc, while still 
having the code execution occur in the container where the software is 
precisely specified and portable.  Whenever you need more power, you 
can then deploy the image on Amazon, DigitalOcean, a bigger desktop, 
your university HPC cluster, your favorite CI platform, or wherever 
else you want your code to run.  [On Mac & Windows, this uses 
something called boot2docker, and was not very seamless early on.  It 
has gotten much better and continues to improve. 
> 
> 4) Versioned images.  In addition to version managing the Dockerfile, 
the images themselves are versioned using a git-like hash system 
(check out: docker commit, docker push/pull, docker history, docker 
diff, etc).  They have metadata specifying the date, author, parent 
image, etc.  We can roll back an image through the layers of history 
of its construction, then build off an earlier layer.  This also 
allows docker to do all sorts of clever things, like avoiding 
downloading redundant software layers from the docker hub.  (If you 
pull a bunch of images that all build on ubuntu, you don't get n 
copies of ubuntu you have to download and store).  Oh yeah, and 
hosting your images on Docker hub is free (no need to pay for an S3 
bucket... for now?) and supports automated builds based on your 
dockerfiles, which acts as a kind of CI for your environment. 
Versioning and diff\ing images is a rather nice reproducibility 
feature. 
> 
> [1]: http://ivory.idyll.org/blog/vms-considered-harmful.html 
> [2]: https://berkeley.box.com/s/w424gdjot3tgksidyyfl 
> 
> If you want to try running RStudio server from docker, I have a little 
overview in: https://github.com/ropensci/docker 


### ApTranscriptome

Still getting EC2 instance up and running for analysis. 200GB volume wasn't large enough for extracted fastq files, so had to [expand volume and extend file system](http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-expand-volume.html) to 300GB. 

Extracted tar archive of trimmed fastq files to expanded volume.

Created R script (`scripts/sailfish_quantification.R`) to perform gene expression quantification. Used code previously in tech report that I removed [to separate the bioinformatic processing from the R analysis](https://github.com/johnstantongeddes/ApTranscriptome/commit/c9e27ad89847dd7f2291a12a3dcae25bbc64e483) (commit c9e27ad89847dd7f2291a12a3dcae25bbc64e483) with plan to make expression data itself downloadable as this is much smaller to store and easier to work with. The general idea is that the expression data itself could be recreated from the raw reads themselves available from short-read archive.


### MtGIRAFFE

Continuing analysis using `haplosim.r` function. First commit of script into repository:

https://github.com/johnstantongeddes/MtGIRAFFE





