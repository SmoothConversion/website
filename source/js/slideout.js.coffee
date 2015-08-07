if ($slideout = $(".slideout")).length and !$.cookie('more-signups-download')
  closed = $.cookie('slideout-close')

  if not(closed and moment().diff(moment(closed), 'days') < 1)
    triggered = false
    window.slideoutStartRight = $slideout.css("right")

    $(window).scroll ->
      if !triggered and $(window).scrollTop() >= 800
        $slideout.css {"right": "0"}
        heap.track "Ebook slideout triggered"
        triggered = true

    $slideout.on "click", (e)->
      $tg = $(e.target)

      if $tg.is(".close") or $tg.closest(".close").length
        $slideout.css {"right": window.slideoutStartRight}
        $.cookie 'slideout-close', moment().toISOString(), expires: 9999
      else
        window.ouibounceModal?.disable()
        $('#funnel-modal').show()
        initOuiModal("slideout")


