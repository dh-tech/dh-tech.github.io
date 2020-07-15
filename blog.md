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
	console.log(tag);
	$("#main-grid").hide();
	$(".grid-blog").hide();
	$("#" +tag).show();
	
}

function initial() {
	$(".grid-blog").hide();
	$("#main-grid").show();
}

$(function() {
  setNavigation("Blog")
})

</script>

<div style="margin-top: 20px">
	<a id="button"><i class="fa fa-caret-up"></i></a>
	<button onclick="location.href='{{ site.baseurl }}/admin/index'" class="primary-btn" style="float: right; margin: 0"><i class="fa fa-edit"></i>&nbsp;Compose</button>
	<h2 class="section-header">DH Tech Blog</h2>
	<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
	{% assign blog = site.blog | group_by: 'tag' %}
	<div class="filter">
		<button class="filter-btn" onclick="initial()" style="margin-right: 25px">View all</button>
		{% for hashtags in blog %}
			<button class="filter-btn" onclick="filter('{{ hashtags.name }}')">#{{ hashtags.name }}</button>
		{% endfor %}
	</div>
	{% for hashtags in blog %}
	<div class="grid-blog" id="{{ hashtags.name }}">
		{% for article in hashtags.items %}
			<div class="card">
				<div class="bg-image">
					<img style="position: absolute; max-width: 100%;" src="{{ article.img }}">
				</div>
				<div class="card-body">
					<a href="{{ article.url }}" class="read-more"><h5 class="post-title">{{ article.title }}</h5></a>
					<p class="card-text">{{ article.excerpt }}</p>
					<p class="article-time">{{ article.date | date: site.date_format }}</p>
					<p id="hashtag">#{{ article.tag }}</p>
				</div>
			</div>
		{% endfor %}
	</div>
	{% endfor %}
	<div class="grid-blog" id="main-grid">
		{% assign blog = site.blog | sort: 'date' | reverse %}
		{% for article in blog %}
			{% if forloop.index > 6 %}
				{% break %}
			{% endif %}
			<div class="card">
				<div class="bg-image">
					<img style="position: absolute; max-width: 100%;" src="{{ article.img }}">
				</div>
				<div class="card-body">
					<a href="{{ article.url }}" class="read-more"><h5 class="post-title">{{ article.title }}</h5></a>
					<p class="card-text">{{ article.excerpt }}</p>
					<p class="article-time">{{ article.date | date: site.date_format }}</p>
					<p id="hashtag">#{{ article.tag }}</p>
				</div>
			</div>
		{% endfor %}
	</div> 
</div>

 