
/***************************boardView.jsp*********************************/
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
  location.href='../resources/board/boardModifyForm.jsp';	
});
$('#deleteBoard').click(function(){
  alert("삭제 버튼 클릭");
});
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
/*삭제 버튼 클릭시*/
function deleteBtnClick(seq){
  alert(seq+"삭제 버튼 클릭");
}

/*수정 버튼 클릭시*/
function modifyBtnClick(seq){
  alert(seq+"수정 버튼 클릭");
}

/*취소 버튼 클릭시*/
function resetBtn(){
  $(".view_replyInputWrapper").remove();
  $('.checkReplyInput').val('off');
}
function insertBtn(seq){
  //데이터베이스에 insert작업 진행
  alert("게시글을 등록중입니다.");
  let replyInputDiv=
  '<div class="view_replyDiv" id="viewReplyDiv">'+
    '<div class="view_replyList">'+
      '<div class="view_userImgWrapper">'+
        '<img class="view_userImg" src="../image/pic01.jpg">'+
      '</div>'+
      '<div class="view_replyContent">'+
        '<div class="reply_userID">'+
         'Ohrin'+
        '</div>'+
        '<div class="reply_content">'+
         '<p>'+
           'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'+
         '</p>'+
        '</div>'+
      '</div>'+
    '</div>'+
    '<div class="view_replyBtnWrapper">'+
      '<div id="deleteBtn" class="hvr-grow" onclick="deleteBtnClick(2)">'+
        '삭제'+
      '</div>'+
      '<div id="modifyBtn" class="hvr-grow" onclick="modifyBtnClick(2)"> '+
        '수정'+
      '</div>'+
    '</div>'+
  '</div>';
  $('#view_replyBoard'+seq).append(replyInputDiv);
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
			//alert(JSON.stringify(data));			
			$('#subjectSpan').text(data.boardDTO.subject);
			$('#nickNameSpan').text(data.boardDTO.nickname);
			$('#contentSpan').html(data.boardDTO.content);
			
			/*
			if(data.memId == data.boardDTO.id)
				$('#boardViewSpan').show();
			else
				$('#boardViewSpan').hide();
				*/
		},
		error: function(err){
			console.log(err);
		}		
	});

});

