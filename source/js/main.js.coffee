#scroll sidebar horizontal rather than pushing content behind
$(window).scroll -> $('.sidebar').css('left',-$(window).scrollLeft())

#responsive landing page
PRIMARY_FONT_PCT = 0.043
SECONDARY_FONT_PCT = 0.0283
LINE_HEIGHT_PCT = 1.73

BG_HEIGHT_PCT = 0.525
BG_START_PADDING_PCT = 0.07625

$primaryText = $("#landing-content .primary-info > p")
$secondarySections = $("#landing-content section").not(".primary-info")
$secondaryText = $secondarySections.find("> p")
                                   .add("input.email, input.outline-button")

$bg = $(".index-page .bg-wrap .section-bg")
$primaryImg = $("#landing-content .primary-info > img")

setFontCss = ($el, fontSize)->
  $el.css 
    "font-size": "#{fontSize}px"
    "line-height": "#{fontSize * LINE_HEIGHT_PCT}px"

clearFontCss = ($el)->
  $el.css 
    "font-size": ""
    "line-height": ""

setLandingText = (w)->
  for [$el, fontPct] in [[$primaryText, PRIMARY_FONT_PCT], 
                         [$secondaryText, SECONDARY_FONT_PCT]]
    setFontCss($el, fontPct * w)
      
clearLandingText = ->
  clearFontCss($el) for $el in [$primaryText, $secondaryText]

bgStart = (w)->
  top = parseInt($primaryImg.css("top")) 
  h = $primaryImg.height()
  pad = BG_START_PADDING_PCT * w 
  top + h + pad

setLandingBg = (w)->
  h = w * BG_HEIGHT_PCT
  $bg.height(h)
  $secondarySections.height(h)
  $bg.first().css 
    "margin-top": "#{bgStart(w)}px"

clearLandingBg = ->
  $bg.css 
    "height": ""
    "margin-top": ""

  $secondarySections.css height: ""

setResponsive = (w)->
  setLandingText(w)
  setLandingBg(w)

clearResponsive = ->
  clearLandingText()
  clearLandingBg()

landingResponsive = -> 
  w = Math.max $(window).width(), 480
  if w < 780 then setResponsive(w) else clearResponsive()
  
if $(".index-page").length  
  landingResponsive()
  $("body").css visibility: "visible"
  $(window).resize landingResponsive

