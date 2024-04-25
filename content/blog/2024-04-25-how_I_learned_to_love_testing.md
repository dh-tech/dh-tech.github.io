---
layout: post
title: "Dr. Strangelove - or how I learned to love testing" # Title of the blog post.
date: 2024-04-24T18:45:24Z # Date of post creation.
tags:
- ADayInTheLifeOf
thumbnail: /images/posts/pytests.png
featureImage: /images/posts/pytests.png
featureImageCap: <a href="https://docs.pytest.org">pytest</a>
author: Malte Vogl
summary: "I finally took the time to write tests, you'll never imagine what happend next!"
slug: love-testing
aliases:
- /blog/2024-04-25-love-testing/
- /blog/2024/04/25/love-testing/
---

*I once started programming from a test-driven development perspective, but then projects became more and more and tests less and less. I finally took the time to start writing tests again..*

<!--more-->

Actually it was not only no tests, I also managed to missconfigure my liniting backend a few months ago and did not investigate. You can imagine how my code looked after 
three months of no linting. The project is a simulation model using the agent based modelling (ABM) framework ['mesa'](https://mesa.readthedocs.io), a Python package. I wanted to fullfil not only the basics of 
trustworthy code, like a good documentation and well written code or tutorials, I actually wanted to write an ODD (Overview, Design concepts, Details) protocol. This is a suggested best-practice for 
ABM, e.g. by the [CoMSES Network](https://www.comses.net/resources/standards/), to fully explain the assumptions of the simulation.

I had already finished a larger portion of that ODD document, when I realized a conceptual error in the code, that was actually invalidating my assumptions. So I wrote a small test for that assumption. Which failed... Investigating further, I was confused by my own code, so I started to setup the linter service. Oh boy! It took half a week to clean the code, write tests for all routines, and rewrite part of the ODD. But after adding the [coverage report](https://coverage.readthedocs.io) to my [tox](https://tox.wiki/) routine and slowly reaching almost 100% coverage, I not only fixed the error in my assumption, but managed to increase the performance of the simulation massivly. 

So, while time consuming, I actually love testing now. And not only that, my linter [Ruff](https://docs.astral.sh/ruff/) is now a good friend and not an enemy any more. At least until I revisit another old project, that has not been linted for a few months...  ;-) 


