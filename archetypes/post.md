---
title: "{{ replace .Name "-" " " | title }}" # Title of the blog post.
date: {{ .Date }} # Date of post creation.
description: "Article description." # Description used for search engine.
featured: true # Sets if post is a featured post, making it appear on the sidebar. A featured post won't be listed on the sidebar if it's the current page
# featuredButtonTitle: #featuredButtonTitle and featuredButtonLink adds a button next to a featured Post, both must be 
# featuredButtonLink: #set to add the button
draft: true # Sets whether to render this page. Draft of true will not be rendered.
toc: false # Controls if a table of contents should be generated for first-level links automatically.
# menu: main
usePageBundles: false # Set to true to group assets like images in the same folder as this post.
featureImage: "/images/path/file.jpg" # Sets featured image on blog post.
featureImageAlt: 'Description of image' # Alternative text for featured image.
featureImageCap: 'This is the featured image.' # Caption (optional).
thumbnail: "/images/path/thumbnail.png" # Sets thumbnail image appearing inside card on homepage.
shareImage: "/images/path/share.png" # Designate a separate image for social media sharing.
codeMaxLines: 10 # Override global value for how many lines within a code block before auto-collapsing.
codeLineNumbers: false # Override global value for showing of line numbers within code block.
figurePositionShow: true # Override global value for showing the figure label.
showRelatedInArticle: false # Override global value for showing related posts in this series at the end of the content.
event_date: 2024-02-15T15:00:00 # if post is an announcement of an event/meetup, the date and time of the event
event_location: Virtual # if a post has a location, this will be added to the event date in the header of a post (e.g. "... at 9:00 am ET in Boston, MA")
registration: https://zoom.registartion.ink/ # if post is an announcement of a meetup or another event with registration, the link to register. It will show up on the top of the post.
categories:
  - Technology
tags:
  - Tag_name1
  - Tag_name2
---

**Insert Lead paragraph here.**
