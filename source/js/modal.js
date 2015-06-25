// This is the user experience report card payment modal

var modal = (function(){
    var
    method = {},
    $overlay,
    $modal,
    $content,
    $close;

    // Center the modal in the viewport
    method.center = function () {
      var top, left;

      top = Math.max($(window).height() - $modal.outerHeight(), 0) / 2;
      left = Math.max($(window).width() - $modal.outerWidth(), 0) / 2;

      $modal.css({
        top:top + $(window).scrollTop(),
        left:left + $(window).scrollLeft()
      });
    };

    // Open the modal
    method.open = function () {
      method.center();
      $(window).bind('resize.modal', method.center);
      $modal.show();
      $overlay.show();
    };

    // Close the modal
    method.close = function () {
      $modal.hide();
      $overlay.hide();
      $(window).unbind('resize.modal');
    };

    // Generate the HTML and add it to the document
    $overlay = $(".report-card #overlay");
    $modal = $('.report-card #modal');
    $close = $('.report-card #modal .close, .report-card #overlay');

    $modal.hide();
    $overlay.hide();

    $close.click(function(e){
      e.preventDefault();
      method.close();
    });

    return method;
  }());

$( document ).ready(function() {
    $('.report-card .cta').click(function(){
        if ($(window).width() < 651) {
          document.location = "/purchase-user-experience-report-card"
        }
        else {
          modal.open();
        }
    });
});


// THIS IS THE EXIT INTENT CODE

// if ($(".free-funnel-course.free-course.full-page, .funnel-course-thank-you").length == 0){

//   var _ouibounce = ouibounce(document.getElementById('funnel-modal'), {
//     aggressive: window.DEV_MODE,
//     cookieExpire: 60,
//     callback: function() { console.log('ouibounce fired!'); }
//   });

//   $('#funnel-modal .underlay').on('click', function() {
//     $('#funnel-modal').hide();
//   });

//   $('#funnel-modal .modal-footer').on('click', function() {
//     $('#funnel-modal').hide();
//   });

//   $('#funnel-modal .modal').on('click', function(e) {
//     e.stopPropagation();
//   });

//   // To stop exit intent on blog post if you've already seen the post's CTA:
//   function isScrolledIntoView(elem)
//   {
//       var docViewTop = $(window).scrollTop();
//       var docViewBottom = docViewTop + $(window).height();

//       var elemTop = $(elem).offset().top;
//       var elemBottom = elemTop + $(elem).height();

//       return ((elemBottom <= docViewBottom) && (elemTop >= docViewTop));
//   }

//   if($(".blog-layout #map-out-your-funnel").length){
//     var $signup = $(".blog-signup"),
//         top = $signup.offset().top,
//         disabled = false;

//     $(window).scroll(function(){
//       if (!disabled && isScrolledIntoView($signup)){
//         _ouibounce.disable();
//         disabled = true;
//       }
//     });
//   }
// }