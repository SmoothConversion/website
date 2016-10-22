BASE_WIDTH = 1200
BASE_FONT = 0.625

responsiveText = ->
  $win = $(window)
  ww = $win.width()

  pct = ww / BASE_WIDTH

  newFont = BASE_FONT * pct
  newFontStr = "#{newFont * 100}%"

  $("html").css("font-size", newFontStr)

window.initResponsiveText = ->
  responsiveText()
  $(window).resize responsiveText



