---
title: EditionCrafter at DH Inside Out
slug: edition-crafter-dh2024
date: 2024-08-30T09:00:15-04:00
author: Nick Laiacona
thumbnail: /images/posts/ec-logo.png
summary: At the DH Inside Out Workshop at DH2024, Performant Software Solutions LLC presented EditionCrafter, a tool for creating digital critical editions and archives. 
tags:
    - HippoChallenge
    - conference
---

# EditionCrafter at DH Inside Out

<img src="/images/posts/ec-logo.png" width="300px" style="float:right; padding: 15px">

At the DH Inside Out Workshop at DH2024, we presented [EditionCrafter](https://cu-mkp.github.io/editioncrafter/), a tool for creating digital critical editions and archives. EditionCrafter provides a way to build high quality web based user interfaces for transcriptions and translations that accompany images of the primary sources. The tool comes in two parts: a command line interface and a React component library.

The command line tool is used during the build step to turn a TEI/XML file into a IIIF Manifest and a set of textual fragments, one per layer per page. These can then be put on any type of static web server, including GitHub Pages.

The React component then consumes the generated manifest to display the edition. It is provided both as a NPM package for inclusion in a React App and a UMD build suitable for plain HTML/JS/CSS websites.

DH Inside Out provided the perfect forum for this talk. We were able to dive into the technical details of the tool and even do a live coding demo. We hope that other software developers working in the Digital Humanities on similar projects will find this tool useful and we welcome feedback.

<img src="/images/posts/ec-screenshot.png" width="100%" style="padding: 15px">



