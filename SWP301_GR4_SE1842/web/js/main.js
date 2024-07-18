(function ($) {
 "use strict";

 /*----------------------------
 TOP Menu Stick
------------------------------ */
$(window).on('scroll',function() {
if ($(this).scrollTop() > 200){  
    $('#sticky-header').addClass("sticky");
  }
  else{
    $('#sticky-header').removeClass("sticky");
  }
}); 

 /*----------------------------
 TOP Menu Stick
------------------------------ */
$(window).on('scroll',function() {
if ($(this).scrollTop() > 200){  
    $('#header-sticky-2').addClass("sticky");
  }
  else{
    $('#header-sticky-2').removeClass("sticky");
  }
}); 

/*----------------------------
 jQuery MeanMenu
------------------------------ */
	jQuery('#mobile-menu-active').meanmenu();	
	
	
/*----------------------------
 wow js active
------------------------------ */
 new WOW().init();
 
/*----------------------------
 slider-active owl-carousel
------------------------------ */ 

 $('.slider-active').owlCarousel({
    smartSpeed:2000,
    margin:0,
    autoplay:false,
    autoplayHoverPause:false,
    nav:false,
    dots:true,
    loop:true,
    items:1,
    navText:['<i class="fa fa-angle-left"></i>','<i class="fa fa-angle-right"></i>'],
    responsive:{
        0:{
            items:1
        },
        576:{
            items:1
        },
        768:{
            items:1
        },
        1000:{
            items:1
        }
    }
})

/*----------------------------
 sale product-active owl-carousel
------------------------------ */  


 $('.saleproduct-active').owlCarousel({
    smartSpeed:2000,
    margin:0,
    autoplay:false,
    autoplayHoverPause:false,
    nav:true,
    dots:false,
    loop:true,
    items:5,
    navText:['<i class="fa fa-angle-left"></i>','<i class="fa fa-angle-right"></i>'],
    responsive:{
        0:{
            items:1
        },
        576:{
            items:2
        },
        768:{
            items:3
        },
        992:{
            items:4
        },
        1000:{
            items:5
        }
    }
})


/*----------------------------
 tab-active owl-carousel
------------------------------ */  


 $('.tab-active').owlCarousel({
    smartSpeed:2000,
    margin:0,
    autoplay:false,
    autoplayHoverPause:false,
    nav:true,
    dots:false,
    loop:true,
    items:1,
    navText:['<i class="fa fa-angle-left"></i>','<i class="fa fa-angle-right"></i>'],
    responsive:{
        0:{
            items:1
        },
        576:{
            items:1
        },
        768:{
            items:1
        },
        1000:{
            items:1
        }
    }
})

/*----------------------------
 sale product-active 2 owl-carousel
------------------------------ */  


 $('.saleproduct-active-2').owlCarousel({
    smartSpeed:2000,
    margin:0,
    autoplay:false,
    autoplayHoverPause:false,
    nav:true,
    dots:false,
    loop:true,
    items:4,
    navText:['<i class="fa fa-angle-left"></i>','<i class="fa fa-angle-right"></i>'],
    responsive:{
        0:{
            items:1
        },
        576:{
            items:2
        },
        768:{
            items:3
        },
        1000:{
            items:4
        }
    }
})


/*----------------------------
category_tab-active owl-carousel
------------------------------ */  


 $('.category_tab-active').owlCarousel({
    smartSpeed:2000,
    margin:0,
    autoplay:false,
    autoplayHoverPause:false,
    nav:true,
    dots:false,
    loop:true,
    items:1,
    navText:['<i class="fa fa-angle-left"></i>','<i class="fa fa-angle-right"></i>'],
    responsive:{
        0:{
            items:1
        },
        576:{
            items:1
        },
        768:{
            items:1
        },
        992:{
            items:1
        }
    }
})

/*----------------------------
 sale product-active 3 owl-carousel
------------------------------ */  


 $('.saleproduct-active-3').owlCarousel({
    smartSpeed:2000,
    margin:0,
    autoplay:false,
    autoplayHoverPause:false,
    nav:true,
    dots:false,
    loop:true,
    items:1,
    navText:['<i class="fa fa-angle-left"></i>','<i class="fa fa-angle-right"></i>'],
    responsive:{
        0:{
            items:1
        },
        576:{
            items:1
        },
        768:{
            items:1
        },
        1000:{
            items:1
        }
    }
})



/*----------------------------
 sale product-active 4 owl-carousel
------------------------------ */  


 $('.saleproduct-active-4').owlCarousel({
    smartSpeed:2000,
    margin:0,
    autoplay:false,
    autoplayHoverPause:false,
    nav:true,
    dots:false,
    loop:true,
    items:4,
    navText:['<i class="fa fa-angle-left"></i>','<i class="fa fa-angle-right"></i>'],
    responsive:{
        0:{
            items:1
        },
        576:{
            items:2
        },
        768:{
            items:3
        },
        1000:{
            items:4
        }
    }
})


/*----------------------------
bestsellerproduct-active owl-carousel
------------------------------ */  


 $('.bestsellerproduct-active').owlCarousel({
    smartSpeed:2000,
    margin:0,
    autoplay:false,
    autoplayHoverPause:false,
    nav:true,
    dots:false,
    loop:true,
    items:1,
    navText:['<i class="fa fa-angle-left"></i>','<i class="fa fa-angle-right"></i>'],
    responsive:{
        0:{
            items:1
        },
        576:{
            items:2
        },
        768:{
            items:2
        },
        992:{
            items:1
        }
    }
})


/*----------------------------
shop-category-active 
------------------------------ */ 

 $('.shop-category-active ').owlCarousel({
    smartSpeed:2000,
    margin:30,
    autoplay:false,
    autoplayHoverPause:false,
    nav:false,
    dots:false,
    loop:true,
    items:4,
    navText:['<i class="fa fa-angle-left"></i>','<i class="fa fa-angle-right"></i>'],
    responsive:{
        0:{
            items:1
        },
        576:{
            items:1
        },
        768:{
            items:3
        },
        1000:{
            items:4
        }
    }
})


/*----------------------------
 Categories-active
------------------------------ */ 

 $('.Categories-active').owlCarousel({
    smartSpeed:2000,
    margin:30,
    autoplay:false,
    autoplayHoverPause:false,
    nav:false,
    dots:false,
    loop:true,
    items:5,
    navText:['<i class="fa fa-angle-left"></i>','<i class="fa fa-angle-right"></i>'],
    responsive:{
        0:{
            items:1
        },
        576:{
            items:2
        },
        768:{
            items:4
        },
        1000:{
            items:5
        }
    }
})


/*----------------------------
 slider-active-2
------------------------------ */ 

 $('.slider-active-2').owlCarousel({
    smartSpeed:2000,
    margin:0,
    autoplay:false,
    autoplayHoverPause:false,
    nav:true,
    dots:false,
    loop:true,
    items:1,
    navText:['<i class="fa fa-long-arrow-left"></i>','<i class="fa fa-long-arrow-right"></i>'],
    responsive:{
        0:{
            items:1
        },
        576:{
            items:1
        },
        768:{
            items:1
        },
        1000:{
            items:1
        }
    }
})

  
/*----------------------------
 tab-active-2
------------------------------ */  

 $('.tab-active-2').owlCarousel({
    smartSpeed:2000,
    margin:0,
    autoplay:false,
    autoplayHoverPause:false,
    nav:true,
    dots:false,
    loop:true,
    items:4,
        navText:['<i class="fa fa-angle-left"></i>','<i class="fa fa-angle-right"></i>'],
    responsive:{
        0:{
            items:1
        },
        576:{
            items:2
        },
        768:{
            items:3
        },
        992:{
            items:2
        },
        1000:{
            items:3
        }
    }
})

  
  /*----------------------------
 tab-active-3
------------------------------ */ 


 $('.tab-active-3').owlCarousel({
    smartSpeed:2000,
    margin:0,
    autoplay:false,
    autoplayHoverPause:false,
    nav:true,
    dots:false,
    loop:true,
    items:2,
    navText:['<i class="fa fa-long-arrow-left"></i>','<i class="fa fa-long-arrow-right"></i>'],
    responsive:{
        0:{
            items:1
        },
        576:{
            items:1
        },
        768:{
            items:1
        },
        1000:{
            items:2
        }
    }
})

  /*----------------------------
 tab-active-4
------------------------------ */  

 $('.tab-active-4').owlCarousel({
    smartSpeed:2000,
    margin:0,
    autoplay:false,
    autoplayHoverPause:false,
    nav:true,
    dots:false,
    loop:true,
    items:1,
    navText:['<i class="fa fa-long-arrow-left"></i>','<i class="fa fa-long-arrow-right"></i>'],
    responsive:{
        0:{
            items:1
        },
        576:{
            items:1
        },
        768:{
            items:1
        },
        1000:{
            items:1
        }
    }
})

  /*----------------------------
 testimonial-active
------------------------------ */  

 $('.testimonial-active').owlCarousel({
    smartSpeed:2000,
    margin:0,
    autoplay:false,
    autoplayHoverPause:false,
    nav:false,
    dots:false,
    loop:true,
    items:1,
    navText:['<i class="fa fa-angle-left"></i>','<i class="fa fa-angle-right"></i>'],
    responsive:{
        0:{
            items:1
        },
        576:{
            items:1
        },
        768:{
            items:1
        },
        1000:{
            items:1
        }
    }
})
 
  
  /*----------------------------
 random-active
------------------------------ */  

$('.random-active').owlCarousel({
    smartSpeed:2000,
    margin:30,
    autoplay:false,
    autoplayHoverPause:false,
    nav:false,
    dots:false,
    loop:true,
    items:3,
    navText:['<i class="fa fa-angle-left"></i>','<i class="fa fa-angle-right"></i>'],
    responsive:{
        0:{
            items:1
        },
        576:{
            items:2
        },
        768:{
            items:2
        },
        1000:{
            items:3
        }
    }
})

  /*----------------------------
 brand-active
------------------------------ */  


$('.brand-active').owlCarousel({
    smartSpeed:2000,
    margin:30,
    autoplay:false,
    autoplayHoverPause:false,
    nav:false,
    dots:false,
    loop:true,
    items:5,
    navText:['<i class="fa fa-angle-left"></i>','<i class="fa fa-angle-right"></i>'],
    responsive:{
        0:{
            items:2
        },
        576:{
            items:3
        },
        768:{
            items:4
        },
        1000:{
            items:5
        }
    }
})

    
  /*----------------------------
 shop-active
------------------------------ */  

$('.shop-active').owlCarousel({
    smartSpeed:2000,
    margin:30,
    autoplay:false,
    autoplayHoverPause:false,
    nav:true,
    dots:false,
    loop:true,
    items:1,
    navText:['<i class="fa fa-angle-left"></i>','<i class="fa fa-angle-right"></i>'],
    responsive:{
        0:{
            items:1
        },
        576:{
            items:1
        },
        768:{
            items:1
        },
        1000:{
            items:1
        }
    }
})
      
/*----------------------------
blog-slider-active 
------------------------------ */  

$('.post-active').owlCarousel({
    smartSpeed:2000,
    margin:30,
    autoplay:false,
    autoplayHoverPause:false,
    nav:true,
    dots:true,
    loop:true,
    items:3,
    navText:['<i class="fa fa-angle-left"></i>','<i class="fa fa-angle-right"></i>'],
    responsive:{
        0:{
            items:1
        },
        576:{
            items:1
        },
        768:{
            items:2
        },
        1000:{
            items:3
        }
    }
})


  /*----------------------------
blog-slider-active 
------------------------------ */  

$('.blog-slider-active').owlCarousel({
    smartSpeed:2000,
    margin:30,
    autoplay:false,
    autoplayHoverPause:false,
    nav:false,
    dots:true,
    loop:true,
    items:1,
    navText:['<i class="fa fa-angle-left"></i>','<i class="fa fa-angle-right"></i>'],
    responsive:{
        0:{
            items:1
        },
        576:{
            items:1
        },
        768:{
            items:1
        },
        1000:{
            items:1
        }
    }
})

  
  /*-------------------------
  showlogin toggle function
--------------------------*/
	 $( '#showlogin' ).on('click', function() {
        $( '#checkout-login' ).slideToggle(900);
     }); 
	
  /*-------------------------
  showcoupon toggle function
--------------------------*/
	 $( '#showcoupon' ).on('click', function() {
        $( '#checkout_coupon' ).slideToggle(900);
     });
	 
		 
/*-------------------------
  Create an account toggle function
--------------------------*/
	$( '#cbox' ).on('click', function() {
        $( '#cbox_info' ).slideToggle(900);
     });
	 
/*-------------------------
  Create an account toggle function
--------------------------*/
	 $( '#ship-box' ).on('click', function() {
        $( '#ship-box-info' ).slideToggle(1000);
     });	
		 
	 	 
/*-------------------------
  Create an account toggle function
--------------------------*/
	 $( '#side-show' ).on('click', function() {
        $( '#side-hide' ).slideToggle(1000);
     });	
		 
	 
	 
  /*--------------------------
   Countdown
---------------------------- */	
    $('[data-countdown]').each(function() {
        var $this = $(this), finalDate = $(this).data('countdown');
        $this.countdown(finalDate, function(event) {
        $this.html(event.strftime('<div class="cdown days"><span class="counting counting-2">%-D</span>days</div><div class="cdown hours"><span class="counting counting-2">%-H</span>hrs</div><div class="cdown minutes"><span class="counting counting-2">%M</span>mins</div><div class="cdown seconds"><span class="counting">%S</span>secs</div>'));
        });
    });
	
/*----------------------------
 flexslider-slider active
------------------------------ */
	  $('.flexslider').flexslider({
		animation: "slide",
		controlNav: "thumbnails"
	  });
	  
/*---------------------
	counter
--------------------- */	  

$('.counter').counterUp({
    delay: 10,
    time: 1000
});

/*---------------------
	Category menu
--------------------- */
	$('#cate-toggle li.has-sub>a').on('click', function(){
		$(this).removeAttr('href');
		var element = $(this).parent('li');
		if (element.hasClass('open')) {
			element.removeClass('open');
			element.find('li').removeClass('open');
			element.find('ul').slideUp();
		}
		else {
			element.addClass('open');
			element.children('ul').slideDown();
			element.siblings('li').children('ul').slideUp();
			element.siblings('li').removeClass('open');
			element.siblings('li').find('li').removeClass('open');
			element.siblings('li').find('ul').slideUp();
		}
	});
	$('#cate-toggle>ul>li.has-sub>a').append('<span class="holder"></span>');
	   
	   
/*--------------------------
 scrollUp
---------------------------- */	
	$.scrollUp({
        scrollText: '<i class="fa fa-angle-up"></i>',
        easingType: 'linear',
        scrollSpeed: 900,
        animation: 'fade'
    }); 	   
 
})(jQuery); 