---
title: DHTech Blog
description: Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
layout: main
---

<script>
  //# sourceURL=index.js
$(function() {
  setNavigation("Blog")
})
</script>

<div style="margin-top: 20px">
	<h2 class="section-header">DH Tech Blog</h2>
	<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
	<div class="grid-blog">
		{% assign blog = site.blog | sort: 'date' | reverse %}
			{% assign first = blog.first %}
			<div class="first-article">
				<img style="max-height: 100%" src="{{ first.img }}">
				<div class="bottom-fixed">
					<a href="{{ first.url }}" class="post-title" style="color: white">{{ first.title }}</a>
					<p id="hashtag">{{ first.tag }}</p>
				</div>
			</div>
		{% for article in blog %}
		{% if article != first %}
		<div class="card" style="width: 14em">
		  <div class="bg-image">
		    <img style="position: absolute; max-width: 100%;" src="{{ article.img }}">
			<div class="hashtag">
				<p id="hashtag">{{ article.tag }}</p>
			</div>
		  </div>
		  <div class="card-body">
		    <h5 class="post-title">{{ article.title }}</h5>
		    <p class="card-text">{{ article.excerpt }}</p>
		    <p class="article-time">{{ article.date | date: site.date_format }}</p>
		    <a href="{{ article.url }}" class="read-more">Read more <i class="fa fa-chevron-right"></i></a>
		  </div>
		</div>
		{% endif %}
		{% endfor %}
	</div>
</div>
