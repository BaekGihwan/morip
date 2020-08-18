var view_seq = $('.view_seq').val();  // 원글 ref값
	$(window).scroll(function () {
				var height = $(document).scrollTop();
				if(height>=550){
					$('.sideBar').css('position','fixed');
					$('.sideBar').css('top','100px');
				} else {
					$('.sideBar').css('position','absolute');
					$('.sideBar').css('top','600px');
				}
	});

	$('document').ready(function(){
	  $('.switch_infomation').hide();
	  $('.writeOptionDiv').hide();
	  $('.view_replyBoard').toggle();
		$('.view_replyBoard').css('display','block');
	  let option= $('.view_controlOption').offset();
	});
	/*글 옵션 버튼 눌렀을 때 div 띄워주기*/
	$('.view_controlOption').click(function(){
	  if($('#clickCheck').val()=='off'){
	    $('.writeOptionDiv').show();
	    $('.writeOptionDiv').css({
	      position:'absolute',
	      top:event.pageY+20,
	      left:event.pageX-100,
	      width:'150px',
	      height:'100px',
	      border:'1px solid gray'
	    });
	    $('#clickCheck').val('on');
	  } else if($('#clickCheck').val()=='on'){
	    $('.writeOptionDiv').hide();
	    $('#clickCheck').val('off');
	  }
	});
	$('#modifyBoard').click(function(){
	  alert("수정 버튼 클릭");
	});
	$('#deleteBoard').click(function(){
		deleteBoard(view_seq);
	});
	//삭제하는 함수
	function deleteBoard(seq){
		Swal.fire({
		  title: '글을 삭제하시겠습니까???',
		  text: "삭제하시면 다시 복구시킬 수 없습니다.",
		  icon: 'warning',
		  showCancelButton: true,
		  confirmButtonColor: '#3085d6',
		  cancelButtonColor: '#d33',
		  confirmButtonText: 'delete'
		}).then((result) => {
		  if (result.value) {
				  	$.ajax({
					type: 'get',
					url: '/morip/myblog/deleteBlogBoard',
					data: 'seq='+seq,
					success: function(){
						Swal.fire(
						      'Deleted!',
						      '파일이 삭제되었습니다!',
						      'success'
						 ).then((result) => {
							if (result.value) {                                 
			      				if(seq==view_seq){
									location.href="mypage";
								} else {
									location.reload(true);
								}
			               }
				        })
					}   //success
				});   //AJAX
		  }
		})
	}

	/*댓글 달기 버튼을 클릭했을 때 */
	$('.view_replyWrapper').click(function(){
	  $('.view_replyBoard').toggle();
	});
	/*공감 버튼 클릭시*/
	$('.view_likeWrapper').click(function(){
	  if($('#likeCheck').val()=='off'){
	    $('#likeBtn').css('color','red');
	    $('#likeCheck').val('on');
	  } else {
	    $('#likeBtn').css('color','black');
	    $('#likeCheck').val('off');
	  }
	});
	/* 댓글 쓰기 버튼 클릭 시 */
	/*답글 버튼 클릭시*/
	function replyBtnClick(seq){
	  if($('.checkReplyInput').val()=='off'){
	    let replyInputDiv =
	    '<div class="view_replyInputWrapper">'+
	      '<div class="view_replyContentInputWrapper">'+
	        '<div class="reply_contentInput">'+
	            '<div class="reply_userID">'+
	             '로그인한 유저이름'+
	            '</div>'+
	            '<textarea id="replyInputBox'+seq+'" class="form-control" aria-label="With textarea"></textarea>'+
	            '<div class="reply_inputOption">'+
	              '<button id="resetBtn" class="btn btn-light" onclick="resetBtn()">취소</button>'+
	              '<button id="insertBtn" class="btn btn-light" onclick="insertBtn('+seq+')">등록</button>'+
	            '</div>'+
	        '</div>'+
	      '</div>'+
	    '</div>';
	   $('#view_replyBoard'+seq).append(replyInputDiv);
		 $('#view_replyBoardModal'+seq).append(replyInputDiv);
	   $('.checkReplyInput').val('on');
	    } else {
	    	resetBtn();
	    	replyBtnClick(seq);
	    }
		$('.view_replyInputWrapper').css('margin-left','50px');
	  }
	/*댓글 수정 버튼을 클릭했을 경우*/
	function modifyBtnClick(seq){
		//폼 로딩
	  if($('.checkReplyInput').val()=='off'){
	    let replyInputDiv =
	    '<div class="view_replyInputWrapper">'+
	      '<div class="view_replyContentInputWrapper">'+
	        '<div class="reply_contentInput">'+
	            '<div class="reply_userID">'+
	             '댓글 수정'+
	            '</div>'+
	            '<textarea id="replyInputBox'+seq+'" class="form-control" aria-label="With textarea"></textarea>'+
	            '<div class="reply_inputOption">'+
	              '<button id="resetBtn" class="btn btn-light" onclick="resetBtn()">취소</button>'+
	              '<button id="modifyBtn" class="btn btn-light" onclick="modifyBtn('+seq+')">수정</button>'+
	            '</div>'+
	        '</div>'+
	      '</div>'+
	    '</div>';
	   $('#view_replyBoard'+seq).append(replyInputDiv);
		 $('#view_replyBoardModal'+seq).append(replyInputDiv);
	   $('.checkReplyInput').val('on');
	    } else {
	    	resetBtn();
	    	replyBtnClick(seq);
	    }
		$('.view_replyInputWrapper').css('margin-left','50px');
		//추가된 수정 폼에 값 넣어주기
		loadReplyOne(seq);
	  }
	
	/*글 수정 버튼 클릭했을 경우*/
	function modifyBtn(seq){
		let content = $('#replyInputBox'+seq).val();
		$.ajax({
			type: 'get',
			url: '/morip/myblog/updateReply',
			data: 'seq='+seq+'&content='+content,
			success: function(){
				Swal.fire(
					      '수정 완료!',
					      '댓글이 수정되었습니다!',
					      'success'
					 ).then((result) => {
						if (result.value) {                                 
		      				loadReply();
		               }
			        })
			}   //success
		});   //AJAX
	}
	  
	/*삭제 버튼 클릭시*/
	function deleteBtnClick(seq){
		deleteBoard(seq);
	}
	
	
	/*댓글을 하나 불러와서 그 댓글의 아래 텍스트박스 안에 content를 뿌려주는 함수*/
	function loadReplyOne(seq){
		$.ajax({
			type: 'get',
			url: '/morip/myblog/selectReply',
			data: 'seq='+seq,
			dataType:'json',
			success: function(data){
				 $('#replyInputBox'+seq).val(data.myblogDTO.content);
			}   //success
		});   //AJAX
	}

	/*취소 버튼 클릭시*/
	function resetBtn(){
	  $(".view_replyInputWrapper").remove();
	  $('.checkReplyInput').val('off');
	}
	
	
	
/*제일 상단의 본문 댓글 달기*/	
	function insertBtn(pseq){
	 	let step = 0;
	 	let content= $('#replyInputBox'+pseq).val();
	 	console.log(content);
		if(pseq == view_seq){
		 	//본문글의 답글
	 		step = 1; 
	 	} else {
	 	 	 //본문의 댓글의 답글
	 		step = 2;
	 	}
	 	
	  	$.ajax({
			type: 'post',
			url: '/morip/myblog/insertReply',
			data: 'pseq='+pseq+"&ref="+view_seq+"&step="+step+"&content="+content,
			success: function(){
				//화면에 댓글 로딩해주는 ajax 실행
				loadReply();
				Swal.fire(
				      '저장 완료!',
				      '댓글이 저장되었습니다!',
				      'success'
				 ).then((result) => {
					if (result.value) {                                 
	      				loadReply();
	      				if(step==1){
	      					$("#replyInputBox"+view_seq).val("");
	      				}
	               }
		        })
			}   //success
		});   //AJAX
	 	$(".view_replyInputWrapper").remove();
		$('.checkReplyInput').val('off');
	}
function loadReply(){
	$('.replyInsertDiv').empty();
    	$.ajax({
				type: 'post',
				url: '/morip/myblog/loadReply',
				data: "ref="+view_seq,
				dataType: 'json',
				success: function(data){
					if(data.list.length!='0'){   //데이터가 존재할 때
						$.each(data.list, function(index, items){
							//console.log(items.content);
							let seq = items.blogboardtable_seq;
							let pseq = items.pseq;
							let replyForm=
							          '<div class="view_replyBoard" id="view_replyBoard'+seq+'">'+
							            '<div class="view_replyListWrapper">'+
							              '<div class="view_replyList">'+
							                '<div class="view_userImgWrapper">'+
							                  '<img class="view_userImg" src="../image/myblog/game.png">'+
							                '</div>'+
							                '<div class="view_replyContent">'+
							                    '<div class="reply_userID">'+
							                     items.nickname+
							                    '</div>'+
							                    '<div class="reply_content">'+
							                     '<p>'+
							                       items.content+
							                     '</p>'+
							                    '</div>'+
							                '</div>'+
							              '</div>'+
							              '<div class="view_replyBtnWrapper">'+
							              	'<div id="replyBtn1" class="hvr-grow" onclick="replyBtnClick('+seq+')">'+
							                  '답글'+
							                '</div>'+
							                '<div id="deleteBtn" class="hvr-grow" onclick="deleteBtnClick('+seq+')">'+
							                  '삭제'+
							                '</div>'+
							                '<div id="modifyBtn" class="hvr-grow" onclick="modifyBtnClick('+seq+')">'+
							                 '수정'+
							                '</div>'+
							              '</div>'+
							            '</div>'+
							          '</div>';
							  if(items.step==1){  //본문글의 댓글일 때
							  	$('.replyInsertDiv').append(replyForm);
							  } else {
							  	$('#view_replyBoard'+pseq).append(replyForm);
							  	$('#view_replyBoard'+seq).css('padding-left','70px');
							  }
						});
					}
				}   //success
			});   //AJAX
}	
	
	

$('.replyOption').click(function(){
	$('#cmt-modal').modal();
});

$('#x-btn').click(function(){
    $('#cmt-mocal').modal('toggle');
});

$(document).ready(function(){
	//댓글 로딩
	loadReply();
	
	var windowWidth = $(window).innerWidth();
    var windowWidth1 = $(window).outerWidth();
    console.log(windowWidth+", "+windowWidth1);
    if(windowWidth1 < 768){
		$('.cmt-content').css("width", "100%");
    }else if(windowWidth1 < 992){
    	$('.cmt-content').css("width", "75%");
    }else if(windowWidth1 < 1200){
        $('.cmt-content').css("width", "58%");
    }else{
        $('.cmt-content').css("width", "48%");
    }
    if(windowWidth1 < 489){
            $(".cmt-textarea").css("width", "72%");
            $('#cmt-text').css("width", "100%");
        }else if(windowWidth1 < 768){
            $(".cmt-textarea").css("width", "80%");
            $('#cmt-text').css("width", "100%");
        }else{
            $(".cmt-textarea").css("width", "85%");
            $('#cmt-text').css("width", "100%");
        }
});

$(function(){
    $(window).resize(function(){
        var windowWidth = $(window).innerWidth();
        var windowWidth1 = $(window).outerWidth();
        console.log(windowWidth+", "+windowWidth1);
        if(windowWidth1 < 768){
    		$('.cmt-content').css("width", "100%");
	    }else if(windowWidth1 < 992){
	    	$('.cmt-content').css("width", "75%");
	    }else if(windowWidth1 < 1200){
	        $('.cmt-content').css("width", "58%");
	    }else{
	        $('.cmt-content').css("width", "48%");
        }

        if(windowWidth1 < 489){
            $(".cmt-textarea").css("width", "72%");
            $('#cmt-text').css("width", "100%");
        }else if(windowWidth1 < 768){
            $(".cmt-textarea").css("width", "80%");
            $('#cmt-text').css("width", "100%");
        }else{
            $(".cmt-textarea").css("width", "85%");
            $('#cmt-text').css("width", "100%");
        }
    });
});
