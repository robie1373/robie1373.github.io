---
layout: post
title:  "How I use vim"
date:  2016-01-18 
categories: Robie, hacking
published: false
---

# How I use Vim

I keep my .vim in github. I use [pathogen](https://github.com/tpope/vim-pathogen) to handle plugins, which I'm trying to keep to a minimum.

When I get to a new box I

    localhost:~ git clone https://github.com/robie1373/vim
    localhost:~ cd vim/bundle
    localhost:~ for rep in `cat ../packages_list.txt` ; do git clone $rep ; done
    localhost:~ cd .. ; ln -s vimrc ~/.vimrc

Then I just have to remember to git pull from time to time and push any changes I make back up to GH. I have been super happy with this arrangement since I got those habits built up.

