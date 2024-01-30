---
excerpt: "For a small project running on Django, I was planning to do a tiny upgrade. Just changing from Django 2 to Django 3... What could possibly go wrong!"
featureImage: /images/posts/Django_2.1_landing_page.png
thumbnail: /images/posts/Django_2.1_landing_page.png
featureImageAlt: Screenshot of the landing page for a new Django 2.1 install
featureImageCap: "Django Software Foundation, Landing page for Django 2.1"
author: Malte Vogl
published: true
date: 2020-08-14T09:33:00
title: Simply updating the Django version ...
tags: 
- ADayInTheLifeOf
slug: updating-django-version
aliases:
- /blog/2020-08-14-vogl-django/
- /blog/2020/08/14/Simply-updating-the-Django-version-.../
---

Doing the sensible thing, as a first step I updated to the latest Django version, which was 3.1 at that time. Trying the debugging server of Django just gave me lots of errors. After a short search I realized, that of course also Django CMS needs to be updated, which was done in a breeze. Retrying the server, lots of new interesting errors.

Since they looked like Python errors, I just froze the requirements from the Python virtual environment, and deleted the old environment. Since the server also needed some updates, I ran those as well, which gave me the latest Ubuntu LTS (18.04., since 20.04.1 was not yet released).

However, the system need a reboot... After a short consideration with colleagues I dared to do the reboot! But.. no SSH shell access was coming back. Did the server needed a passphrase on reboot? Or did someone remove the cable in the server rack? Or did I accidentally crash the whole system :-/

There was only one option! Physically moving my self to the server in question. But! There was a key I needed to access the rack! In a room, to which only three persons had access, who all where in holiday on that day. And only one of the three had a key to the safe, in which the server rack key was securely deposited! Which was forgotten the following day. Which was a Friday! Arghhhhh!

The following Monday was my lucky day. Not only did I was able to enter the room with the safe, I also got the key to the server. And there were people answering my phone call, who let me in the data center. I even found a terminal and was able to connect it to the server!

Ok, the strange keyboard layout let to some problems with the root password, and I did not find any problems with the network settings, and there where no error messages at all, that gave any clue why the server was not reachable from the outer world, ... but in the end, after only a short hour of interesting detective work on the OS level, I just tried a reboot. And it worked. Sh..

Having thus not solved one problem, I tried the next. What went wrong with the Django update? After first trying to compile the latest Python version on Ubuntu 18, which lead to another interesting problem with uwsgi (the system Python version and the version in the v-env need to be exactly the same!), I realized my simple error: The latest Django CMS version was not yet supporting the latest Django version (django-cms 3.7.4 vs django 3.1 was the problem, only django 3.0.9 is supported !). One more time removing the virtual environment and this time installing the correct version numbers, I restarted the systemd daemon for uwsgi, and voila! as good as new.

My lesson learned: Never touch a run.. well, you know the story...
