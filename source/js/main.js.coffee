#scroll sidebar horizontal rather than pushing content behind
$(window).scroll -> $('.sidebar').css('left',-$(window).scrollLeft())
