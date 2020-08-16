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
   
    <input type="hidden" id="boardtable_seq" value="${boardtable_seq }">
    
    
    <article class="contentWrapper">
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
                <img class="view_userImg"src="../image/board/pic01.jpg">
                <div class="view_userId">
              
                  <span id="nickNameSpan"></span>
              
                </div>
              </div>
              <div class="view_controlOption">
                <i id="view_boardOption" class="fas fa-ellipsis-v" style="cursor:pointer;"></i>
              </div>
            </div>
          </div>
          <div class="boardContentWrapper">
           	<div class= "boardcontentSpan">
           	
            <span id="contentSpan"></span>
           
            </div>
            <div class="view_boardOption">
              <div class="view_like">
                <div class="view_likeWrapper">
                  <i class="far fa-heart" id="likeBtn" style="margin-right:10px;"></i>
                  <p>공감하기</p>
                  <input type="hidden" id="likeCheck" value="off">
                </div>
              </div>
              <div class="view_reply">
                <div class="view_replyWrapper">
                  <i class="far fa-comment-dots" style="margin-right:10px;"></i>
                  <p>댓글쓰기</p>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!--하단의 댓글 창 클릭(아마 이 부분은 AJAX 로 구현하실 것 같은데 class="view_replyBoard" 부븐을 전부 append 해주셔야 할 겁니다. )-->
        <div class="view_replyBoard" id="view_replyBoard1">
          <div class="view_boardReplyInputWrapper">
            <div class="view_replyContentInputWrapper">
              <div class="reply_contentInput">
                  <div class="reply_userID">
                    gkflfldldlsmal
                  </div>
                  <textarea id="replyInputBox" class="form-control" aria-label="With textarea"></textarea>
                  <div class="reply_inputOption">
                    <button id="insertBtn" class="btn btn-light" onclick="insertBtn('+seq+')">등록</button>
                  </div>
              </div>
            </div>
          </div>
          <input type="hidden" class="replySeq"value="1"> <!--댓글 고유의 번호를 통해서 어떤 글인지 확인 가능-->
          <input type="hidden" class="checkReplyInput" value="off">
          <div class="view_replyListWrapper">
            <div class="view_replyList">
              <div class="view_userImgWrapper">
                <img class="view_userImg" src="../image/board/pic02.jpg">
              </div>
              <div class="view_replyContent">
                <div class="reply_userID">
                 Happy1001
                </div>
                <div class="reply_content">
                 <p>
                   Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nisl tincidunt eget nullam non. Quis hendrerit dolor magna eget est lorem ipsum dolor sit. Volutpat odio facilisis mauris sit amet massa. Commodo odio aenean sed adipiscing diam donec adipiscing tristique. Mi eget mauris pharetra et. Non tellus orci ac auctor augue. Elit at imperdiet dui accumsan sit.
                 </p>
                </div>
              </div>
            </div>
            <div class="view_replyBtnWrapper">
              <div id="replyBtn1" class="hvr-grow" onclick="replyBtnClick(1)"> <!--댓글 고유의 번호를 통해서 어떤 글인지 확인 가능-->
                답글
              </div>
              <div id="deleteBtn" class="hvr-grow" onclick="deleteBtnClick(1)"> <!--댓글 고유의 번호를 통해서 어떤 글인지 확인 가능-->
                삭제
              </div>
              <div id="modifyBtn" class="hvr-grow" onclick="modifyBtnClick(1)"> <!--댓글 고유의 번호를 통해서 어떤 글인지 확인 가능-->
                수정
              </div>
            </div>
          </div>
          <!--답글 달기 버튼을 클릭하였을 떄 내용이 추가될 div 란-->
          <div class="view_replyDiv" id="viewReplyDiv">
            <!--이 안의 코드부분은 전부 AJAX 를 통해서 뿌려주게 될 데이터들-->
            <div class="view_replyList">
              <div class="view_userImgWrapper">
                <img class="view_userImg" src="../image/board/pic01.jpg">
              </div>
              <div class="view_replyContent">
                <div class="reply_userID">
                 Ohrin
                </div>
                <div class="reply_content">
                 <p>
                   Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
                 </p>
                </div>
              </div>
            </div>
            <div class="view_replyBtnWrapper">
              <div id="deleteBtn" class="hvr-grow" onclick="deleteBtnClick(2)"> <!--댓글 고유의 번호를 통해서 어떤 글인지 확인 가능-->
                삭제
              </div>
              <div id="modifyBtn" class="hvr-grow" onclick="modifyBtnClick(2)"> <!--댓글 고유의 번호를 통해서 어떤 글인지 확인 가능-->
                수정
              </div>
            </div>
            <!--만약에 댓글 버튼을 눌렀을 경우, 댓글을 작성할 수 있는 div 영역이 추가되는 부분-->
          </div>
        </div>
        <!--하단의 댓글 창 클릭-->
        <div class="view_replyBoard" id="view_replyBoard2">
          <div class="view_replyListWrapper">
            <div class="view_replyList">
              <div class="view_userImgWrapper">
                <img class="view_userImg" src="../image/board/game.png">
              </div>
              <div class="view_replyContent">
                  <div class="reply_userID">
                   hahahaha
                  </div>
                  <div class="reply_content">
                   <p>
                     Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nisl tincidunt eget nullam non. Quis hendrerit dolor magna eget est lorem ipsum dolor sit.
                   </p>
                  </div>
              </div>
            </div>
            <div class="view_replyBtnWrapper">
              <div id="replyBtn1" class="hvr-grow" onclick="replyBtnClick(2)"> <!--댓글 고유의 번호를 통해서 어떤 글인지 확인 가능-->
                답글
              </div>
              <div id="deleteBtn" class="hvr-grow" onclick="deleteBtnClick(2)"> <!--댓글 고유의 번호를 통해서 어떤 글인지 확인 가능-->
                삭제
              </div>
              <div id="modifyBtn" class="hvr-grow" onclick="modifyBtnClick(2)"> <!--댓글 고유의 번호를 통해서 어떤 글인지 확인 가능-->
                수정
              </div>
            </div>
          </div>
        </div>
      </div>
    </article>

    <!--view 로 보여주는 글 옵션 버튼 클릭 시 활성화 되는 div-->
    <div class="writeOptionDiv">
      <input type="hidden"  id="clickCheck" value="off">
      <div id="modifyBoard">
        수정하기
        <i class="far fa-edit"></i>
      </div>
      <div  id="deleteBoard">
        삭제하기
        <i class="fas fa-trash-alt"></i>
      </div>
    </div>

  </body>
  <!-- Bootstrap core JS-->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js"></script>
  <!-- Third party plugin JS-->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
  <!--AOS 라이브러리-->
  <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
  <!-- JS, Popper.js, and jQuery -->
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
 
 
  <!-- Core theme JS-->
  <script src="../js/board/boardView.js"></script>
</html>
