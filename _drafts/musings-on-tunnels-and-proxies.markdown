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

## The setting

A laptop at 192.168.1.5 on network 192.168.1.0/24 behind firewalls etc...
An AWS box at x.x.x.x on the internet under my control.

1. Initiate stunnel connection from laptop to AWS. (Complete)
2. SSH through stunnel from laptop to AWS box. (Complete)
3. ??? Force all traffic on AWS box toward 192.168.1.0/24 to go through stunnel from step 1.
4. Set up route on laptop to forward return traffic back to AWS box over stunnel. Laptop is effectively NATing for AWS.
5. Start nmap on AWS box and scan 192.168.1.0/24 through the stunnel.

## The ssh solution

    sudo ssh -w 0:0 root@host

is close. It's important to note that you must be root on both ends to create the tun interface. This sucks so if I can iron out the issues with getting that command to acutally work, I'll start to look at how I can de-escalate the privs.

You must put in /etc/ssh/sshd__conf

    PermitTunnel yes

Remember to reload or restart the ssh service after editing the config file. 

This works great between two proper linux boxes. With a Chromebook, there is shill in the way which appears to go around cleaning up unused interfaces / devices. that can be disabled by:

    sudo stop shill
    sudo start shill BLACKLISTED_DEVICES=tun0

Thanks to the [crouton](https://github.com/dnschneid/crouton/wiki/Using-Cisco-AnyConnect-VPN-with-openconnect) wiki for that tidbit.

At this point I am not getting the error

    channel 0: open failed: administratively prohibited: open failed

which implies either an sshd config error, ssh config error, or a firewall rule blocking the tunnel. Since I know the AWS side is working, it must be on the CB side. There is no sshd in the mix here, so ssh or firewall must be it.


