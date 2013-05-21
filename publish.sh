#!/bin/bash

## Script modified from https://github.com/cboettig/labnotebook/blob/master/publish.sh 

## Compile the site
jekyll

## Copy site to repository for github hosting
git add .
git commit -m "update site"
git pull
git push origin master
echo "Site updated on Github server"

## Send site to Amazon S3 for web hosting
s3cmd sync _site/ s3://johnstantongeddes.org
echo "Site updated on Amazon S3"

