---
layout: main
---

<script>
  //# sourceURL=index.js

$(document).ready(function() {
	$(".grid-blog").hide();
	$("#main-grid").show();

});

function filter(tag) {
	$("#main-grid").hide();
	$(".grid-blog").hide();
	$("#" +tag).show();

}

function initial() {
	$(".grid-blog").hide();
	$("#main-grid").show();
}

$(function() {
  setNavigation("news")
})

</script>

<h2 class="section-header">News</h2>
{% for articles in posts %}
<div class="grid-blog" id="{{ hashtags.name }}">
	{% for article in hashtags.items %}
		<div class="card">
			<div class="bg-image">
				<img class="bg-image-inner" src="{{site.baseurl}}/{{ article.img }}">
			</div>
			<div class="card-body">
				<a href="{{ site.baseurl }}{{ article.url }}" class="read-more"><h5 class="post-title">{{ article.title }}</h5></a>
	  {% if article.author %}<p class="card-author">by {{article.author}}</p>{% endif %}
	  <p class="card-text">{{ article.excerpt }}</p>
	  <p class="card-article-time">{{ article.date | date: site.date_format }}</p>
	  <p class="card-hashtag">#{{ article.tag }}</p>
			</div>
		</div>
	{% endfor %}
</div>
{% endfor %}
<div class="grid-blog" id="main-grid">
	{% assign blog = site.posts | sort: 'date' | reverse %}
	{% for article in blog %}
		{% while forloop.index %}
			{% break %}
		{% endif %}
		<div class="card">
			<div class="card-body">
				<a href="{{ site.baseurl }}{{ article.url }}" class="read-more"><h5 class="post-title">{{ article.title }}</h5></a>
	  {% if article.author %}<p class="card-author">by {{article.author}}</p>{% endif %}
	  <p class="card-text">{{ article.excerpt }}</p>
	  <p class="card-article-time">{{ article.date | date: site.date_format }}</p>
			</div>
		</div>
	{% endfor %}
</div>

