---
layout: post
title: Zope 2.10 in Docker, or Applied Software Archaeology
tags:
- ADayInTheLifeOf
author: Robert Casties
date: 2020-08-17T15:52:34.380Z
thumbnail: /images/uploads/screenshot-old-zope.png
featureImage: /images/uploads/screenshot-old-zope.png
featureImageAlt: screenshot of Zope documentation
excerpt: I wanted to migrate the old website on the server to a Docker image for Zope so I could use it in a docker-compose setup together with a standard PostgreSQL container. How hard could that be?
aliases:
- /blog/2020-08-17-zope-2-10-in-docker-or-applied-software-archaeology/ 
---

During the COVID-19 lockdown in March 2020 I was in my home office and I was reading all those stories on Twitter of people who suddenly learned painting or playing the guitar and I envied them for the time and energy for something new they seemed to have. My personal work situation felt pretty much the same except for the missing commute to our institute, but I decided to use some time to look at some of our old projects on our old servers and either migrate or delete the websites and shut down the servers. This suddenly felt creative and refreshing like a spring cleaning with Marie Condo.

The first website I looked into was still running on an Apple XServe on Mac OSX 10.5 and it was written in Python 2.4 (compiled from source) using the Zope 2.10 web application framework (downloaded as tar file) connected to a PostgreSQL 8 database (also compiled form source) last modified in 2010.

I wanted to migrate the old setup to a Docker image for Zope so I could use it in a docker-compose setup together with a standard PostgreSQL container. How hard could that be? And then I could reuse the Docker image also for other old projects based on Zope 2.10.

I started by checking the official [Python Docker image](https://hub.docker.com/_/python) but the earliest version was Python 2.7. Luckily I found a [charming old page](https://old.zope.org/Products/Zope/2.10.8/Zope-2.10.8-released/newsitem_view) in time so I knew I need not try any Python later than 2.4. So I had to compile my own version of Python. That should be easy, we used to do that a lot back in those days... 

I whipped up a new `Dockerfile` based on Ubuntu 18.04, added the `build-essentials`, downloaded and unpacked the `Python-2.4.6.tgz` sourcecode, and ran the classic `configure`, `make`, `make install`. In reality the process was of course messier and included a lot of head-scratching, countless `docker build` runs and searches for obscure error messages on the internet. My favourite bits are that I needed to patch the auto-generated `Setup` file to enable zlib when compiling Python (I never got bz2 to work), patch the `psycopg2` PostgreSQL adapter to accept Postgres 10s version number as sufficiently current and that the `Zope-2.10.13-final.tgz` file on the internet was not a gzipped tar file but a gzipped gzipped tar file...

But at the end of the day (or the next...) I had a nice [Dockerfile](https://gitlab.gwdg.de/MPIWG/research-it/docker-legacy-zope/-/blob/master/legacy-zope-2.10/Dockerfile) that will produce a Docker image with Zope 2.10 every time I run `docker build` instead of the "classic" manual installation on a single server.

Then I just needed to create a `docker-compose.yml` file for the specific website, that would start the Zope 2.10 container and mount the local directory with the old Zope instance and data files into the container. I added a PostgreSQL 10 container and loaded a plain-SQL dump of the old database into the new database server and voila! I had the old website running on new hardware in a repeatable and somewhat self-documenting setup (preserving old bugs and security holes).

I put the Docker files and a little documentation on our public repository as [docker-legacy-zope](https://gitlab.gwdg.de/MPIWG/research-it/docker-legacy-zope/-/tree/master) and the generated Docker images on [Docker hub](https://hub.docker.com/r/robcast/legacy-zope) so you can use these images to migrate your own old Zope 2.10 websites to Docker (you have my sympathy).
