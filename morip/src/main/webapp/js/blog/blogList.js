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


// 블로그 작성하기 버튼 눌렀을때
$('#writeOptionBtn').click(function(){
	location.href="/morip/myblog/writeBlog0";
});

//해쉬태그 검색 버튼 눌렀을때
$('.hashtagSearchBtn').click(function(){
var ar = new Array();
$('.blogList_wrapper').empty();
console.log($('.blogList_wrapper').html());
	if($('.hashtagText').val()==''){
		Swal.fire({
			icon: 'warning',
			confirmButtonText: '확인',
			title: '검색어를<br>입력해주세요!'
		}).then((result) => {
			if (result.value) {											
				$('#divImg0').trigger('click');
			}
		}) 
	}else{
		$('.blogList_wrapper').empty();
		list='';
		$.ajax({//1.ajax
			type:'post',
			url:'../blog/hashtagSearch',
			data:{'hashtagText':$('.hashtagText').val()},
			dataType:'json',
			success:function(data){
				$.each(data.list,function(index,items){
					ar.push(data.list[index].blogBoardTable_Seq);
				})
				$.ajax({//2.ajax
					type:'post',
					url:'../blog/hashtagBlogList',
					data:{"ar":ar},
					dataType:'json',
					success:function(data){
				var tempNumber= 0;
				if(data.list.length!='0'){   //데이터가 존재할 때
				$('.blogList_wrapper').empty();
				$.each(data.list, function(index, items){
					let startdate= new Date(items.startdate).format('yyyy-MM-dd'); 
					let enddate = new Date(items.enddate).format('yyyy-MM-dd');  
					let seq = items.blogboardtable_seq;
					$('#contentFilter').html(items.content);
					let content = $('#contentFilter').text();
					//처음 시작을 여는 div
					if(tempNumber%4==0){
						height+=230;
						$('.blogList_wrapper').css('height',height+'px');
						list += '<div class="blogList" id="blogList" data-aos="fade-up" data-aos-duration="3000">';
					}
					list+='<div id="blog_feed" class="hvr-grow-shadow" onclick="viewEnter('+seq+')">';
					list+='<div class="myblog_img">';
					list+='<img class="listImg" src="../storage/'+items.mainimage+'"></div>';
        			list+='<div class="myblog_info"><div class="myblog_subject">'+items.subject+'</div>';
        			list+='<div class="myblog_content">'+content+'</div>';
        			list+='<div class="myblog_userFunction"><div class="like'+seq+'" style="cursor:pointer;"onclick="likeClick('+seq+')"><i class="far fa-heart"></i></div>';
        			list+='<div class="reply"><span>'+items.likecount+'</span> </div><div class="myblog_travleDay">';
        			list+= startdate +'~'+ enddate+'</div></div></div></div>';
        			list+='<input type="hidden" id="likeCheck'+seq+'" value="unlike">';
        			//닫아주는 div
					if(tempNumber%4==3){
					console.log(tempNumber);
						list+='</div>';
					}
					tempNumber++;
				});
				$('.blogList_wrapper').append(list);
				list='';				
				}
					},
					error:function(err){
						console.log(err);
					}
					
				});//2.ajax
			},
			error:function(err){
				console.log(err);
			}					
		});//1.ajax
	} // else 
	
});



//날짜 형식 변환
Date.prototype.format = function (f) {
    if (!this.valueOf()) return " ";
    var weekKorName = ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"];
    var weekKorShortName = ["일", "월", "화", "수", "목", "금", "토"];
    var weekEngName = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"];
    var weekEngShortName = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];
    var d = this;
    return f.replace(/(yyyy|yy|MM|dd|KS|KL|ES|EL|HH|hh|mm|ss|a\/p)/gi, function ($1) {
        switch ($1) {
            case "yyyy": return d.getFullYear(); // 년 (4자리)
            case "yy": return (d.getFullYear() % 1000).zf(2); // 년 (2자리)
            case "MM": return (d.getMonth() + 1).zf(2); // 월 (2자리)
            case "dd": return d.getDate().zf(2); // 일 (2자리)
            case "KS": return weekKorShortName[d.getDay()]; // 요일 (짧은 한글)
            case "KL": return weekKorName[d.getDay()]; // 요일 (긴 한글)
            case "ES": return weekEngShortName[d.getDay()]; // 요일 (짧은 영어)
            case "EL": return weekEngName[d.getDay()]; // 요일 (긴 영어)
            case "HH": return d.getHours().zf(2); // 시간 (24시간 기준, 2자리)
            case "hh": return ((h = d.getHours() % 12) ? h : 12).zf(2); // 시간 (12시간 기준, 2자리)
            case "mm": return d.getMinutes().zf(2); // 분 (2자리)
            case "ss": return d.getSeconds().zf(2); // 초 (2자리
            case "a/p": return d.getHours() < 12 ? "오전" : "오후"; // 오전/오후 구분
            default: return $1;
        }
    });
};
String.prototype.string = function (len) { var s = '', i = 0; while (i++ < len) { s += this; } return s; };
String.prototype.zf = function (len) { return "0".string(len - this.length) + this; };
Number.prototype.zf = function (len) { return this.toString().zf(len); };

/*무한스크롤*/
//페이지 로딩 되자마자 1pg 뜨기
$(document).ready(function(){
	//loadingPage();
		$('.userMenu').css("z-index","90");
	});
	//변수 선언
var $window = $(this);
var scrollTop = $window.scrollTop();
var windowHeight = $window.height();
var documentHeight = $(document).height();
var height=1500;
var pg = $('#pg').val();
var count = $('#count').val();
var list = "";
var loading = false;    //중복실행여부 확인 변수
var page = 1;   //불러올 페이지
var content = "";

$(window).scroll(function(){
console.log("documentHeight:" + documentHeight + " | scrollTop:" + scrollTop + " | windowHeight: " + windowHeight );
    if($(window).scrollTop()+200>=$(document).height() - $(window).height())
    console.log(loading);
    {
        if(loading == false)    //실행 가능 상태라면?
        {
        console.log(loading);
            loading = true; //실행 불가능 상태로 변경
            loadingPage(); 
        }
    }
});  

/* 무한 스크롤 부분 */
function loadingPage(){
	$.ajax({
		type: 'post',
		url: '/morip/blog/infinityScroll',
		data: {'pg' : pg, 'content' : content},
		dataType: 'json',
		success: function(data){
			pg++;
			var tempNumber= 0;
			if(data.list.length!='0'){   //데이터가 존재할 때
				$.each(data.list, function(index, items){
					let startdate= new Date(items.startdate).format('yyyy-MM-dd'); 
					let enddate = new Date(items.enddate).format('yyyy-MM-dd');  
					let seq = items.blogboardtable_seq;
					$('#contentFilter').html(items.content);
					let content = $('#contentFilter').text();
					//처음 시작을 여는 div
					if(tempNumber%4==0){
						//height+=300;
						//$('.blogList_wrapper').css('height',height+'px');
						//height+=230;
						//$('.blogList_wrapper').css('height',height+'px');
						list += '<div class="blogList" id="blogList" data-aos="fade-up" data-aos-duration="3000">';
					}
					list+='<div id="blog_feed" class="hvr-grow-shadow" onclick="viewEnter('+seq+')">';
					list+='<div class="myblog_img">';
					list+='<img class="listImg" src="../storage/'+items.mainimage+'"></div>';
        			list+='<div class="myblog_info"><div class="myblog_subject">'+items.subject+'</div>';
        			list+='<div class="myblog_content">'+content+'</div>';
        			list+='<div class="myblog_userFunction"><div class="like'+seq+'" style="cursor:pointer;"onclick="likeClick('+seq+')"><i class="far fa-heart"></i></div>';
        			list+='<div class="reply"><span>'+items.likecount+'</span> </div><div class="myblog_travleDay">';
        			list+= startdate +'~'+ enddate+'</div></div></div></div>';
        			list+='<input type="hidden" id="likeCheck'+seq+'" value="unlike">';
        			//닫아주는 div
					if(tempNumber%4==3){
					console.log(tempNumber);
						list+='</div>';
					}
					tempNumber++;
				});
				$('.blogList_wrapper').append(list);
				$('#pg').val(pg);
				list='';
				loading = false;
			}
		}   //success
	});   //AJAX
}

//뷰 페이지 진입
function viewEnter(seq){
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
		location.href="../myblog/view?seq="+seq;
	}
}

// 지역누르면 뿌려주는거
$('.img0').click(function(){
	content = "";
	pg = '1';
	$('.blogList_wrapper').empty();
	loadingPage();
});

$('.img1').click(function(){
	content = $('#content1').text();
	pg = '1';
	$('.blogList_wrapper').empty();
	loadingPage();
});

$('.img2').click(function(){
	content = $('#content2').text();
	pg = '1';
	$('.blogList_wrapper').empty();
	loadingPage();
});

$('.img3').click(function(){
	content = $('#content3').text();
	pg = '1';
	$('.blogList_wrapper').empty();
	loadingPage();
});

$('.img4').click(function(){
	content = $('#content4').text();
	pg = '1';
	$('.blogList_wrapper').empty();
	loadingPage();
});

$('.img5').click(function(){
	content = $('#content5').text();
	pg = '1';
	$('.blogList_wrapper').empty();
	loadingPage();
});

$('.img6').click(function(){
	content = $('#content6').text();
	pg = '1';
	$('.blogList_wrapper').empty();
	loadingPage();
});

$('.img7').click(function(){
	content = $('#content7').text();
	pg = '1';
	$('.blogList_wrapper').empty();
	loadingPage();
});

$('.img8').click(function(){
	content = $('#content8').text();
	pg = '1';
	$('.blogList_wrapper').empty();
	loadingPage();
});

$('.img9').click(function(){
	content = $('#content9').text();
	pg = '1';
	$('.blogList_wrapper').empty();
	loadingPage();
});

$('.img10').click(function(){
	content = $('#content10').text();
	pg = '1';
	$('.blogList_wrapper').empty();
	loadingPage();
});

$('.img11').click(function(){
	content = $('#content11').text();
	pg = '1';
	$('.blogList_wrapper').empty();
	loadingPage();
});

$('.img12').click(function(){
	content = $('#content12').text();
	pg = '1';
	$('.blogList_wrapper').empty();
	loadingPage();
});

$('.img13').click(function(){
	content = $('#content13').text();
	pg = '1';
	$('.blogList_wrapper').empty();
	loadingPage();
});

$('.img14').click(function(){
	content = $('#content14').text();
	pg = '1';
	$('.blogList_wrapper').empty();
	loadingPage();
});

$('.img15').click(function(){
	content = $('#content15').text();
	pg = '1';
	$('.blogList_wrapper').empty();
	loadingPage();
});

$('.img16').click(function(){
	content = $('#content16').text();
	pg = '1';
	$('.blogList_wrapper').empty();
	loadingPage();
});

// 메인에서 슬라이더 누르면 이동
if($('#title').val()==''){
		$('#divImg0').trigger('click');
	}else if($('#title').val()=='전체'){
		$('#divImg0').trigger('click');
	}else if($('#title').val()=='서울'){
		$('#divImg1').trigger('click');
	}else if($('#title').val()=='부산'){
		$('#divImg2').trigger('click');
	}else if($('#title').val()=='대구'){
		$('#divImg3').trigger('click');
	}else if($('#title').val()=='인천'){
		$('#divImg4').trigger('click');
	}else if($('#title').val()=='광주'){
		$('#divImg5').trigger('click');
	}else if($('#title').val()=='대전'){
		$('#divImg6').trigger('click');
	}else if($('#title').val()=='울산'){
		$('#divImg7').trigger('click');
	}else if($('#title').val()=='강원도'){
		$('#divImg8').trigger('click');
	}else if($('#title').val()=='경기도'){
		$('#divImg9').trigger('click');
	}else if($('#title').val()=='충북'){
		$('#divImg10').trigger('click');
	}else if($('#title').val()=='충남'){
		$('#divImg11').trigger('click');
	}else if($('#title').val()=='전북'){
		$('#divImg12').trigger('click');
	}else if($('#title').val()=='전남'){
		$('#divImg13').trigger('click');
	}else if($('#title').val()=='경북'){
		$('#divImg14').trigger('click');
	}else if($('#title').val()=='경남'){
		$('#divImg15').trigger('click');
	}else if($('#title').val()=='제주도'){
		$('#divImg16').trigger('click');
	}