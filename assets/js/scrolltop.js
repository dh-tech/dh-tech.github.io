$(document).ready(function() {
    var btn = $('#button');
  
      btn.hide();
  
    $(window).scroll(function() {
      if ($(window).scrollTop() > 200) {
        btn.show();
      } else {
        btn.hide();
      }
    });
  
    btn.on('click', function(e) {
      e.preventDefault();
      $('html, body').animate({scrollTop:0}, '200');
    });
});