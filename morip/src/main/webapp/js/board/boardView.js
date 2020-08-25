var view_seq = $('.view_seq').val();  // 원글 ref값
var nickname = $('#nickname').val();

var hours = (new Date()).getHours();//시간
var minutes = (new Date()).getMinutes();//분


/***************************boardView.jsp*********************************/
/*글 옵션 버튼 눌렀을 때 div 띄워주기
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
*/



$('.view_controlOption').click(function(){
$('.writeOptionDiv').toggle();
   $('.writeOptionDiv').css({
      position:'absolute',
      top:event.pageY+20,
      left:event.pageX-140,
      width:'200px',
      height:'126px',
      border:'1px solid gray'
   });
});

/*댓글 달기 버튼을 클릭했을 때 */
$('.view_replyWrapper').click(function(){
  $('.view_replyBoard').toggle();
});

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
            '<textarea id="replyInputBox" class="form-control" aria-label="With textarea"></textarea>'+
            '<div class="reply_inputOption">'+
              '<button id="resetBtn" class="btn btn-light" onclick="resetBtn()">취소</button>'+
              '<button id="insertBtn" class="btn btn-light" onclick="insertBtn('+seq+')">등록</button>'+
            '</div>'+
        '</div>'+
      '</div>'+
    '</div>';
   $('#view_replyBoard'+seq).append(replyInputDiv);
   $('.checkReplyInput').val('on');
   $('.view_replyInputWrapper').css('margin-left','50px');s
    }
  }

/*취소 버튼 클릭시*/
function resetBtn(){
  $(".view_replyInputWrapper").remove();
  $('.checkReplyInput').val('off');
}




$(document).ready(function(){
	$.ajax({
		type: 'post',
		url: '/morip/board/getBoardView',
		data: 'boardtable_seq='+$('#boardtable_seq').val(),
		dataType: 'json',
		success : function(data){
			$('#subjectSpan').text(data.boardDTO.subject);
			$('#nickNameSpan').text(data.boardDTO.nickname);
			$('#contentSpan').html(data.boardDTO.content);
			
			loadReply();
			if(data.nickname == data.boardDTO.nickname){
				$('.view_controlOption').css('display','block');
			} else {
				$('.view_controlOption').css('display','none');
			}
				
		},
		error: function(err){
			console.log(err);
		}		
	});

});

//댓글 밑 본문 삭제 시
function deleteBtnClick(boardtable_seq){
		Swal.fire({
		  title: '댓글을 삭제하시겠습니까???',
		  text: "삭제하시면 다시 복구시킬 수 없습니다.",
		  icon: 'warning',
		  confirmButtonText: '확인',
          cancelButtonText: '취소',
		  showCancelButton: true,
		  confirmButtonColor: '#3085d6',
		  cancelButtonColor: '#d33',
		}).then((result) => {
		  if (result.value) {
				  	$.ajax({
					type: 'get',
					url: '/morip/board/deleteReplyBoard',
					data: 'boardtable_seq='+boardtable_seq,
					success: function(){
						Swal.fire({
						      title: '댓글이 삭제되었습니다.',
							  icon: 'success',
							  confirmButtonText: '확인'
						}).then((result) => {
							if (result.value) {                                 
									location.reload(true);   //댓글삭제 히
			               }
				        })
					}   //success
				});   //AJAX
		  }
		})
	}


	/*댓글 삭제 버튼 클릭시
	function deleteBtnClick(boardtable_seq){
		deletereply(boardtable_seq);
	}
*/


	/*댓글 달기 버튼을 클릭했을 때 */
	$('.view_replyWrapper').click(function(){
	  $('.view_replyBoard').toggle();
	});



	/* 댓글 쓰기 버튼 클릭 시 */
	/*답글 버튼 클릭시*/
	function replyBtnClick(boardtable_seq){
	  if($('.checkReplyInput').val()=='off'){
	    let replyInputDiv = 
	    '<div class="view_replyInputWrapper">'+
	      '<div class="view_replyContentInputWrapper">'+
	        '<div class="reply_contentInput">'+
	            '<div class="reply_userID">'+
	             nickname+
	            '</div>'+
	            '<textarea id="replyInputBox'+boardtable_seq+'" class="form-control" style="resize: none;" aria-label="With textarea"></textarea>'+
	            '<div class="reply_inputOption">'+
	              '<button type="button" id="resetBtn" class="btn btn-light" onclick="resetBtn()">취소</button>'+
	              '<button type="button" id="insertBtn" class="btn btn-light" onclick="insertReplyBtn('+boardtable_seq+')">등록</button>'+
	            '</div>'+
	        '</div>'+
	      '</div>'+
	    '</div>';
	   $('#view_replyBoard'+boardtable_seq).append(replyInputDiv);
		 $('#view_replyBoardModal'+boardtable_seq).append(replyInputDiv);
	   $('.checkReplyInput').val('on');
	    } else {
	    	resetBtn();
	    	replyBtnClick(boardtable_seq);
	    }
		$('.view_replyInputWrapper').css('margin-left','50px');
	  }



	/*댓글 수정 버튼을 클릭했을 경우(폼 화면에 append 작업)*/
	function modifyBtnClick(boardtable_seq){
	resetBtn();
	$('#view_replyContentInputWrapper'+boardtable_seq).empty();
		//폼 로딩
	  if($('.checkReplyInput').val()=='off'){
	    let replyInputDiv99 = 
	    '<div class="view_replyInputWrapper">'+
	      '<div class="view_replyContentInputWrapper">'+
	        '<div class="reply_contentInput">'+
	            '<div class="reply_userID">'+
	             '댓글 수정'+
	            '</div>'+
	            '<textarea id="replyInputBox'+boardtable_seq+'" word-break:break-all; class="form-control" style="resize: none; white-space:pre;" aria-label="With textarea"></textarea>'+
	            '<div class="reply_inputOption">'+
	              '<button type="button" id="resetBtn" class="btn btn-light" onclick="resetBtn()">취소</button>'+
	              '<button type="button" id="modifyBtn" class="btn btn-light" onclick="modify('+boardtable_seq+')" style="margin: 10px; width: 100px; font-size: 13px;">수정</button>'+
	            '</div>'+
	        '</div>'+
	      '</div>'+
	    '</div>';
	   $('#view_replyBoard'+boardtable_seq).append(replyInputDiv99);
		 $('#view_replyBoardModal'+boardtable_seq).append(replyInputDiv99);
	   $('.checkReplyInput').val('on');
	    } else {
	    	resetBtn();
	    	replyBtnClick(boardtable_seq);
	    }
		$('.view_replyInputWrapper').css('margin-left','50px');
		//추가된 수정 폼에 값 넣어주기
		loadReplyOne(boardtable_seq);
	  }
	/*글 수정 버튼 클릭했을 경우*/
	function modify(boardtable_seq){
		let content = $('#replyInputBox'+boardtable_seq).val().replace(/(?:\r\n|\r|\n)/g,'<br/>');
		$.ajax({
			type: 'get',
			url: '/morip/board/updateReply',
			data: 'boardtable_seq='+boardtable_seq+'&content='+content,
			success: function(){
			Swal.fire({
                icon: 'success',
                confirmButtonText: '확인',
                 title: '댓글이 수정되었습니다.'
            }).then((result) => {
            if (result.value) {                                 
                  loadReply();
                     }
                 })
         }   //success
      });   //AJAX
   }

   /*댓글을 하나 불러와서 그 댓글의 아래 텍스트박스 안에 content를 뿌려주는 함수*/
   function loadReplyOne(boardtable_seq){
      $.ajax({
         type: 'get',
         url: '/morip/board/selectReply',
         data: 'boardtable_seq='+boardtable_seq,
         dataType:'json',
         success: function(data){
             $('#replyInputBox'+boardtable_seq).val(data.boardDTO.content.replace(/(<br>|<br\/>|<br \/>)/g, '\r\n'));
         }   //success
      });   //AJAX
   }

/*제일 상단의 본문 댓글 달기*/	
	function insertReplyBtn(pseq){
	 	let step = 0;
	 	let content= $('#replyInputBox'+pseq).val();
	 	console.log(content);
		if(pseq == view_seq){
		 	//본문글의 답글
		 	alert("11");
	 		step = 1; 
	 	} else {
	 	 	 //본문의 댓글의 답글
	 		step = 2;
	 	}
	 	
	  	$.ajax({
			type: 'post',
			url: '/morip/board/insertReply',
			data: 'pseq='+pseq+"&ref="+view_seq+"&step="+step+"&content="+content,
			success: function(){
				loadReply();   //화면에 댓글 로딩해주는 ajax 실행
				Swal.fire({
				      title: '저장 완료!',
				      text: '댓글이 저장되었습니다.',
					  icon: 'success',
					  confirmButtonText: '확인',
						}).then((result) => {
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

/***************************************핵심코드!!! DB 에서 댓글 가져다가 화면에 뿌려주는 함수*********************************************/
function loadReply(){

	$('.replyInsertDiv').empty();
    	$.ajax({
				type: 'post',
				url: '/morip/board/loadReply',
				data: "ref="+view_seq,
				dataType: 'json',
				success: function(data){
				
					if(data.list.length!='0'){   //데이터가 존재할 때
						$.each(data.list, function(index, items){
							//console.log(items.content);
							let replyNickname = items.nickname;
							let seq = items.boardtable_seq;
							let pseq = items.pseq;
							let replyForm=
							          '<div class="view_replyBoard" id="view_replyBoard'+seq+'">'+
							            '<div class="view_replyListWrapper">'+
							              '<div class="view_replyList">'+
							                '<div class="view_userImgWrapper">'+
							                  '<img class="view_userImg" src="../storage/'+items.image+'">'+
							                '</div>'+
							                '<div class="view_replyContent">'+
							                
							                    '<div class="reply_userID">'+
							                     replyNickname+
							                    '</div>'+
							                     '<div class="reply_logtime">'+
							                      items.logtime+'&nbsp&nbsp'+ hours + ':' + minutes+
							                    '</div>'+
							                    
							                    '<div class="reply_content">'+
							                     '<pre style="overflow:auto; white-space:pre-wrap; word-break:break-all;">'+
							                       items.content+
							                     '</pre>'+
							                    '</div>'+
	
							                '</div>'+
							              '</div>'+
							              '<div class="view_replyBtnWrapper">';
							              if(items.step!=2){
							              	replyForm += '<div  type="button"  id="replyBtn1" class="hvr-grow" onclick="replyBtnClick('+seq+')">'+ '답글'+ '</div>';
							              }
							              	
							                //댓글의 삭제와 수정기능은 작성자 만이 할 수 있음
							                if(nickname==replyNickname){
							              		replyForm += '<div  type="button"  id="deleteBtn" class="hvr-grow" onclick="deleteBtnClick('+seq+')">'+'삭제'+'</div>'+
							                				'<div  type="button"  id="modifyBtn" class="hvr-grow" onclick="modifyBtnClick('+seq+')">'+ '수정'+ '</div>'
							              	}
							         		replyForm += '</div>'+'</div>'+'</div>';
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






