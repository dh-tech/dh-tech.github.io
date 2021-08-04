---
layout: main
---

<script>
  //# sourceURL=index.js

$(document).ready(function() {
	$(".grid-news").hide();
	$("#main-grid").show();

});

function filter(tag) {
	$("#main-grid").hide();
	$(".grid-news").hide();
	$("#" +tag).show();

}

function initial() {
	$(".grid-news").hide();
	$("#main-grid").show();
}

$(function() {
  setNavigation("News")
})

</script>

<h2 class="section-header">News</h2>

<div class="grid-news" id="main-grid">
	{% assign blog = site.posts | sort: 'date' | reverse %}
	{% for article in blog %}
			<div class="card-body">
	  <a href="{{ site.baseurl }}{{ article.url }}" class="read-more"><h5 class="post-title">{{ article.title }}</h5></a>
	  {% if article.author %}<p class="card-author">by {{article.author}}</p>{% endif %}
	  <p class="card-time">{{ article.date | date: site.date_format }}</p>
	  <p class="card-text">{{ article.excerpt }}</p>
			</div>
	{% endfor %}
</div>

