<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<head>
<title>회원정보 수정</title>
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="../css/emailModifyForm.css">
<!--===============================================================================================-->
</head>
<body>
  <div class="container-emailModifyForm">
    <!-- 타이틀 -->
    <span class="emailModifyFormTitle">회원정보 수정</span>	
    <hr align="center" width="400px" size="4" color="black"><br>
    <div class="container-emailModifyForm-text">
      <!-- 프로필 -->
      <div class="box_container">
        <div class="box1">
          <div class="container-emailModifyprofile">
            <div class="modifyProfile" style="background-image: url('../image/test.jpg')";></div>
            <div class="userProfile">
		      <div class="userName">백기환</div>
		      <div class="chageProfileBtn">프로필 사진 바꾸기</div>
		    </div>
          </div>
        </div>
        <div class="box2">
        <!-- 이메일 보여주는 부분 여기는 수정 불가! -->
		<div class="container-emailModifyFormEmail">
		  <span class="emailModifyForm-email">이메일</span>					
		</div>				
		<input id="emailModifyFormEmail" type="text" readonly> 
		<!-- 비밀번호 변경 -->
		<div class="container-emailModifyForm-pwd">
		  <span class="emailModifyForm-pwd">비밀번호</span>					
		</div>		
		<input id="emailModifyFormPwd" type="password" placeholder="비밀번호를 입력하세요"> 
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
		<div class="container-emailModifyForm-repwd">
		  <span class="emailModifyForm-repwd">재확인 비밀번호</span>					
		</div>  
		<input id="emailModifyFormRepwd" type="password" placeholder="재확인 비밀번호를 입력하세요"> 
		<div id="repwdDiv"></div>    
		<!-- 닉네임 변경 -->
		<div class="container-emailModifyForm-nickName">
		  <span class="emailModifyForm-nickName">닉네임</span>					
		</div>  
		<input id="emailModifyFormNickName" type="text" placeholder="닉네임을 입력하세요"> 
		<div id="nickNameDiv"></div> 
		<!-- 성별 변경 -->
		<div class="container-writeForm-gender">
		  <span class="writeForm-gender">성별</span>
		</div>
		<span>
		  <input id="gender1" type="radio" name="gender" value="0" checked> 남 &emsp;&emsp;
		  <input id="gender2" type="radio" name="gender" value="1"> 여
		</span>     
		<!-- 아래 버튼 -->
		<div class="container-emailModifyFormBtn">
		  <button type="button" id="emailModifyFormBtn">정보수정</button>
		  <button id="emailModifyFormresetBtn" type="reset">다시작성</button>
		  <button id="emailModifyFormDropBtn" type="reset">회원탈퇴</button>
		</div>  
        </div>
      </div>
    </div>
  </div> <!-- container-emailModifyForm -->
</body>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
//회원가입
$('.idDiv').hide();
var regEmail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
var regPwd = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;//
var code;
$('#emailWriteFormBtn').click(function(){
	$('#nameDiv').empty();
	$('#reidDiv').empty();
	$('#pwdDiv').empty();
	$('#repwdDiv').empty();
	
	if($('#mailCheck').val() == '0'){
		alert("메일 인증을 해주세요.");
	} else if($('#emailWriteFormId').val() == '') { // 이거는 id속성으로 해서 찾는거다
        $('#nameDiv').text('이메일을 입력하세요.');
        $('#nameDiv').css('color', 'red');
        $('#nameDiv').css('font-size', '8pt');
        $('#nameDiv').css('font-weight', 'bold');
        $('#emailWriteFormId').focus();
       
    } else if($('#email-id').val() == '') {
    	$('#reidDiv').text('인증번호를 입력하세요');
        $('#reidDiv').css('color', 'red');
        $('#reidDiv').css('font-size', '8pt');
        $('#reidDiv').css('font-weight', 'bold');
        $('#email-id').focus();    
        
    } else if($('#emailWriteFormPwd').val() == '') {
    	$('#pwdDiv').text('비밀번호를 입력하세요');
        $('#pwdDiv').css('color', 'red');
        $('#pwdDiv').css('font-size', '8pt');
        $('#pwdDiv').css('font-weight', 'bold');
        $('#emailWriteFormPwd').focus();
    
    } else if($('#emailWriteFormPwd').val() != $('#repwd').val()){
    	$('#repwdDiv').text('비밀번호가 일치하지 않습니다.');
        $('#repwdDiv').css('color', 'red');
        $('#repwdDiv').css('font-size', '8pt');
        $('#repwdDiv').css('font-weight', 'bold');
        $('#repwd').focus();    
        
    } else if($('#checkCode').val() == '0' && $('#email-id').val() != '') {
    	alert("인증번호 확인을 체크해주세요.");
	} else {
		$.ajax({
			type : 'post',
			url : '/morip/member/writeForm',
			data : {'email' : $('#emailWriteFormId').val(),
				    'pwd' : $('#emailWriteFormPwd').val()},
			dataType : 'text',
			success : function(data) {
				location.href = data;
			},
			error : function(err) {
				console.log(err);
			}
		});
	}
});


$('#emailWriteFormPwd').focusout(function(){
	if(!regPwd.test($('#emailWriteFormPwd').val())){
		$('#pwdDiv').text('8-15자 이내의 영문, 숫자, 특수문자 조합으로 입력해주세요!.');
        $('#pwdDiv').css('color', 'red');
        $('#pwdDiv').css('font-size', '8pt');
        $('#pwdDiv').css('font-weight', 'bold');
        $('#emailWriteFormPwd').focus();
	} else{
		$('#pwdDiv').text('');
		$('#repwd').focus();
	}
});
 
$('#emailWriteFormPwd').keypress(function(){
	$('.emailWriteFormrepwd').css({
		"display": "block"
	});
	$('.emailWriteFormrepwd').focus();
});
 
$('#emailBtn').click(function(){
	if($('#emailWriteFormId').val() == ''){
		$('#nameDiv').text('이메일을 입력하세요.');
        $('#nameDiv').css('color', 'red');
        $('#nameDiv').css('font-size', '8pt');
        $('#nameDiv').css('font-weight', 'bold');
        $('#emailWriteFormId').focus();
	} else if(!regEmail.test($('#emailWriteFormId').val())){
		$('#nameDiv').text('이메일 형식이 올바르지 않습니다.');
        $('#nameDiv').css('color', 'red');
        $('#nameDiv').css('font-size', '8pt');
        $('#nameDiv').css('font-weight', 'bold');
        $('#emailWriteFormId').focus();
    }else{
    	$('#nameDiv').empty();
		$('.idDiv').show();
		$('#mailCheck').val('1');
		$.ajax({
			type: 'post',
			url: '/morip/member/sendMail',
			data: {'email': $('#emailWriteFormId').val()},
			dayaType: 'text',
			success: function(data){
				code = data;
			},
			error: function(err){
				console.log(err);
			}
		}); // ajax
    }
});

$('#okBtn').click(function(){
	if($('#email-id').val() == ''){
		$('#reidDiv').text('메일인증번호를 입력하세요');
        $('#reidDiv').css('color', 'red');
        $('#reidDiv').css('font-size', '8pt');
        $('#reidDiv').css('font-weight', 'bold');
        $('#email-id').focus();  
	} else{
		if($('#email-id').val() == code){
			$('#reidDiv').text('인증번호가 일치합니다.');
			$('#reidDiv').css('color', 'blue');
	        $('#reidDiv').css('font-size', '8pt');
	        $('#reidDiv').css('font-weight', 'bold');
	        $('#emailWriteFormPwd').focus();
			$('#checkCode').val('1');
		} else{
			$('#reidDiv').text('인증번호가 일치하지 않습니다.');
	        $('#reidDiv').css('color', 'red');
	        $('#reidDiv').css('font-size', '8pt');
	        $('#reidDiv').css('font-weight', 'bold');
	        $('#email-id').focus();  
		}		
	}
});
</script>