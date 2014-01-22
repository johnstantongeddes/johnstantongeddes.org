#!/bin/bash

## Script modified from https://github.com/cboettig/labnotebook/blob/master/publish.sh 

# Convert all Rmarkdown (Rmd) posts to md
cd _posts
for f in *.Rmd
do 
    echo "Processing $f to md"
    knit -n $f # Rmd to md only, no html generated
    mv $f _Rmd_cache/. # move Rmd file so only md file is used by jekyll. Rmd_cache should be 
                      # excluded in _config.yml
done
cd ../

## Compile the site
jekyll build

## Copy site to repository for github hosting
git add -A
git commit -m "update site"
git pull
git push origin master
echo "Site updated on Github server"

## Send site to Amazon S3 for web hosting
s3cmd sync _site/ s3://johnstantongeddes.org
echo "Site updated on Amazon S3"

