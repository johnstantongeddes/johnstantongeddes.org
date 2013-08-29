---
layout: posts
category: computing
title: Antlab workstation guidelines
tags: 
  - reproducible research
  - system administration
  - git
modified: 2013-08-29
---

## System
Dell T7600 workstation running Ubuntu 12.04

* Processor: Two four-core XEON E5-2609, 2.4GHz
* Memory: 64GB DDR3 RDIMM 1600 ECC, 8x8GB
* Hard drive: 4x3TB 3.5inch 7200 SATA 6Gb/s in RAID 6 for redundancy

[Note that regardless of Dell stating that the system could run linux](http://xkcd.com/349/), no linux drivers were available for the installed PERC H310 SATA/SAS RAID controller. [Pine Computers](http://pinecomputers.net/) replaced the PERC card with an Adaptec AAC-RAID and were then able to install Ubuntu. 



## Running a job

If you will be running a long (more than 1 hour) or memory intensive (more than ~20 GB) job...

### FIRST: check system status

The antlab system has 8 cores, so only 7 CPU-hungry long-term jobs can be run simultaneously before bad things happen. Before scheduling a job, check processor usage by typing in the command line:

~~~
top -n 3
~~~  

and `q` to exit.

You will see a screen like this: 

<div class="row text-center">
	<img src="{{ site.url }}/assets/img/top-output.png" alt="plot" width="363" height="232">
</div>

which shows a list of the running processes (update every three seconds as specified by `-n 3`, sorted by CPU usage. This screenshot shows 6 jobs using over 100% CPU usage each! Percent usage is for 1 core, so a job using more than 100% is using more than one core.

If you see this...**do not start a new job**. 

Only 6 jobs using >85% of CPU can be run simultaneously before [bad things happen](http://xkcd.com/1084/). Wait until there are free CPUs. 

You can also check memory usage by hitting `Shift-f` and selecting `n` then press enter. The active processes will be ordered by memory usage and you can see what percent is still available. If total memory usage is over 80%...wait to start your job.

### Then, queue your job:

To run a script, use the command

~~~
nohup nice -n 19 Rscript script.r &
~~~

where the `nohup` command specifies that your job will be run without hangups (if your terminal becomes disconnected) and `nice` specifies low priority to avoid swamping system resources, and the `&` means that the job runs in the background so you can continue working in the terminal. Replace `Rscript` with `bash` for a shell script, or `python` fore a python script, etc...

The output of the script will be concatenated to the file **nohup.out** in the working directory.

Note that while the `nice` command will help maintain system resources.

### Stopping jobs

To kill a job that is running, use 

~~~
kill -9 PID
~~~

where PID is the process ID listed from the `top` command. If you have a job running in the background (e.g. with `&` at the end of the line) you can use:

~~~
kill $!
~~~

which kills the last process executed in the background.


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

### Symbolic linking

For large files, use [symbolic linking](http://en.wikipedia.org/wiki/Symbolic_link) as much as possible to save disk space. The command 

~~~
ln -s </path/to/file/yourfile> <linkname>
~~~

will create a link to 'yourfile' in the current directory

### File permissions

The [chmod](http://en.wikipedia.org/wiki/Chmod) command sets file permissions

For a file that you want to protect from accidental changes or overwrites, use

~~~
chmod a-w <file>
~~~

where the `a` means all users and the `-w` means remove write permissions. Similarly

~~~
chmod ug+x <file> 
~~~

would mean that `u` user and `g` group members can execute a file (for example, run a script) or 

~~~
chmod g-r <file>
~~~

would mean that group members cannot read a file, but you still can.


### Removing files

The standard command to remove files is `rm file` but this is IRREVERSIBLE so should be used with caution. The `trash-cli` [program](https://github.com/andreafrancia/trash-cli) is installed for 'recycle bin' funcionality, but I recommend version control as well (see next).

~~~
trash-put <file or directory>
~~~

and 

~~~
restore-trash <file or directory>
~~~

to restore a file from your trash.



## Version control

[git](http://git-scm.com/) should be used extensively, especially on files in `src` and `R` directories. More info coming...


## Software installation

Requires administrator priviledges. 

Software is either installed using the [Ubuntu Software Center](https://wiki.ubuntu.com/SoftwareCenter) or apt-get.

Non-standard or newer versions of programs than are available through the software center are installed into `/opt/software` and symbolically linked from `/usr/local/bin` using 

~~~
ln -s /opt/software/<target> <link>
~~~

so that they are on the $PATH and system-wide accessible. See [for more information](http://askubuntu.com/questions/1148/what-is-the-best-place-to-install-user-apps). May need to set permissions for group executability using

~~~
chmod ug+x <file>
~~~

Software can be installed in home directory for personal use at your own risk.



## System maintenance

System and software updates will be performed the first Monday of every month, so if you are going to schedule long-running jobs around this time let me know if advance.



## References

Noble WS (2009) A Quick Guide to Organizing Computational Biology Projects. PLoS Comput Biol 5(7): e1000424
