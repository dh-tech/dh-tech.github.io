---
layout: post
title: "Embracing Endings: Principles for Digital Longevity and Their Importance for Research Software Engineers"
date: 2023-08-07T19:54:55Z
tag: 2Simple2Mention
img: assets/images/posts/endingprinciples.png
img-credits: Screen capture from the Endings Project website.
author: Moritz Mähr
excerpt: "In the digital realm, ensuring the longevity of projects is crucial. The University of Victoria's \"Endings Project\" presents guidelines for digital project sustainability. These principles divide projects into five areas: Data, Documentation, Processing, Products, and Release Management, each with its own set of standards to assure sustainability."
---

In the ever-evolving digital landscape, the concept of digital longevity
is of paramount importance. As Research Software Engineers or Data
Stewards, we are all too familiar with the challenges of maintaining,
preserving, and ensuring the usability of our digital projects in the
long run - possibly even beyond its end of life (or end of funding).
[The Endings Project](https://endings.uvic.ca/),
spearheaded by the University of Victoria, offers a set of principles
that provide a roadmap to ensure the sustainability of digital projects.
This blog entry is an introduction to the principles and an example of
their application in the
[Stadt.Geschichte.Basel](https://stadtgeschichtebasel.ch/)
project in Switzerland.

## The Background of the Endings Principles

The Endings Principles were born out of the University of Victoria's
extensive experience with a broad variety of SSHRC and CFI-funded DH
projects over the past 15 years. The multidisciplinary team behind the
Endings Project includes research faculty from several disciplines,
programmers, and librarians, all of whom have collective theoretical and
practical experience in various fields.

The Endings Principles for Digital Longevity provide a valuable
framework for ensuring the sustainability and longevity of digital
projects. Incorporating these principles into the work of Research
Software Engineers allows for the assurance that the projects will stand
the test of time and continue to provide value to the scholarly
community for years to come.

## What are the Endings Principles?

[The Endings Principles for Digital
Longevity](https://endings.uvic.ca/principles.html) are a
set of guidelines that divide digital projects into five primary
components: Data, Documentation, Processing, Products, and Release
Management. Each component is governed by specific principles that
ensure the longevity and sustainability of digital projects.

> 1. Data\
>     Data is the expression of the source information, knowledge, and
>     expertise of our researchers. The following principles apply to
>     data:
>
>     1. Data is stored only in formats that conform to open standards
>         and that are amenable to processing (TEI XML, GML, ODF, TXT).
>     2. Data is subject to version control (Subversion, Git).
>     3. Data is continually subject to validation and diagnostic
>         analysis.
>
> 2. Documentation
>
>     1. Data models, including field names, descriptions, and controlled
>         values, should be clearly documented in a static document that
>         is maintained with the data and forms part of the products.
>     2. All rights and intellectual property issues should be clearly
>         documented. Where possible the Data and Products should be
>         released under open licenses (Creative Commons, GNU, BSD, MPL).
>
> 3. Processing\
>     Processing code is written and maintained by the project technical
>     staff, and is also subject to version control. Processing code
>     provides all the following functions:
>
>     1. Relentless validation: all processing includes
>         validation/linting of all inputs and outputs and all validation
>         errors should exit the process and prevent further execution
>         until the errors are resolved.
>     2. Continuous integration: any change to the source data requires
>         an entire rebuild of the site (triggered automatically where
>         possible).
>     3. Code is contingent: while code is not expected to have
>         significant longevity, wherever possible, all code should follow
>         Endings principles for data and products.
>
> 4. Products\
>     Products are the project outputs intended for end-users, typically
>     in the form of websites or print documents. The following principles
>     apply to products intended for the web:
>
>     1. No dependence on server-side software: build a static website
>         with no databases, no PHP, no Python.
>     2. No boutique or fashionable technologies: use only standards with
>         support across all platforms, whose long-term viability is
>         assured. Our choices are HTML5, JavaScript, and CSS.
>     3. No dependence on external libraries or services: no JQuery, no
>         AngularJS, no Bootstrap, no Google Search.
>     4. No query strings: every entity in the site has a unique page
>         with a simple URL that will function on any domain or IP
>         address.
>     5. Inclusion of data: every site should include a documented copy
>         of the source data, so that users of the site can repurpose the
>         work easily.
>     6. Massive redundancy: every page contains all the components it
>         needs, so that it will function without the rest of the site if
>         necessary, even though doing so means duplicating information
>         across the site.
>     7. Graceful failure: every page should still function effectively
>         even in the absence of JavaScript or CSS support.
>
>     These principles are tempered by the following concessions:
>
>     8. Once a fully-working static site is achieved, it may be enhanced by
>     the use of other services such as a server-side indexing tool (Solr,
>     eXist) to support searching and similar functionality.
>     9. The use of an external library may be necessary to support a
>     specific function that is too complex to be coded locally (such as
>     mapping or cryptography). Any such libraries must be open-source and
>     widely-used, and must not themselves have dependencies.
>
> 5. Release Management\
>     Release management handles the public release of products. These
>     principles apply to release management:
>
>     1. Releases should be periodical and carefully planned. The
>         "rolling release" model should be avoided.
>     2. A release should only be made when the entire product set is
>         coherent, consistent, and complete (passing all validation and
>         diagnostic tests).
>     3. Like editions of print works, each release of a web resource
>         should be clearly identified on every page by its build date and
>         some kind of version number.
>     4. Web resources should include detailed instructions for citation,
>         so that end-users can unambiguously cite a specific page from a
>         specific edition.
>     5. URLs for individual resources within a digital publication
>         should persist across editions. Any moved, retired, or deleted
>         resources no longer available at a previously accessible URL
>         should be redirected appropriately.

## Why Do We Need Them?

The digital world is susceptible to what experts warn could be a new
"digital dark age." Our capacity to produce digital information is
outpacing our ability to preserve and access that knowledge for the long
haul. This is particularly essential for digital humanities (DH)
projects, where the disregard of preserving and future-proofing these
projects jeopardizes their future. The Endings Principles provide a
practical solution to these challenges, offering a roadmap for the
successful conclusion, archiving, and preservation of digital projects.

## How Can You Use Them for Your Work?

The Endings Principles can be applied to any digital project, regardless
of its scale or complexity. By adhering to these principles, Research
Software Engineers can ensure that their projects are sustainable. This
means that the projects will remain accessible, usable, and valuable for
the foreseeable future, far beyond the estimated 10-year lifespan of
most current formats.

## Application of Endings Principles for Digital Longevity in Stadt.Geschichte.Basel

In [Stadt.Geschichte.Basel](https://stadtgeschichtebasel.ch/),
more than 70 historians and archaeologists are comprehensively
researching the history of Basel. The project runs from 2017 to 2025 and
has a budget of more than \$9 million. It focuses on current and
under-researched topics such as the industrial and commercial history of
the 19th and 20th centuries and the history of migration. The project
also aims to explore the regional and international connections of
Basel\'s history on the economic, political, and cultural levels. The
project will result in a series of nine books, to be published in
stages, covering the history of Basel from the Celts to the present. The
project\'s website will provide access to documents, data, and materials
for research and teaching, as well as insights into the processes of
creating historical research and public interest in the city\'s history.
To achieve this, the project has established a team of five people
responsible for managing the researched data and creating the necessary
software tools.

In the Stadt.Geschichte.Basel project, we recognize the importance of
ensuring the longevity of our digital resources. To this end, we have
adopted the Endings Principles for Digital Longevity, which guide our
approach to managing and preserving our digital assets.

### Principle 1: Durability by Design

We design our digital resources with durability in mind. This includes
the use of open, non-proprietary formats for our data and metadata,
which ensures that our resources remain accessible and usable over time.
Our online portal is designed to be continuously updated and maintained
even after the end of the project period, ensuring its long-term
viability.

### Principle 2: Openness and Transparency

We are committed to openness and transparency in our work. Our online
portal provides public access to a wide range of data on Basel\'s
history, and we actively engage with our stakeholders, including
researchers, media, schools, memory institutions, and the public, to
ensure that our work meets their needs and expectations.

### Principle 3: Respect for User Community

We regularly survey our users to understand their needs and
expectations, and we involve them in the development of our work
packages. We establish focus groups that include researchers and
partners involved in the project, who we consider as data producers. In
our team, we have two Data Stewards. This role is responsible for
surveying the working methods and needs of authors, defining the focus
of research data management, creating requirements specifications, and
offering consulting, workshops, and colloquia as needed. We also try to
understand the users of our online portals and educational materials,
who we consider as data consumers. To gather feedback, we survey these
focus groups at irregular intervals using online questionnaires and
workshops. The topics we cover in these surveys are directly relevant to
the development of our project.

### Principle 4: Recognition of Complexity

We recognize the complexity of digital preservation and have established
a dedicated role of Data Stewards to manage our digital resources. Our
Data Stewards are responsible for various tasks, including the
management of image data, cartographical material, literature and
tables. They also participate in ongoing training and networking
activities to stay up-to-date with the latest developments in research
data management and digital humanities.

### Principle 5: Sustainable Resourcing

We understand that digital preservation requires sustainable resourcing.
We have allocated specific workloads for tasks related to digital
preservation, and we have established partnerships with various
institutions, such as the University Library of Basel, University of
Bern and the Land Registry and Survey Office, to ensure the long-term
preservation and accessibility of our digital resources.

By adhering to these principles, we aim to ensure that the digital
resources produced by the Stadt.Geschichte.Basel project remain
accessible, usable, and meaningful for future generations.
