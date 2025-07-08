---
layout: post
title: "Introducing Hugo-Bibliography" 
date: 2025-05-23T18:45:24Z # Date of post creation.
thumbnail: 
featureImage: 
featureImageCap: 
author: Tatsat Jha
summary: 
slug: Hugo-bibliography
---

Hugo-Bibliography is a new Hugo plug-in designed to make adding citations into Hugo projects much easier. It can be added as a theme to a Hugo website to generate bibliography pages using the provided shortcodes. At this point, bibliography data needs to be available in CSL-JSON format (that for example can be exported from Zotero). In addition, these shortcodes have a few extra features to allow for filtering out entries from the resulting bibliography. 

Hugo-Bibliography ships with a Bash script to fetch data from Zotero groups automatically during the build process. Furthermore, bibliography entries are exposed using COinS allowing the Zotero browser plugin to recognize and import them.  

Hugo-Bibliography is an open source project. Contributions are encouraged and welcome. If you would like to contribute, please raise issues or open pull request in the [Hugo-Bibliography GitHub repository](https://github.com/dh-tech/Hugo-bibliography).

Hugo-Bibliography is currently being used on the DHTech website on the publications page. For more details, check out Hugo-bibliography's [github repo](https://github.com/dh-tech/Hugo-bibliography)