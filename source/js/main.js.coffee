
# scroll sidebar horizontal rather than pushing content behind
$(window).scroll -> $('.sidebar').css('left',-$(window).scrollLeft())

# modify size of blog images on mobile
if true $(".tags.mobile-tags").is ":visible"
  images = $(".article img")
  for image in images
    if image.style.width != "100%"
        w = $(image).width()
        $(image).width(w * 0.5)

