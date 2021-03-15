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
  setNavigation("Blog")
})

</script>

<div style="margin-top: 20px">
	<a id="button"><i class="fa fa-caret-up"></i></a>
	<button onclick="location.href='{{ site.baseurl }}/admin/index'" class="primary-btn" style="float: right; margin: 0"><i class="fa fa-edit"></i>&nbsp;Compose</button>
	<h2 class="section-header">DH Tech Blog</h2>
	<p>This is the DHTech blog. There are three types of blog posts: ADayInTheLifeOf, 2Simple2Mention, and WhatsHappening. ADayInTheLifeOf aims to give the reader an idea of what a day in the work life of a DH techie looks like. It can be anything the author wants to share about their job. 2Simple2Mention provides a space to live for all these technical problems that we sometimes need a lot of time to fix but that turn out to be super simple. We don't write them down because we think it's so simple we will remember, and spend the same amount of time on them again the next time (or someone else is). WhatsHappening reports on current events in the DHTech space. Enjoy reading!</p>
  <p>
  Want to contribute a blog post? Yes please! Get in touch with us on Slack!
  </p>
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
		{% assign blog = site.blog | sort: 'date' | reverse %}
		{% for article in blog %}
			{% if forloop.index > 6 %}
				{% break %}
			{% endif %}
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
</div>
