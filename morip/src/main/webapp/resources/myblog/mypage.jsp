<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>mypage</title>
    <!-- Font Awesome icons (free version)-->
    <script src="https://use.fontawesome.com/releases/v5.13.0/js/all.js" crossorigin="anonymous"></script>
    
    <!-- Google fonts-->
	<link href="https://fonts.googleapis.com/css2?family=Indie+Flower&family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
	
    <!--AOS 라이브러리-->
     <link rel="stylesheet" href="https://unpkg.com/aos@2.3.1/dist/aos.css" />
     
    <!--hover.css-->
    <link href="../css/hover.css" rel="stylesheet" />
    
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="../css/myblog/styles1.css" rel="stylesheet" />
    
    <!-- CSS only -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
	
	<!-- JS, Popper.js, and jQuery -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
  
  </head>
  <body>
    <div id="mypageHeadder">
      <div class="backgroundImg" style="background: url(../storage/${memberDTO.backimage}) no-repeat 50% 50%; background-size: cover;">
      </div>
      <div class="layer">
      </div>
    </div>
   <div class="profileImg_wrapper">
      <div class="profileCircle">
        <div class="userProfile">
          <img class="userProfileImg" src="../storage/${memberDTO.image}" style="width:100%; height:100%;">
        </div>
      </div>
      <div class="userId">
        ${memberDTO.nickname}
      </div>
    </div>
    <input type="hidden" id="pageNickname" value="${pageNickname }">
    <input type="hidden" id="pageEmail" value="${memberDTO.email}">
    <input type="hidden" id="nickname" value="${nickname}">
  <!--content -->
  <input type="hidden" id="pg" value="1">
  <div class="content">
    <div class="content_wrapper">
      <div class="myInfo_wrapper">

        <div class="follow_wrapper">
          <div class="follower">
            <div class=" numberDiv" id="followerCountDiv"></div>
            팔로우
          </div>
          <div class="following" >
            <div class=" numberDiv" id="followingCountDiv"></div>
            팔로잉
          </div>
          <div class="listCount">
            <div class=" numberDiv" id="blogboardtableDiv"></div>
            <p>게시물</p>
          </div>
        </div>
        <button type="button" class="btn btn-outline-secondary" id="writeOptionBtn" style="font-size:9px; border-radius:20px; width:100px;">글 작성</button>
        <button type="button" class="btn btn-outline-secondary" id="modifyMemberBtn" style="font-size:9px; border-radius:20px; width:100px;">회원정보수정</button>
        <button type="button" class="btn btn-outline-primary" id="followBtn"style="font-size: 9px; border-radius: 20px; width: 100px;">팔로우</button>
		<input type="hidden" id="followCheck" value="uncheck">
      </div>

      <div class="myBlog_wrapper">
        <table id="tableHeadder">
          <tr>
            <td style="font-size:9px; border-top:2px solid; font-weight:bold; width:8%; height:30px;">여행기</td>
            <td style="border-top: 1px solid; width:92%;"></td>
          </tr>
        </table>
      </div>
    </div>
  </div>
  </body>
  <!---->
  <!------------- Modal --------------->
  <!-- 팔로우 모달창 -->
  <div class="modal fade" id="followModal" role="dialog">
    <div class="modal-dialog">

      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title"></h4>
          <button type="button" class="close" data-dismiss="modal">×</button>

        </div>
        <div class="modal-body">
          <table class="modal_table" id="modal_followtable">
            <tr>
              <td style="width:70px;"><img id="modal_userImg"src="../image/myblog/paris.jpg"></td>
              <td id="modal_userID">USER_ID</td>
              <td id="modal_userFollow"><button class="btn btn-outline-primary">팔로우</button></td>
            </tr>
            <tr>
              <td style="width:70px;"><img id="modal_userImg"src="../image/myblog/circus.png"></td>
              <t2d id="modal_userID">USER_ID</td>
              <td id="modal_userFollow"><buttton class="btn btn-outline-primary">팔로우</button></td>
            </tr>
            <tr>
              <td style="width:70px;"><img id="modal_userImg"src="../image/myblog/safe.png"></td>
              <td id="modal_userID">USER_ID</td>
              <td id="modal_userFollow"><buttton class="btn btn-outline-primary">팔로우</button></td>
            </tr>
            <tr>
              <td style="width:70px;"><img id="modal_userImg"src="../image/myblog/user.png"></td>
              <td id="modal_userID">USER_ID</td>
              <td id="modal_userFollow"><buttton class="btn btn-outline-primary">팔로우</button></td>
            </tr>
            <tr>
              <td style="width:70px;"><img id="modal_userImg"src="../image/myblog/cake.png"></td>
              <td id="modal_userID">USER_ID</td>
              <td id="modal_userFollow"><buttton class="btn btn-outline-primary">팔로우</button></td>
            </tr>
          </table>
        </div>
        <div id="count" value="1"></div>
      </div>
    </div>
  </div>
  <!-- 팔로잉 모달창 -->
  <div class="modal fade" id="followingModal" role="dialog">
    <div class="modal-dialog">

      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title"></h4>
          <button type="button" class="close" data-dismiss="modal">×</button>

        </div>
        <div class="modal-body">
          <table class="modal_table" id="modal_followingtable">
            <tr>
              <td style="width:70px;"><img id="modal_userImg"src="../image/myblog/paris.jpg"></td>
              <td id="modal_userID">USER_ID</td>
              <td id="modal_userFollow"><button class="btn btn-outline-primary">팔로잉</button></td>
            </tr>
          </table>
        </div>
        <div id="count" value="1"></div>
      </div>
    </div>
  </div>
   <!-- 글작성 BTN -->
  <div class="modal fade" id="writeOptionModal" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-body">
        	<button type="button" class="close" data-dismiss="modal">×</button>
        	<div class="bodyHeader">새로 만들기</div>
			<div class="writeOptionWrapper">
				<div class="travelsWriteWrapper">
					<div id="travelsWriteImg" class="hvr-grow-shadow"><i id="writeOptionImg" class="fas fa-suitcase" ></i></div>
					<div class="optionContentWrapper">
						<h5>여행기</h5>
						<div id="optionText">여행 기록을 코스별, 일정별로 깔끔하게 기록해보세요.</div>
					</div>
				</div>
				<div class="writeBlogWrapper">
					<div id="writeBlogImg" class="hvr-grow-shadow"><i id="writeOptionImg" class="far fa-edit"></i></div>
					<div class="optionContentWrapper">
						<h5>M에세이</h5>
						<div id="optionText">여행을 자유롭게 나만의 에세이로 기록해보세요.</div>
					</div>
				</div>
			</div>
        </div>
        <div id="count" value="1"></div>
      </div>
    </div>
  </div>
  <!-- Bootstrap core JS-->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js"></script>
  
  <!-- Third party plugin JS-->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
  
  <!--AOS 라이브러리-->
  <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
  
  <!-- Core theme JS-->
  <script src="../js/myblog/scripts.js"></script>
  
  <script>
  AOS.init({
      easing: 'ease-out-back',
      duration: 1000
  });
  $(document).ready(function(){
		//팔로우 체크
		$.ajax({
			type: 'post',
			url: '/morip/myblog/followCheck',
			data: {'follow_email' : 'ka28@naver.com'},
			dataType: 'json',
			success: function(data){
				if(data.getNickname == data.nickname){
					$('#followBtn').attr('class', 'btn btn-outline-primary');
					$('#followBtn').text('팔로우');
					$('#followCheck').val('uncheck');
				}else{
					$('#followBtn').attr('class', 'btn btn-outline-dark');
					$('#followBtn').text('팔로잉');
					$('#followCheck').val('check');
				}
			},
			error: function(err){
				console.log(err);
			}
		});
		//팔로우 한 사람의 숫자
		$.ajax({
	        type: 'post',
	        url: '/morip/myblog/followerSize',
	        data: {'follow_email' : 'ka28@naver.com'},
	        dataType: 'json',
	        success: function(data){
				$('#followerCountDiv').text(data.size);
	        },
	        error: function(err){
	          console.log(err);
	        }
	      });
	
		//팔로잉 한 사람의 숫자
		$.ajax({
	        type: 'post',
	        url: '/morip/myblog/followingSize',
	        data: {'email' : 'ka28@naver.com'},
	        dataType: 'json',
	        success: function(data){
				$('#followingCountDiv').text(data.size);
	        },
	        error: function(err){
	          console.log(err);
	        }
		});
		
		//좋아요 체크
		$.ajax({
	      type: 'post',
	      url: '/morip/myblog/likeCheck',
	      dataType: 'json',
	      success: function(data){
	        $.each(data.list, function(index, items){
	          if($('#likeValue'+items.board_seq).val() == 'uncheck'){
	            $('.like'+items.board_seq).html('<i class="far fa-heart"></i>');
	            $('#likeCheck'+items.board_seq).val('unlike');
	          }else{
	            $('.like'+items.board_seq).html('<i class="fas fa-heart" style="color:red;"></i>');
	            $('#likeCheck'+items.board_seq).val('like');
	          }
	        }); //each
	      }, // success
	      error: function(err){
	        console.log(err);
	      } // error
	 	}); // ajax
		
	 	//좋아요 숫자
	      $.ajax({
	        type: 'post',
	        url: '/morip/myblog/likeListSize',
	        dataType: 'json',
	        success: function(data){
	        	$.each(data.list, function(index, items){
	          		$('.likeCount'+items.blogboardtable_seq).html('&nbsp;&nbsp;&nbsp;'+items.likecount);
	        	});
	        },
	        error: function(err){
	          console.log(err);
	        }
	      });
	 	
	    //게시물 숫자 체크
	    $.ajax({
	      type: 'post',
	      url: '/morip/myblog/boardSize',
	      data: {'email' : 'ka28@naver.com'},
	      dataType: 'json',
	      success: function(data){
	    	  $('#blogboardtableDiv').text(data.size);
	      },
	      error: function(err){
	        console.log(err);
	      }
	    });
	});
  </script>
</html>
