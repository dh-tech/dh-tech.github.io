---
layout: post
title: Sharing Users between Django projects
tag: 2simple2mention
author: Malte Vogl
date: 2020-11-26T13:18:30.939Z
img: /assets/images/uploads/picsum.jpg
img-credits: Lorem Picsum https://picsum.photos/
excerpt: You should never share Django databases between projects! But sometimes....
---
For a small project we had two Django projects dealing with different parts of a workflow. Since the system was supposed to run on an air-gapped sub-system of the infrastructure our usual authorization approach using OpenIDConnect was no option. 

In v0.5 we simply had to user databases, one for each project, and had to manage the users between both systems. However, even changing the password was very complicated for us admins, not even talking about the users themselfs.

In came the idea of [Djangos database routers](https://docs.djangoproject.com/en/3.1/topics/db/multi-db/): Why not simply have system A look into the user database of system B? 

The first thing that comes up on StackOverflow: NEVER DO THIS!

Still it was a viable option for our setup... The router was relatively fast to write, but somehow it brougt some strange errors?! Maybe the small toy database for one system was not capable of the comp