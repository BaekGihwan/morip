<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<head>
<title>회원정보 수정</title>
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="../css/emailModifyForm.css">
<!--===============================================================================================-->
</head>
<body>
  <div class="container-memberModifyForm">
    <!-- 타이틀 -->
    <span class="memberModifyFormTitle">회원정보 수정</span>	
    <hr align="center" width="400px" size="4" color="black"><br>
    <div class="container-memberModifyForm-text">
      <!-- 프로필 -->
      <div class="box_container">
        <div class="box1">
          <div class="container-memberModifyprofile">
            <div class="modifyProfile" style="background-image: url('../image/test.jpg')"></div>
            <div class="userProfile">
		      <div class="userName">백기환</div>
		      <div class="chageProfileBtn">프로필 사진 바꾸기</div>
		    </div>
          </div>
        </div>
        <div class="box2">
        <!-- 이메일 보여주는 부분 여기는 수정 불가! -->
		<div class="container-memberModifyFormEmail">
		  <span class="memberModifyForm-email">이메일</span>					
		</div>				
		<input id="memberModifyFormEmail" type="text" readonly> 
		<!-- 비밀번호 변경 -->
		<div class="container-memberModifyForm-pwd">
		  <span class="memberModifyForm-pwd">비밀번호</span>					
		</div>		
		<input id="memberModifyFormPwd" type="password" placeholder="비밀번호를 입력하세요"> 
		<div id="pwdDiv"></div>          
        </div>
      </div>
    
      <!-- empty -->
      <div class="box_container">
        <div class="box1">
          <div class="empty">
          </div>
        </div>
        <div class="box2">
        <!-- 재확인비밀번호 변경 -->
		<div class="container-memberModifyForm-repwd">
		  <span class="memberModifyForm-repwd">재확인 비밀번호</span>					
		</div>  
		<input id="memberModifyFormRepwd" type="password" placeholder="재확인 비밀번호를 입력하세요"> 
		<div id="repwdDiv"></div>    
		<!-- 닉네임 변경 -->
		<div class="container-memberModifyForm-nickName">
		  <span class="memberModifyForm-nickName">닉네임</span>					
		</div>  
		<input id="memberModifyFormNickName" type="text" placeholder="닉네임을 입력하세요"> 
		<div id="nickNameDiv"></div> 
		<!-- 성별 변경 -->
		<div class="container-memberModifyForm-gender">
		  <span class="memberModifyForm-gender">성별</span>
		</div>
		<span>
		  <input id="gender1" type="radio" name="gender" value="0" checked> 남 &emsp;&emsp;
		  <input id="gender2" type="radio" name="gender" value="1"> 여
		</span>     
		<!-- 아래 버튼 -->
		<div class="container-memberModifyFormBtn">
		  <button type="button" id="memberModifyFormBtn">정보수정</button>
		  <button type="button" id="memberModifyFormresetBtn" type="reset">다시작성</button>
		  <button type="button" id="memberModifyFormDropBtn">회원탈퇴</button>
		</div>  
        </div>
      </div>
    </div>
  </div> <!-- container-emailModifyForm -->
</body>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<!-- Optional: include a polyfill for ES6 Promises for IE11 -->
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/promise-polyfill"></script>
<script type="text/javascript" src="../js/member.js"></script>
