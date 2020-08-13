/*무한스크롤*/
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
	
    $(window).scroll(function(){
    console.log("documentHeight:" + documentHeight + " | scrollTop:" + scrollTop + " | windowHeight: " + windowHeight );
        if($(window).scrollTop()+200>=$(document).height() - $(window).height())
        {
            if(!loading)    //실행 가능 상태라면?
            {
                loading = true; //실행 불가능 상태로 변경
                loadingPage(); 
            }
        }
    });  
    function loadingPage(){
    	$.ajax({
					type: 'post',
					url: '/morip/myblog/infinityScroll',
					data: 'pg='+pg,
					dataType: 'json',
					success: function(data){
						pg++;
						count++;			
						var tempNumber= 0;
						if(data.list.length!='0'){   //데이터가 존재할 때
						$.each(data.list, function(index, items){
							let startdate= new Date(items.startdate).format('yyyy-MM-dd'); 
							let enddate = new Date(items.enddate).format('yyyy-MM-dd');  
							//처음 시작을 여는 div
							if(tempNumber%3==0){
								height+=380;
								$('.content').css('height',height+'px');
								list += '<div class="myblogList" data-aos="fade-up" data-aos-duration="3000">';
							}
							list+='<div id="myblog_feed" class="hvr-grow-shadow">';
							list+='<div class="myblog_img">';
							list+='<img class="listImg" src="../image/architecture.jpg"></div>';
            				list+='<div class="myblog_info"><div class="myblog_subject">'+items.subject+'</div>';
            				list+='<div class="myblog_content">'+items.content+'</div>';
            				list+='<div class="myblog_userFunction"><div class="like'+items.seq+'" style="cursor:pointer;"onclick="likeClick('+items.seq+')"><i class="far fa-heart"></i></div>';
            				list+='<div class="reply"><i class="fas fa-comment-dots"></i></div><div class="myblog_travleDay">';
            				list+= startdate +'~'+ enddate+'</div></div></div></div>';
            				list+='<input type="hidden" id="likeCheck'+items.seq+'" value="unlike">';
            				//닫아주는 div
							if(tempNumber%3==2){
								list+='</div>';
							}
							tempNumber++;
						});
						$('.myBlog_wrapper').append(list);
						$('#pg').val(pg);
						list='';
						loading = false;
						}
					}   //success
				});   //AJAX
    }
