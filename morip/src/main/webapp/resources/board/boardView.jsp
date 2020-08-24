<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>

    <meta charset="utf-8">

    <!-- Font Awesome icons (free version)-->
    <script src="https://use.fontawesome.com/releases/v5.13.0/js/all.js" crossorigin="anonymous"></script>
    <!-- Google fonts-->
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@900&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
    <!--AOS 라이브러리-->
     <link rel="stylesheet" href="https://unpkg.com/aos@2.3.1/dist/aos.css" />
     <!--hover.css-->
     <link href="../css/board/hover.css" rel="stylesheet" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="../css/board/board.css" rel="stylesheet" />
    <!-- CSS only -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

    <title></title>
  </head>
  <body>
    <input type="hidden" id="nickname" value="${nickname}">  
   	<input type="hidden" class="view_seq" value="${boardtable_seq }">
    <form name="boardViewForm">
    
    <input type="hidden" id="boardtable_seq" name="boardtable_seq"value="${boardtable_seq }">
    <input type="hidden" id="pg" name="pg"value="${pg }">
    <input type="hidden" value="${memEmail }" id="email">
    <article class="contentWrapper">
    <br><br>
      <div class="content">
        <div class="boardWrapper">
          <div class="view_headWrapper">
            <div class="view_subjectInfo2" >
              <div class="view_subject">
              
               <span id="subjectSpan"></span>
              
              </div>
            </div>
            <div class="view_subjectInfo3" >
              <div class="view_userInfo">
                <img class="view_userImg" src="../storage/${boardDTO.image }">
                <div class="view_userId">
              	<span id="nickNameSpan"></span>
                </div>
              </div>
              <div class="view_controlOption">
                <i id="view_boardOption" class="fas fa-ellipsis-v" style="cursor:pointer;"></i>
              
    <!--view 로 보여주는 글 옵션 버튼 클릭 시 활성화 되는 div-->
    <div class="writeOptionDiv">
      <input type="hidden"  id="clickCheck" value="off">
      <div id="modifyBoard" onclick="mode(1)">
        수정하기
        <i class="far fa-edit" ></i>
      </div>
      <div  id="deleteBoard" onclick="mode(2)">
        삭제하기
        <i class="fas fa-trash-alt"></i>
      </div>
    </div>
              
              
              
              
              
              </div>
            </div>
          </div>
          <div class="boardContentWrapper">
           	<div class= "boardcontentSpan">
           	
            <span id="contentSpan"></span>
           
            </div>
            </form>
            <div class="view_boardOption">

              <div class="view_reply">
                <div class="view_replyWrapper">
                  <i class="far fa-comment-dots" style="margin-right:10px;"></i>
                  <span>댓글쓰기</span>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!--하단의 댓글 창 클릭(아마 이 부분은 AJAX 로 구현하실 것 같은데 class="view_replyBoard" 부븐을 전부 append 해주셔야 할 겁니다. )-->
          <div class="view_replyBoard" id="view_replyBoard">
            <div class="view_boardReplyInputWrapper">
              <div class="view_replyContentInputWrapper">
                <div class="reply_contentInput">
                    <div class="reply_userID">
                      ${nickname}
                    </div>
                    <textarea id="replyInputBox${boardtable_seq }" class="form-control" aria-label="With textarea" style="resize: none;" ></textarea>
                    <div class="reply_inputOption">
                      <button type="button" id="insertBtn" class="btn btn-light" onclick="insertReplyBtn(${boardtable_seq})">등록</button>
                    </div>
                </div>
              </div>
            </div>
            <input type="hidden" class="replySeq" value="1"> <!--댓글 고유의 번호를 통해서 어떤 글인지 확인 가능-->
            <input type="hidden" class="checkReplyInput" value="off">
            <div class="replyInsertDiv">
            <!-- 댓글이 추가(append)되는 부분  -->
            </div>
             <br><br>
          </div>
      </div>
      <br><br>
    </article>
    
  </body>
  <!-- Bootstrap core JS-->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js"></script>
  <!-- Third party plugin JS-->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
  <!--AOS 라이브러리-->
  <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
  <!-- JS, Popper.js, and jQuery -->
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
 
 
  <!-- Core theme JS-->
  <script src="../js/board/boardView.js"></script>
  <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
  
  
  <script type="text/javascript">
	function mode(num){
	if(num==1){//글수정
		//alert('ddd');
		document.boardViewForm.method = 'post';
		document.boardViewForm.action = 'boardModifyForm';
		document.boardViewForm.submit();
		
	}else if(num==2){//글삭제
		document.boardViewForm.method = 'post';
		document.boardViewForm.action = 'boardDelete';
		document.boardViewForm.submit();	
	}
}
</script>
</html>
