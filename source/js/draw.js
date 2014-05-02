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
                "path": "M132.7,1.2c6.3-0.5,12.8-0.8,19.3-0.8c83.9,0,152,43.4,152,97  s-68.1,97-152,97S0,150.9,0,97.4C0,48,57.8,7.2,132.7,1.2",
                "duration": 600
            }
        ],
        "dimensions": {
            "width": 314,
            "height": 250
        }
    }
}; 
 
 
/* 
 Setup and Paint your lazyline! 
 */ 

 
$(".newsletter-signup").click(function(e){
	 e.preventDefault() 
	 $('#newsletter-circle').lazylinepainter( 
	 {
	    "svgData": pathObj,
	    "strokeWidth": 2,
	    "strokeColor": "#e09b99"
	}).lazylinepainter('paint'); 
 });