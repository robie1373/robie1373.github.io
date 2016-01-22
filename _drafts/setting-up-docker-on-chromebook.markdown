---
layout: post
title:  "Installing Docker on chromebook"
date:  2016-01-18 
categories: Robie, hacking, infrastructure
published: false
---

# What was not apparent to me...

    # Apt-get install docker.io
    # [output]
    # sudo docker -d -D 
    
The last line starts the docker deamon. Don't even bother trying to use service... yet. I think that can be used to make it run as an actual daemon.

I'm encountering some issues building an image on the CB. Preliminary investigations indicate it may be related to the kernel configuration (which I haven't found yet). 
