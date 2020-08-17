$('#matzipImageSlider').slick({
    slidesToShow:5,
    slidesToScroll:1,
    infinite:true, 
    autoplay:true,
    autoplaySpeed: 2000,
    //pauseOnHover:false,
    arrow:false,
    nextArrow:$('.next'),
    prevArrow:$('.prev'),
    responsive:[
    {
       breakpoint:1024,
       settings:{
          slidesToshow:3,
          slidesToScroll:3,
          infinite:true,
          dots:true
       }
    },
    {
      breakpoint: 600,
      settings: {
        slidesToShow: 2,
        slidesToScroll: 2
      }
    },
    {
      breakpoint: 480,
      settings: {
        slidesToShow: 1,
        slidesToScroll: 1
      }
    }
    ]
 });