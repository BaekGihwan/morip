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
			//$('.blog_link').attr("href", "/morip/myblog/mypage?nickname="+data.memberDTO.nickname);		
			$('.blog_link').click(function(){
				if($('#email').val()=='') {
					Swal.fire({
						icon: 'info',
						confirmButtonText: '확인',
						title: '로그인을 먼저 하세요.',
						text: '로그인 화면으로 넘어갑니다.',
					}).then((result) => {
						if (result.value) {											
							location.href="../member/loginForm";
						}
					}) 
				}else {
					location.href='../myblog/mypage?nickname='+data.memberDTO.nickname;
				}
			});
						
			//베스트작가의 베스트 글 3개 뿌려주기
			$.ajax({
				type: 'post',
				url: '../myblog/bestTrip',
				data: 'nickname='+data.memberDTO.nickname,
				dataType: 'json',
				success: function(data){
					//alert(data.blogboard1.nickname);
					$.each(data.list,function(index,items){
						$('#post_seq'+(index+1)).val(data.list[index].blogboardtable_seq);
						$('#post_image'+(index+1)).css('background-image','url("../storage/'+data.list[index].mainimage+'")');
	            		$('#post_image_like_text'+(index+1)).text(data.list[index].likecount);
	            		$('#post_title_p'+(index+1)).text(data.list[index].subject);
	            		$('#post_content_p'+(index+1)).html(data.list[index].content);
					});
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

// 베스트글 글 누르면 뷰로 이동
$('.writer_post').on('click','.post', function(){
	if($('#email').val()=='') {
		Swal.fire({
			icon: 'info',
			confirmButtonText: '확인',
			title: '로그인을 먼저 하세요.',
			text: '로그인 화면으로 넘어갑니다.',
		}).then((result) => {
			if (result.value) {											
			location.href="../member/loginForm";
			}
		}) 
	}else {
		location.href='../myblog/view?seq='+$(this).children().first().val();
	}
});

// 맛집 누르면 뷰로 이동	 
$('.bestFood_post').on('click','.food_post', function(){
	location.href='../matzip/matzipView?title='+$(this).children().first().text();
});


// 슬라이더 누르면 리스트로 이동
$('.morip_banner_slider').on('click','.img', function(){
	  	location.href='../blog/blogList2?title='+$(this).children().first().text();
});


