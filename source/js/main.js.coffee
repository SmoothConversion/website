
# scroll sidebar horizontal rather than pushing content behind
$(window).scroll -> $('.sidebar').css('left',-$(window).scrollLeft())

# increase size of blog images
if $(".tags.mobile-tags").is ":visible"
  images = $(".article img")
  for image in images
    w = $(image).width()
    $(image).width(w * 1.3)

