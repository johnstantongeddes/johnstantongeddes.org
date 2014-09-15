---
layout: posts
categories: 
  - ApTranscriptome
title: Running RStudio in the cloud
tags: 
  - EC2
  - RStudio
---

With our workstation still down, I've plunged into cloud computing. Today, following [these](http://blog.yhathq.com/posts/r-in-the-cloud-part-1.html) [guides](http://www.r-bloggers.com/instructions-for-installing-using-r-on-amazon-ec2/) I installed and ran RStudio Server on Amazon EC2. Super slick! Now I have the power to scale from 1 to 100s of GB and processors with a few clicks, all while staying with the same interface!

Key steps

1. Log into AWS console and launch an Instance. Create key pair if needed
2. In "Configure Security Group" tab, click `Add Rule`
    - Select "Custom TCP Rule" 
    - Type "8787" in PORT field and set SOURCE to "My IP" (or other depending on security preferences)
3. Launch Instance
4. Log in via ssh
5. Install R and dependencies for R packages (e.g. XML, CURL)
6. From AWS Dashboard, get Public DNS and launch in web browser!

    http://ec2-54-166-220-41.compute-1.amazonaws.com:8787/
    
Voila! RStudio running in the cloud!

Next, create Dockerfile and Makefile for ApTranscriptome repository.

[makefile2graph](https://github.com/lindenb/makefile2graph) may help with Makefile

### Other things

- Cool post about [recommendations in R](http://blog.yhathq.com/posts/recommender-system-in-r.html)



