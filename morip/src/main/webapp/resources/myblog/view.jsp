<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>view</title>
    <!-- jQuery -->
    <script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
    <!-- 합쳐지고 최소화된 최신 CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <!-- Font Awesome icons (free version)-->
    <script src="https://use.fontawesome.com/releases/v5.13.0/js/all.js" crossorigin="anonymous"></script>
    <!-- 부가적인 테마 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    <!-- 구글 폰트 -->
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@700&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../css/myblog/view.css">
    
  </head>
  <body>
    <div class="navber-header" style="height:86px;">
      <!--여기가 네비게이셔션 바가 들어갈 자리-->
      <input type="hidden" class="view_seq" value="${seq }">
    </div>
    <header>
      <div class="background">
      	<div class="backgroundImg" style="background: url('../storage/${myblogDTO.mainimage}') no-repeat 50% 50%; background-size: cover;">s </div>
      	<div class="backgroundCover" ></div>
      </div>
      <div class="subjectbackground">
          <div class="blogSubjectWrapper">
            <div class="dateWrapper">
              ${myblogDTO.startdate} ~ ${myblogDTO.enddate}
            </div>
            <div class="subjectWrapper">
              ${myblogDTO.subject}
            </div>
            <div class="userinfowrapper">
              <img class="view_userImg"src="../image/myblog/pic01.jpg">
              <div class="view_userId">
              	${myblogDTO.nickname}
              </div>
            </div>
          </div>
      </div>
    </header>
    <div class="sideBar">
      <div class="likeOption">
        <button id="likeBtn">
        <i id="likeI" class="far fa-heart"></i>
      </button>
        <input type="hidden" id="likeViewCheck" value="">
        <p id="likeSize"></p>
      </div>
      <div class="replyOption">
        <i id="replyBtn" class="far fa-comment-dots"></i>
        <p id="replySize"></p>
      </div>
    </div>
    <article class="contentContainer">
      <div class="contentWrapper">
        <div class="content">
          <div class="contentInner">
          	${myblogDTO.content}
          </div>
          <div class="view_boardOption">
            <div class="view_like">
              <div class="view_likeWrapper">
                <i class="" id="likeBtn" style="margin-right:10px;"></i>
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
          <!--하단의 댓글 창 클릭(아마 이 부분은 AJAX 로 구현하실 것 같은데 class="view_replyBoard" 부븐을 전부 append 해주셔야 할 겁니다. )-->
          <div class="view_replyBoard" id="view_replyBoard">
            <div class="view_boardReplyInputWrapper">
              <div class="view_replyContentInputWrapper">
                <div class="reply_contentInput">
                    <div class="reply_userID">
                      ${myblogDTO.nickname}
                    </div>
                    <textarea id="replyInputBox${seq }" class="form-control" aria-label="With textarea"></textarea>
                    <div class="reply_inputOption">
                      <button id="insertBtn" class="btn btn-light" onclick="insertBtn(${seq})">등록</button>
                    </div>
                </div>
              </div>
            </div>
            <input type="hidden" class="replySeq" value="1"> <!--댓글 고유의 번호를 통해서 어떤 글인지 확인 가능-->
            <input type="hidden" class="checkReplyInput" value="off">
            <div class="replyInsertDiv">
            <!-- 댓글이 추가(append)되는 부분  -->
            </div>
          </div>
        </div>
      </div>
      <div class="view_controlOption">
        <i id="view_boardOption" class="fas fa-ellipsis-v" style="cursor:pointer;"></i>
      </div>
    </article>
    
    
    <!-- modal 댓글창 띄우기 -->
    <div class="modal fade" id="cmt-modal" role="dialog">
    	<div class="modal-dialog">
    		<div class="modal-content">
    			<div class="modal-header">
    				<h5 class="modal-title" id="cmt-title">댓글</h5>
    				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
    				<span aria-hidden="true">&times;</span></button><br>
    			</div>
    			<div class="modal-body">
    				<div class="container">
              <div class="view_replyBoard" id="view_replyBoardModal2" style="display:block;">
                <div class="view_replyListWrapper">
                  <div class="view_replyList">
                    <div class="view_userImgWrapper">
                      <img class="view_userImg" src="../image/myblog/game.png">+++++++++++++
                      
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
                    <div id="replyBtn1" class="hvr-grow" onclick="replyBtnClick(${seq})"> <!--댓글 고유의 번호를 통해서 어떤 글인지 확인 가능-->
                      답글
                    </div>
                    <div id="deleteBtn" class="hvr-grow" onclick="deleteBtnClick(${seq})"> <!--댓글 고유의 번호를 통해서 어떤 글인지 확인 가능-->
                      삭제
                    </div>
                    <div id="modifyBtn" class="hvr-grow" onclick="modifyBtnClick(${seq})"> <!--댓글 고유의 번호를 통해서 어떤 글인지 확인 가능-->
                      수정
                    </div>
                  </div>
                </div>
              </div>
    				</div>
    			</div>
    			<div class="modal-footer">
    				<div class="cmt-textarea">
    					<input type="text"  id="cmt-text" placeholder="댓글입력">
    				</div>
    				<div class="cmt-btn">
    					<button type="button" id="cmt-btn">입력</button>
    				</div>
    			</div>
    		</div>
    	</div>
    </div>
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
    <script type="text/javascript">
    $(document).ready(function(){
    	console.log($('.view_seq').val());
    	var seq = $('.view_seq').val();
      //좋아요 체크
      $.ajax({
          type: 'post',
          url: '/morip/myblog/likeViewCheck',
          data: 'seq='+$('.view_seq').val(),
          dataType: 'json',
          success: function(data){
        	  if(data.likeDTO == null){
                  $('#likeI').attr('class', 'far fa-heart');
                  $('#likeViewCheck').attr('value', 'unlike');
              }else if(data.likeDTO.board_seq == seq){
            	  $('#likeI').attr('class', 'fas fa-heart');
            	  $('#likeI').css('color', 'red');
            	  $('#likeViewCheck').attr('value', 'like');
              } 
          }, // success
          error: function(err){
            console.log(err);
          } // error
      }); // ajax
      
      //좋아요 숫자
      $.ajax({
        type: 'post',
        url: '/morip/myblog/likeSize',
        data: 'seq='+seq,
        dataType: 'json',
        success: function(data){
          $('#likeSize').text(data.likeSize);
        },
        error: function(err){
          console.log(err);
        }
      });
      
      //댓글 숫자
      $.ajax({
    	  type: 'post',
    	  url: '/morip/myblog/replySize',
    	  data: 'seq='+seq,
    	  dataType: 'json',
    	  success: function(data){
    		  $('#replySize').text(data.size);
    	  },
    	  error: function(err){
    		  console.log(err);
    	  }
      });
    });
    </script>
  </body>
  <!-- sweetAlert -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script src="../js/myblog/view.js"></script>
</html>