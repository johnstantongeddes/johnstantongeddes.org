---
layout: posts
categories: 
  - ApGxL
  - MtGIRAFFE
  - ApTranscriptome
title: Tuesday 9 September notes
tags: 
  - EC2
  - Docker
---

### Computing

Here's how I set up my Amazon EC2 instance. Assumes that you already have an Amazon AWS account and some experience with their Dashboard.

1. Log into Amazon AWS and select EC2 from Dashboard. 
    - I used the "US East" Region
2. Create a new "Key Pair" if you don't already have one.
    - "Key Pairs" is an option under the "Network & Security" tab in the left panel.
2. Download key and store in a logical place (e.g. `~/ec2/key_pair.pem`)
3. Confirm that key is private

    chmod 400 key_pair.pem
    
4. Add "SSH" access
    - Open "Security groups"
    - Select "default" group
    - Choose "Inbound" tab and click "Edit"
    - Click "Add rule". Type = SSH. Set source to "My IP" or "Custom IP" for varying access/security levels.
5. From EC2 Dashboard, "Launch Instance"
    - select Ubuntu Server 14.04 or other
    - select key pair that you previously downloaded
6. Log into EC2 instance
    - from EC2 terminal, select Instance
    - click "Connect" button and follow directions to connect by SSH from terminal on local machine, making sure to specificy correct path to key pair
7. Explore Instance
    - `df -h` to look at storage
8. Create EBS volume
    - follow [these steps](http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-add-volume-to-instance.html) to add a volume to Instance if you didn't do so when launching Instance
      - from Console, select Elastic Block Store - Volumes
      - select "Create Volume"
      - specify size, type and location **make sure location is the same as your Instance**
      - once volume is created, select "Action" menu and "Attach Volume". select your instance
      - **first time only or you'll delete data**: format volume using `sudo mkfs -t ext4 /dev/xvdb`
     
9. Attach EBS volume to Instance
    - check that your volume is attached (if you followed step 8, it should be): `lsblk`
    - from your instance terminal, create directory to mount drive to: `sudo mkdir /mnt/datasets`
    - mount drive: `sudo mount /dev/xvdb /mnt/datasets`
    - check that volume is mounted `df -h`
    
All right! Now I have a functioning Ubuntu AMI.

Installed some default programs: R, emacs

~~~
sudo apt-get update
sudo apt-get install r-base-core
sudo apt-get install emacs
~~~

Installed [Sailfish](http://www.cs.cmu.edu/~ckingsf/software/sailfish/) binary and set paths in `~.profile`. Had to rename libz.so.1 as noted [here]() to prevent conflicts with other programs: `mv /home/ubuntu/software/Sailfish-0.6.3-Linux_x86-64/lib/libz.so.1 /home/ubuntu/software/Sailfish-0.6.3-Linux_x86-64/lib/libz.so.1.bak`

### Emacs-ESS

While trying to install Emacs-ESS found that polymode had advanced [development](http://stackoverflow.com/questions/16172345/how-can-i-use-emacs-ess-mode-with-r-markdown) and could install through Emacs using [MELPA](https://github.com/milkypostman/melpa)

- Installed MELPA by adding this to `.emacs`

~~~
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)
~~~

>

- Started emacs and installed markdown-mode and then polymode by

    M-x package-install markdown-mode
    M-x package-install polymode
    
- Added to `.emacs`

~~~
(require 'poly-R)
(require 'poly-markdown)

;;; MARKDOWN
(add-to-list 'auto-mode-alist '("\\.md" . poly-markdown-mode))

;;; R modes
(add-to-list 'auto-mode-alist '("\\.Snw" . poly-noweb+r-mode))
(add-to-list 'auto-mode-alist '("\\.Rnw" . poly-noweb+r-mode))
(add-to-list 'auto-mode-alist '("\\.Rmd" . poly-markdown+r-mode))
~~~

- Re-started emacs and R code within code blocks is runnable in R terminal! 
- Trying to use Docker to run Rstudio on server using this [Dockerfile](https://github.com/ropensci/docker) and this [guide](http://www.alexecollins.com/content/docker-on-amazon-aws/)


### ApTranscriptome

With up-and-running EC2 instance, downloaded trimmed fastq files from https://corelims.uvm.edu/confluence/display/BCP26CAH/Downloads

Started to extract for analysis, but original volume of 200GB wasn't big enough for extracted fastq files. Had to [make a snapshot and then create a new larger volume](http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-expand-volume.html).


### NCBI

While waiting for AWS stuff, setting up NCBI short read archive for Climate Cascade

-----------------------

### Notes

Awesome. Using Docker to compare [genome assemblers](http://nucleotid.es/).




 

