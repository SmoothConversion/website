#scroll sidebar horizontal rather than pushing content behind
$(window).scroll -> $('.sidebar').css('left',-$(window).scrollLeft())

# modify size of blog images on mobile
if $(".tags.mobile-tags").is ":visible"
  images = $(".article img")