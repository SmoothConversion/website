if ($(".free-funnel-course.free-course.full-page, .funnel-course-thank-you").length == 0){

  var _ouibounce = ouibounce(document.getElementById('funnel-modal'), {
    aggressive: window.DEV_MODE,
    callback: function() { console.log('ouibounce fired!'); }
  });

  $('#funnel-modal .underlay').on('click', function() {
    $('#funnel-modal').hide();
  });

  $('#funnel-modal .modal-footer').on('click', function() {
    $('#funnel-modal').hide();
  });

  $('#funnel-modal .modal').on('click', function(e) {
    e.stopPropagation();
  });

  // To stop exit intent on blog post if you've already seen the post's CTA:
  function isScrolledIntoView(elem)
  {
      var docViewTop = $(window).scrollTop();
      var docViewBottom = docViewTop + $(window).height();

      var elemTop = $(elem).offset().top;
      var elemBottom = elemTop + $(elem).height();

      return ((elemBottom <= docViewBottom) && (elemTop >= docViewTop));
  }

  if($(".blog-layout #map-out-your-funnel").length){
    var $signup = $(".blog-signup"),
        top = $signup.offset().top,
        disabled = false;

    $(window).scroll(function(){
      if (!disabled && isScrolledIntoView($signup)){
        _ouibounce.disable();
        disabled = true;
      }
    });
  }
}