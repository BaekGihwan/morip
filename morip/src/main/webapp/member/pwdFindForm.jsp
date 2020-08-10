<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<!--===============================================================================================-->	
<link rel="stylesheet" type="text/css" href="../css/pwdFind.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
<!--===============================================================================================-->
</head>

<body>
<input type="hidden" id="emailBtnClick" value="0"> 
	<div class="container-pwdFindForm">
			<span class="pwdFindFormTitle">비밀번호 찾기</span>
			<hr align="center" width="400px" size="4" color="black">
			
			<div class="container-pwdFindForm-text">
<!---------------------------------------------------------------------->
				<div class="container-pwdFindFormId">
					<span class="pwdFindForm-Id">이메일</span>
					
				</div>

				<input id="pwdFindFormId" type="text" placeholder="이메일을 입력하세요"><button id="emailBtn">메일 인증</button>
				<div id="nameDiv"></div>
				<div class="idDiv">
					<input id ="email-id" type="text" placeholder="인증번호를 입력하세요">
				<!-- 	<input type="hidden" id="checkCode" value="0"> -->	
					<div id="reidDiv"></div>
					<input type="hidden" id="emailCode" value="">
				</div>
<!---------------------------------------------------------------------->
				<div class="container-pwdFindFormBtn">
					<button id="pwdFindBtn">확 인</button>
					<button id="pwdFindresetBtn" type="reset">다시작성</button>
				</div>
<!---------------------------------------------------------------------------->
				<div id="modal">
					<div class="modal_content">
						<span class = "modaltext">새 비밀번호 </span><br><br>
						<hr align="center" width="300px" size="2" color="black">
						
						<input id="modalpwd" type="password" placeholder="새 비밀번호를 입력하세요"><br>
						<div id="modalDiv"></div>
						<input id="modalrepwd" type="password" placeholder="새 비밀번호를 재입력하세요"><br>
						<div id="remodalDiv"></div>
						<button id="modalBtn" type= "submit">확 인</button>
						<button id="cancelBtn">취 소</button>
					</div>
					<div class="modal_layer"></div>
				
				</div>
<!---------------------------------------------------------------------------->
		 	
		 	</div>
	</div>



<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
$('.idDiv').hide();
//비밀번호 찾기

$('#pwdFindBtn').click(function(){
		$('#nameDiv').empty();
		var regEmail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;

	    if($('#pwdFindFormId').val() == '') { 
	        $('#nameDiv').text('이메일을 입력하세요.');
	        $('#nameDiv').css('color', 'red');
	        $('#nameDiv').css('font-size', '8pt');
	        $('#nameDiv').css('font-weight', 'bold');
	        $('#pwdFindFormId').focus();
	        
	    } else  if(!regEmail.test($('#pwdFindFormId').val())){
	    	$('#nameDiv').text('이메일 형식이 올바르지 않습니다.');
	        $('#nameDiv').css('color', 'red');
	        $('#nameDiv').css('font-size', '8pt');
	        $('#nameDiv').css('font-weight', 'bold');
	        $('#pwdFindFormId').focus();         
	       
	    } else if($('#emailBtnClick').val() == '0'){
	    	alert("메일인증 버튼을 누르세요");
	    } else if($('#email-id').val() == '') {
	    	$('#reidDiv').text('메일인증번호를 입력하세요');
	        $('#reidDiv').css('color', 'red');
	        $('#reidDiv').css('font-size', '8pt');
	        $('#reidDiv').css('font-weight', 'bold');
	        $('#email-id').focus(); 
	        
	    }else if($('#email-id').val() != $('#emailCode').val()){
	    	$('#reidDiv').text('인증번호가 일치하지 않습니다.');
	        $('#reidDiv').css('color', 'red');
	        $('#reidDiv').css('font-size', '8pt');
	        $('#reidDiv').css('font-weight', 'bold');
	        $('#emailCode').focus();
	       	
		}else{
			$('#modal').css({
			      "display": "block"
			   });			   
		}
 
}); 


$('#emailBtn').click(function(){
	$('#nameDiv').empty();
	var regEmail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
	if($('#pwdFindFormId').val() == ''){
		$('#nameDiv').text('이메일을 입력하세요.');
		$('#nameDiv').css('color', 'red');
        $('#nameDiv').css('font-size', '8pt');
        $('#nameDiv').css('font-weight', 'bold');
        $('#pwdFindFormId').focus();
	} else  if(!regEmail.test($('#pwdFindFormId').val())){
   		$('#nameDiv').text('이메일 형식이 올바르지 않습니다.');
        $('#nameDiv').css('color', 'red');
        $('#nameDiv').css('font-size', '8pt');
        $('#nameDiv').css('font-weight', 'bold');
        $('#pwdFindFormId').focus();		 
	 } else {
		$.ajax({
			type: 'post',
			url: '/morip/member/checkId',
			data: {'email': $('#pwdFindFormId').val()},
			dataType: 'json',
			success: function(data){
				if(data.memberDTO == null){
					alert("존재하지 않는 회원입니다.");
				} else {
					$.ajax({
						type: 'post',
						url: '/morip/member/pwdFindMail',
						data: {'email': $('#pwdFindFormId').val()},
						dataType : 'text',
						success: function(data){
							$('#emailCode').val(data);
							$('#nameDiv').empty();
							$('#emailBtnClick').val('1');
							$('.idDiv').show();
						},
						error: function(err){
							console.log(err);
						}
					}); //ajax 메일전송
				}
			},
			error: function(err){
				console.log(err);
			}
		}); //ajax 아이디 존재여부 확인
	 }
});
$('#pwdFindBtn').click(function(){
	$('#checkCode').val('1');
});

$('#modalBtn').click(function(){
	$('#modalDiv').empty();
	$('#repwdDiv').empty();
	var regPwd = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;//

	if($('#modalpwd').val() == '') {
	$('#modalDiv').text('8-15자 이내의 영문, 숫자, 특수문자 조합으로 입력해주세요!.');
    $('#modalDiv').css('color', 'red');
    $('#modalDiv').css('font-size', '8pt');
    $('#modalDiv').css('font-weight', 'bold');
    $('#modalpwd').focus();
    
	} else  if(!regPwd.test($('#modalpwd').val())){
		$('#modalDiv').text('8-15자 이내의 영문, 숫자, 특수문자 조합으로 입력해주세요.!');
	    $('#modalDiv').css('color', 'red');
	    $('#modalDiv').css('font-size', '8pt');
	    $('#modalDiv').css('font-weight', 'bold');
	    $('#modalpwd').focus();
	
	}else if($('#modalrepwd').val() == '') {
		$('#repwdDiv').text('8-15자 이내의 영문, 숫자, 특수문자 조합으로 입력해주세요!.');
	    $('#repwdDiv').css('color', 'red');
	    $('#repwdDiv').css('font-size', '8pt');
	    $('#repwdDiv').css('font-weight', 'bold');
	    $('#modalrepwd').focus();
	    
	} else if(!regPwd.test($('#modalrepwd').val())){
		$('#remodalDiv').text('8-15자 이내의 영문, 숫자, 특수문자 조합으로 입력해주세요.!');
	    $('#remodalDiv').css('color', 'red');
	    $('#remodalDiv').css('font-size', '8pt');
	    $('#remodalDiv').css('font-weight', 'bold');
	    $('#modalrepwd').focus();
	    
	} else if($('#modalpwd').val() != $('#modalrepwd').val()){
		$('#remodalDiv').text('비밀번호가 일치하지 않습니다.');
	    $('#remodalDiv').css('color', 'red');
	    $('#remodalDiv').css('font-size', '8pt');
	    $('#remodalDiv').css('font-weight', 'bold');
	    $('#modalrepwd').focus();
	}else {
		$.ajax({
			type: 'post',
			url: '../member/changePwd',
			data: {
				'email': $('#pwdFindFormId').val(),
				'pwd': $('#modalpwd').val()
				},
			dataType : 'text',	
			success: function(data){
				alert("비번변경완료");
				location.href=data;
			},
			error: function(err){
				console.log(err);
			}
		});//ajax
		
	}

});

document.getElementById("cancelBtn").onclick = function() {
    document.getElementById("modal").style.display="none";//모달창 닫기했을때 창끄기
}   
</script>

</body>
</html>