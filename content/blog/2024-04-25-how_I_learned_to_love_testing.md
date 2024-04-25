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

*Once upon a time, I started programming from a test-driven development perspective, but then there were more and more projects and fewer and fewer tests. I finally took the time to start writing tests again...*

<!--more-->

Actually, it was not only that there were no tests, I also managed to misconfigure my liniting backend a few months ago and never investigated why it didn't work anymore. You can imagine how my code looked after 
three months of no linting. The project I was finally writing tests for is a simulation model that uses the agent based modelling (ABM) framework [mesa](https://mesa.readthedocs.io), a Python package. My goal was to not only follow basic best practices of 
trustworthy code, like good documentation, clean code, and providing tutorials, I also wanted to write an ODD (Overview, Design concepts, Details) protocol. This best practice for 
ABMs aims at providing a full explaination of the assumptions that go into a simulation. It is recommended, for example, by the [CoMSES Network](https://www.comses.net/resources/standards/).

I had already finished a large portion of my ODD document, when I realized a conceptual error in the code. And even worse, that error was invalidating my assumptions! So I wrote a small test for the invalidated assumption. Which failed... Investigating further, I was confused by my own code, so I started to fix the linter setup. Oh boy! It took half a week to clean the code, write tests for all routines, and rewrite part of the ODD. But after adding the [coverage report](https://coverage.readthedocs.io) to my [tox](https://tox.wiki/) routine and slowly reaching almost 100% coverage, I not only fixed the error in my assumption, but managed to increase the performance of the simulation massivly. 

So, while time consuming, I actually love testing now. And not only that, my linter [Ruff](https://docs.astral.sh/ruff/) is now a good friend and not an enemy any more. Well, at least until I revisit another old project that has not been linted for a few months...  ;-) 


