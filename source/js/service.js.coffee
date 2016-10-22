COVER_HEIGHT_RATIO = 0.51

if $("html.service").length
  coverMinHeight = $(window).width() * COVER_HEIGHT_RATIO
  $(".bg-cover").css("min-height", coverMinHeight)
  initResponsiveText()
  $("body").show()

  $(".bg-cover img.bg").load -> $(".bg-cover").css("min-height", 0)
