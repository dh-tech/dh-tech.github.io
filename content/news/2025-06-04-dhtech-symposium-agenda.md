---
layout: post
title: Digital Humanities Tech Symposium - Agenda
slug: Digital Humanities Tech Symposium - Agenda
date: 2025-06-04
event_date: 2025-07-14T13:30:00+01:00
event_location: Lisbon, Portugal
author: DHTech
featured: true
thumbnail:

tags:
  - announcement
  - conference
  - whatshappening
  - event
---

# Digital Humanities Tech Symposium at DH2025 - Agenda

From July 14-18, 2025, [DH2025](https://dh2025.adho.org) will be held at Nova University in Lisbon, Portugal. DHTech will hold a mini-conference at DH2025, **the Digital Humanities Tech Symposium**. Typical DH conference presentations are focussed on the research with a slight nod to the technical details; we want to flip that format and dive more deeply into the technical aspects of the work, while still keeping it in context of the research and domain specifics.

## Agenda - Monday, July 14th, 1:30pm to 6:30pm

<table>
<tr>
<th colspan=3>Session 1 - Moderator: tbd </th>
</tr>

<tr>
<td width="15%">1:30-1:40pm </td>
<td><b>DHTech Steering Committee</b><br>
<i>Introduction</i>
</td>
</tr>

<tr>
<td valign="top">1:40-2:00pm </td>
<td valign="top"><b>Andreas Wagner (remote)</b><br>
<i>TEI2Zenodo</i>
<br>
    <small>
<a href="https://gitlab.gwdg.de/mpilhlt/tei2zenodo">TEI2Zenodo</a> acts as a server that accepts TEI files and uploads them to the Zenodo data repository. It is meant to be part of a CI/CD pipeline, but can also be used in other ways. It goes beyond the already existing GitHub-Zenodo integration by arranging for individual files to be deposits instead of copies of whole git repositories.
The presentation will describe the handling of DOI identifiers that are being created in the Zenodo upload process, ways of using the server besides CI/CD, and need for further development: cleaning up code and adding important further functions.
    </small>
</td>
</tr>

<tr>
<td valign="top">2:00-2:20pm</td>
<td valign="top"><b>Timo Frühwirth</b>
<br>
<i>tei-rdfa: A Python Utility for Extracting RDFa Data from TEI-XML Documents</i><br>
    <small>
    The tei-rdfa Python package extracts RDF data embedded in TEI-XML documents via RDFa. Handling native TEI (Text Encoding Initiative) namespace declaration through  elements, this utility aims to fill a gap left by existing RDFa parsers. The tool presentation will demonstrate the package's key features and error handling capabilities for DH researchers working with TEI+RDFa.
    </small>
</td>
</tr>

<tr>
<td valign="top">2:20-2:40pm</td>
<td valign="top"><b>Gregor Middell</b>
<i><br>
    Turning an XML Database Inside Out</i>
    <br><small>
    The presentation of the DWDS' dictionary writing system, which serves as the backend of a German online dictionary accessed by 2-3 million users each month, will highlight the architectural choices and challenges encountered during its required refactoring.
    </small>
</td>
</tr>

<tr>
<td valign="top">2:40-2:50pm</td>
<td colspan=2><i>Break</i></td>
</tr>

</table>



<table>



<tr>
<th colspan=3>Session 2 - Moderator: tbd</th>
</tr>

<tr>
<td valign="top">2:50-3:10pm</td>
<td valign="top"><b>Robert Casties</b><br>
<i>There and back again - how to preserve your data during migrations</i>
    <br><small>
    Our data often needs to be migrated - from a foreign format into the database, from one database system into another, or from a dying system into an archive format. What can we do to make sure that no data is lost in the processs? I will present some approaches from hard-won experience, from end-to-end statistics to bookkeeping conversions to full round-trip migration and comparison.
    </small>
</td>
</tr>

<tr>
<td width="15%" valign="top">3:10-3:30pm</td>
<td valign="top"><b> Benjamin Kiessling </b><br>
<i>When Automatic Text Recognition doesn't work and how to fix it</i>
    <br><small>
    Automatic Text Recognition is widely used in the Digital Humanities but certain materials and scholarly practices are not well served by current methods.  A gander through the principal technical causes of these deficiencies and how current research trends in the Machine Learning exacerbate them will be completed by a short presentation of a text recognition tool that aims to address them.
    </small>
</td>
</tr>

<tr>
<td valign="top">3:30pm-3:50pm</td>
<td><i>Coffee Break</i></td>
</tr>
</table>



<table>

<tr>
<th colspan=3>Session 3 - Moderator: tbd</th>
</tr>

<tr>
<td width="15%" valign="top">3:50-4:10pm</td>
<td valign="top"><b>Rebecca Koeser</b><br>
<i>Undate in Action</i>
    <br><small>
    Undate is an ambitious, in-progress effort to develop a pragmatic Python package for computation and analysis of temporal information in humanistic and cultural data, with a particular emphasis on uncertain, incomplete, or imprecise dates and with support for multiple calendars. Undate draws on and improves implementations and data modeling from digital humanities projects from multiple different institutions.

We propose a “Tool Presentation” of Undate, using an interactive code notebook to
demonstrate current functionality and capabilities of this library. The demonstration would introduce Undate and UndateInterval objects, and show how they can be initialized directly with numbers or strings for dates with unknown digits, or by parsing dates written out in a supported calendar, and can be used for comparison and calculations, including sorting, comparing precision, determining whether one date or date interval falls within or overlaps another, and calculating durations of dates and intervals.
    </small>
</td>
</tr>

<tr>
<td valign="top">4:10-4:30pm</td>
<td valign="top"><b>Paul Girard</b><br>
<i>
    Historical data visual exploration meets static web technologies</i>
    <br><small>
    In this talk I will present how we created a visual exploration website to publish the [REG⋅ARTS dataset](https://regarts.huma-num.fr/) by using static web technologies. The REG⋅ARTS datasets gathers the transcriptions of students registrations from the École des beaux arts de Paris between 1813 and 1968. To publish it we designed a static website which still offers state of the art exploration features such as a faceted search engine, projections on historical maps and network visualisation without using any server nor external APIs.
    </small>
</td>
</tr>

<tr>
<td valign="top">4:30-4:50pm</td>
<td valign="top"><b>Olivia Wikle</b><br>
<i>From Metadata to Static Site: A Technical Demonstration of CollectionBuilder for Digital Exhibits</i>
    <br><small>
    This tool demonstration will introduce CollectionBuilder (https://collectionbuilder.github.io/), an open-source framework built on Jekyll for generating static, metadata-driven digital exhibits. It will walk through the technical workflow of creating a basic site by integrating CSV metadata, digital asset files, YAML configuration, and Markdown content, then illustrate customization options such as swapping the default image viewer for a IIIF viewer. The session will touch on the framework’s modular code structure, use of embedded open-source libraries for interactivity, and approaches to local development, deployment, and long-term maintenance.
    </small>
</td>
</tr>

<tr>
<td valign="top">4:50-5:10pm</td>
<td valign="top"><b>Moritz Mähr, Moritz Twente</b>
<br><i> One Template to Rule Them All: Interactive Research Data Documentation with Quarto</i>
    <br><small>
    We introduce the Open Research Data Template, a GitHub-based framework designed to streamline the publication and reuse of open research data through executable, interactive documentation using Quarto. By integrating narrative, metadata, and multi-programming-language code (Python, R, Julia, ObservableJS) into cohesive websites, the template lowers barriers to meaningful reuse and sustainable archiving of research workflows. We will demonstrate the template's structure, automation pipeline, and real-world applications through projects such as DigiHistCH24, Stadt.Geschichte.Basel, DHBern, and Decoding Inequality 2025.
    </small>
</td>
</tr>

<tr>
<td valign="top">5:10pm-5:20pm</td>
<td><i>Break</i></td>
</tr>

</table>

<table>

<tr>
<th colspan=3>Session 4 - Moderator: tbd </th>
</tr>

<tr>
<td width="15%" valign="top">5:20-5:40pm</td>
<td valign="top"><b>Jamie Folsom</b><br>
<i>Extending Recogito Studio with Plugins</i>
    <br><small>
    Recogito Studio is a new open source platform for annotation of TEI-XML Text, IIIF images and manifests and PDFs. 

While the software is focused on real-time collaboration, user and document management, and import and export of documents and annotations in standard formats, some adopters have needs that go beyond those core features.

This talk is an introduction to the Recogito Studio plugin framework and software development kit, which makes it easy for developers to add new functionality to the software without modifying the core codebase.
    </small>
</td>
</tr>

<tr>
<td valign="top">5:40-6:00</td>
<td valign="top"><b>Jose Hernandez</b><br>
<i>The QuantumRandomWalks package and its use for quantum link prediction in historical citation networks</i>
    <br><small>
    This presentation will walk users through using the QuantumRandomWalks package for quantum link prediction on historical citation networks. It will provide a humanities-friendly intro to Qiskit and its features for developers that may want to build upon our work.
    </small>
</td>
</tr>

<tr>
<td valign="top">6:00-6:20pm</td>
<td valign="top"><b>Tibor Kálmán</b><br>
<i>Clouds for Crowds - Implementing federated AAI for the Digital Humanities</i>
    <br><small>
    With the increase in data-driven research, Research Infrastructures such as the DARIAH need to ensure secure access to the data, tools and workflows they offer. This presentation aims to highlight the necessity and advantages of implementing federated identity management and authorisation; describes the technological background of such an AAI solution in the humanities and motivates the DH-Tech community to adopt the AARC Blueprint Architecture supported by a Compendium being developed in the context of the AARC-TREE project.
    </small>
</td>
</tr>

<tr>
<td valign="top">6:20pm-6:30pm</td>
<td valign="top"><b>DHTech Steering Committee</b><br>
<i>Goodbye and Thank You</i>
</td>
</tr>
</table>
