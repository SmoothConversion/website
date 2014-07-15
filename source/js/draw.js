/* 
 * Lazy Line Painter - Path Object 
 * Generated using 'SVG to Lazy Line Converter'
 * 
 * http://lazylinepainter.info 
 * Copyright 2013, Cam O'Connell  
 *  
 */ 
 
var pathObj = {
    "newsletter-circle": {
        "strokepath": [
            {
                "path": "M129.5,4.5c6.3-0.5,25-0.1,31.5-0.1c83.9,0,149.7,46.3,149.7,99.9  s-68.1,97-152,97s-152-43.4-152-97C6.7,55,65.1,18.1,140,12",
                "duration": 800
            }
        ],
        "dimensions": {
            "width": 323,
            "height": 276
        }
    }
}; 
 
/* 
 Setup and Paint your lazyline! 
 */ 

 
$(".newsletter-signup").click(function(e){
	 e.preventDefault()

     $("form.subscribe input.email").focus();
     if ($(window).scrollLeft() != 0) $(window).animate({scrollLeft: 0}, 400);

	 var strokeColor = $("#newsletter-circle").css("color")
	 $('#newsletter-circle').lazylinepainter( 
	 {
	    "svgData": pathObj,
	    "strokeWidth": 3,
	    "strokeColor": strokeColor
	}).lazylinepainter('paint'); 
 });