<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>
<!--===============================================================================================-->
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="../css/member/memberModifyForm.css">
<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css" rel="stylesheet">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
</head>
<body>
  <form name="memberModifyProfile" id="memberModifyProfile" method="post" enctype="multipart/form-data">
    <div class="container-memberModifyForm">
      <!-- 타이틀 -->
      <span class="memberModifyFormTitle">회원정보 수정</span>	
      <!-- <hr align="center" width="400px" size="4" color="black"><br> -->
      <div class="hr"></div>
      <br>
      <div class="container-memberModifyForm-text">
      <div class="box11">
         <div class="container-memberModifyprofile">
           <img class="modifyProfile" alt="" src="../storage/${memberDTO.image }">
           <div class="userProfile">
             <div class="userName">${memberDTO.name }</div>
             <div class="changeImage">
             <label for="image">프로필 사진변경</label>
		     <input type="file" name="img" id="image" class="btn-file" onchange="change(this.files)">
             </div>
           </div>
         </div>
      </div> <!-- box11 -->
      
      <div class="box22">
         <!-- 이메일 보여주는 부분 여기는 수정 불가! -->
		<div class="container-memberModifyFormEmail">
		  <span class="memberModifyForm-email">이메일</span>					
		</div>				
		<input name="email" id="memberModifyFormEmail" type="text" value="${memberDTO.email }" readonly> 
     	
     	<c:if test="${checkid == 1}">
     	<!-- 비밀번호 변경 -->
		<div class="container-memberModifyForm-pwd">
		  <span class="memberModifyForm-pwd">비밀번호</span>					
		</div>		
		<input name="pwd" id="memberModifyFormPwd" type="password" placeholder="비밀번호를 입력하세요"> 
		<div id="pwdDiv"></div>       
      	<!-- 재확인비밀번호 변경 -->
		<div class="container-memberModifyForm-repwd">
		  <span class="memberModifyForm-repwd">재확인 비밀번호</span>					
		</div>  
		<input name="repwd" id="memberModifyFormRepwd" type="password" placeholder="재확인 비밀번호를 입력하세요"> 
		<div id="repwdDiv"></div>    
		</c:if> 
		
		<!-- 닉네임 변경 -->
		<div class="container-memberModifyForm-nickName">
		  <span class="memberModifyForm-nickName">닉네임</span>					
		</div>  
		<input name="nickname" id="memberModifyFormNickName" type="text" value="${memberDTO.nickname }" placeholder="닉네임을 입력하세요"> 
		<div id="nickNameDiv"></div> 
		<!-- 성별 변경 -->
		<div class="container-memberModifyForm-gender">
		  <span class="memberModifyForm-gender">성별</span>
		</div>
		<!-- 성별 선택 부분 -->
		<span>
		  <input id="gender1" type="radio" name="gender" value="0" checked> 남 &emsp;&emsp;
		  <input id="gender2" type="radio" name="gender" value="1"> 여
		</span>   		
		<!-- 버튼 -->
		<div class="container-memberModifyFormBtn">
		  <button type="button" id="memberModifyFormBtn">정보수정</button>
		  <button type="button" id="memberModifyFormResetBtn">다시작성</button>
		  <button type="button" id="memberModifyFormDropBtn">회원탈퇴</button>
		</div>  
      </div> <!-- box22 -->
    </div>
    </div> <!-- container-emailModifyForm -->  
  </form>  
</body>   
<br>
<!--===============================================================================================-->
<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script type="text/javascript" src="../js/member/memberModifyForm.js"></script>
<script type="text/javascript">
$(function(){
	if("${memberDTO.gender}" == "0"){
		document.getElementById("gender1").checked = true
   	}else {
   		document.getElementById("gender2").checked = true;   
   	}
});
</script>

