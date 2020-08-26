/* 슬라이더를 자동으로이동 */
$('.morip_banner_slider').slick({
   slidesToShow: 7,
   slidesToScroll: 1,
   autoplay: true,
   autoplaySpeed: 2000,
   nextArrow: $('.next'),
   prevArrow: $('.prev'),
   responsive: [
    {
      breakpoint: 1024,
      settings: {
        slidesToShow: 3,
        slidesToScroll: 3,
        infinite: true,
        dots: true
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
    // You can unslick at a given breakpoint now by adding:
    // settings: "unslick"
    // instead of a settings object
  ]
});

// 베트스작가 뽑기.
$(document).ready(function(){
$.ajax({
		type: 'post',
		url: '../myblog/bestWriter',
		dataType: 'json',
		success: function(data){
			$('.profile_image').attr("src","../storage/"+data.memberDTO.image);
			$('.profile_name').text(data.memberDTO.nickname);
			$('.blog_link').attr("href", "/morip/myblog/mypage?nickname="+data.memberDTO.nickname);		
			//베스트작가의 베스트 글 3개 뿌려주기
			$.ajax({
				type: 'post',
				url: '../myblog/bestTrip',
				data: 'nickname='+data.memberDTO.nickname,
				dateType: 'json',
				success: function(data2){
					console.log(data2.list2.nickname);
				},
				error: function(err){
					console.log(err);
				}
			});
		},
		error: function(err){
			console.log(err);
		}		
	});
});


// 맛집 best3개 뿌려주기 
$(document).ready(function(){
	$.ajax({
	      type: 'post',
	      url: '../matzip/matzipThreeList',
	      dataType: 'json',
	      success: function(data){
	         $.each(data.list,function(index,items){
	            $('#food_post_name'+(index+1)).text(data.list[index].title);
	            $.ajax({
					type:'post',
					url:'../matzip/getReviewCount',
					data:'keyword='+data.list[index].title,
					dataType:'text',
					success:function(data){
						$('#food_post_like_count'+(index+1)).text(data);
					},
					error:function(err){
						console.log(err);
					}
				});
	            $('#food_post_image'+(index+1)).css('background-image','url("../image/matzip/'+data.list[index].image2+'")');
	            $('#food_link'+(index+1)).prop('href',data.list[index].link);
	            $('#content2_address'+(index+1)).text(data.list[index].address);
	            $('#content3_pone'+(index+1)).text(data.list[index].telephone);
	            $('#content4_time'+(index+1)).text(data.list[index].time);
	         });
	      },
	      error:function(err){
	         console.log(err);
	      }
	});	
});



