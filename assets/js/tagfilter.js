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