---
layout: post
title:  "RLF: locally installed software"
date:  2016-01-18 
categories: Robie, hacking, infrastructure
---
last edited {{ date }}

# While the goal is to have almost nothing installed on the local machine, there are a few things that are going to be required. For now at least. This is a running list of things that I'm installing locally and why.

1. [Docker](2016-01-18-setting-up-docker-on-chromebook): Used to abstract away the ugly, dependency ridden, environment polluting and otherwise un-installable junk that I find myself using all the time. Like programming languages and network or security tools.
2. [Vim](2016-01-18-how-i-use-vim): A dude's got to edit.
3. [Crouton](2016-01-18-crouton-to-enable-RLF): By default the CB doesn't do Docker. Crouton allows you to run full Ubuntu (or other Linux) alongside ChromeOS. A bit heavy handed, but the best I could come up with.
4. screen: terminal emulator pretty much has to be local. I assume.

## Other things that take time on the local box

1. Generate and install ssh keys for various remote hosts.
2. Chrome Apps for Skype, Dropbox, an IRC. These are just web wrappers, so not really a local app. Also, they sync with the chrome profile.
