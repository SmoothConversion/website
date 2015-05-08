window.DEV_MODE = window.location.toString().indexOf("//localhost:") != -1

#scroll sidebar horizontal rather than pushing content behind
$(window).scroll -> $('.sidebar').css('left',-$(window).scrollLeft())

#responsive landing page
PRIMARY_FONT_PCT = 0.043
SECONDARY_FONT_PCT = 0.0283
LINE_HEIGHT_PCT = 1.73

BG_HEIGHT_PCT = 0.525
BG_START_PADDING_PCT = 0.07625

PRIMARY_IMG_HEIGHT_PCT = 1.17299

$primaryText = $(".primary-info p")
$secondarySections = $("#landing-content section").not(".primary-info")
$secondaryText = $secondarySections.find("> p")
                                   .add("input.email, input.outline-button")

$bg = $(".index-page .bg-wrap .section-bg")
$primaryImg = $(".primary-info > img")

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

setPrimaryImgHeight = ->
  w = $primaryImg.width()
  h = w * PRIMARY_IMG_HEIGHT_PCT
  $primaryImg.height(h)

clearPrimaryImgHeight = ->
  $primaryImg.css height: ""

setResponsive = (w)->
  setLandingText(w)
  setPrimaryImgHeight()
  setLandingBg(w)
  console.log "set responsive"

clearResponsive = ->
  clearLandingText()
  clearPrimaryImgHeight()
  clearLandingBg()

landingResponsive = ->
  w = Math.max $(window).width(), 360
  if w < 780 then setResponsive(w) else clearResponsive()

if $(".index-page").length
  landingResponsive()
  $(window).resize landingResponsive

$("body").css visibility: "visible"

$ ->
  $(".utm-input").attr("value", getParameterByName("utm"))


# funnel analysis font resizing

if $(".funnel-analysis").length
  scaleFn = ->
    wrapW = $("#wrap").width()

    if wrapW >= 1200
      $("html").css("font-size", "62.5%")
    else
      pct = wrapW / 1200
      $("html").css("font-size", "#{62.5 * pct}%")

    setTimeout(fitTestimonialImage, 50)
    setTimeout(verticallyCenterCtaContent, 52)


  fitTestimonialImage = ->
    $testimonialImg = $(".testimonial img")
    $testimonialImg.height( $(".testimonial > div").height())
    $testimonialImg.width("auto")

  verticallyCenterCtaContent = ->
    for cta in $("section.cta")
      $cta = $(cta)
      $content = $cta.find(".cta-content")
      $content.css "padding-top", ($cta.height() - $content.height()) / 2 - 2
      $content.css "padding-bottom", 0

  scaleFn()
  $(window).resize scaleFn
  $ ->
    $("body").show()
    scaleFn()
    setTimeout(fitTestimonialImage, 150)
    setTimeout(verticallyCenterCtaContent, 152)

