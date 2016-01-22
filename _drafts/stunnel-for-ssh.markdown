---
layout: post
title:  "Stunnel SSH for fun or profit."
date:  2016-01-19
categories: hacking, network
publish: false
---

# Stunnel SSH for fun or profit. (but not both)

There is a decent writeup for getting set up on [this](http://www.unixmen.com/tunnel-ssh0connections-ssl-using-stunnel-debian-7-ubuntu-13-10/) site. 

I'm using OS X for one end of my experiment so there are some differences. Brew only seems to have stunnel3 for example while they are using 4. There are some differences in configuration at the least. 

After some fiddling (make sure you don't copy the wrong cert to the server...) the test works. As expected, the thing resetting ssh was no match for SSL tunneling. Go team proxy!

Here is what I had to do differently from the guide above:


