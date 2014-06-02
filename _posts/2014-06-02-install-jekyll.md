---
layout: posts
categories: 
  - Open Science
  - Computing
title: Installing Jekyll 2.0
tags: 
  - Jekyll
  - Pandoc
  - ruby
---

I recently went through some computer trouble (Ubuntu 14.04 broke suspend on my aging Lenovo ThinkCentre M90z). As all my other computers happily run 12.04 LTS, I decided to roll-back and 'clean-up' my installation. Of the many re-installs I had to do, [Jekyll](http://jekyllrb.com/) was one of the trickiest, partly because it had updated to v2.0 since I last installed it. Here's the closest I could re-create to what I did for future reference.

1. Install [ruby 1.9.1 and rubygems](https://leonard.io/blog/2012/05/installing-ruby-1-9-3-on-ubuntu-12-04-precise-pengolin/).

    sudo apt-get install ruby1.9.1 
    sudo apt-get install ruby1.9.1-dev

2. Set as default ruby version

    cd /etc/alternatives
    sudo ln -sf /usr/bin/ruby1.9.1 ruby

Check with `ruby --version`.

3. Install nodejs to avoid [missing javascript runtime](http://stackoverflow.com/questions/9202324/execjs-could-not-find-a-javascript-runtime-but-execjs-and-therubyracer-are-in)

    sudo apt-get install nodejs

4. Install json
  
    sudo gem install json  

5. Install Jekyll

    sudo gem install jekyll

6. Install [Jekyll-pandoc plugin](https://github.com/dsanson/jekyll-pandoc-plugin) for using Pandoc markdown

    gem install pandoc-ruby

and follow the install directions. Note that since the update to Jekyll 2.0, this plugin is broken. I took the [simple fix](https://github.com/dsanson/jekyll-pandoc-plugin/pull/11) of changing `pygments` to `highlight` in my *_plugins/pandoc_markdown.rb* file, but there is a [fixed fork](https://github.com/davepwsmith/jekyll-pandoc-plugin).

That's it! `jekyll --version` should work!

