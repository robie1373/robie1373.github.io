#!/bin/bash

filename="$(date +%Y)/$(date +%F)-$1.markdown"
touch $filename
postTitle=$(echo $1 | tr - " ")

echo -e "---" >> $filename
echo -e "layout: post" >> $filename
echo -e "title: $postTitle " >> $filename
echo -e "date:  $(date +%F)" >> $filename
echo -e "categories: hacking, infrastructure" >> $filename
echo -e "publish: false\n---\n\n# " >> $filename

sleep 1
vim $filename
