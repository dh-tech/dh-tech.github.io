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