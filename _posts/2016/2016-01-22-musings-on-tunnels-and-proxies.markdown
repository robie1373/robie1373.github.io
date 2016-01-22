---
layout: post
title: musings on tunnels and proxies 
date:  2016-01-22
categories: hacking, infrastructure
publish: false
---

# So no docker on your Chromebook, huh?

Yeah. So that's a thing apparently. I guess all those tools are going to have to be pushed further out then. Right now I'm thinking docker on AWS with a tunnel back to the local machine. For commands that just process something or just talk to the Intertubes (recon-ng) stunnel + ssh is sufficient. Other commands like nmap need to talk all over the LAN. I think this implies a proxy of sorts in order to get things like nmap to work. Port by port forwarding clearly isn't the answer there.

The scenario: 
AWS - tools like nmap are installed and run from here.
local machine - sitting inside some firewall somewhere.

Assume access to AWS from local machine.
Assume a tunnel can be built from local machine out to AWS. Something like stunnel.

Require that tunnel be initiated from local machine
Require that commands be typed on local machine
Require that all traffic and output from command flow through tunnel

Possible workflow:

1. Initiate tunnel from LM to AWS
2. ssh from LM to AWS through tunnel
3. Start command on AWS
4. Squid routes all traffic from command to LM, LM routes all traffic to LAN.
5. Profit!

* Squid is the big boy on the block and should be able to do anything I need. It would provide flexibility and stability. It is likely to be the heaviest and require the most configuration.

* SSH is an old standby. I can't remember a way to force a command to run all traffic through it in my scenario.
