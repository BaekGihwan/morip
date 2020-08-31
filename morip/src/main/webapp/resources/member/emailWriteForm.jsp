<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!--===============================================================================================-->	
<link rel="stylesheet" type="text/css" href="../css/member/emailWriteForm.css">
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<!--===============================================================================================-->
</head>
<body>
	<div class="container-emailWriteForm">
			<span class="emailWriteFormTitle">회원가입</span>
			<!-- <hr align="center" width="400px" size="4" color="black"> -->
			<div class="hr"></div>
			
			<div class="container-emailWriteForm-text">
<!---------------------------------------------------------------------->
				<div class="container-emailWriteFormId">
					<span class="emailWriteForm-Id">이메일</span>
				</div>

				<input id="emailWriteFormId" type="text" placeholder="이메일을 입력하세요"><button id="emailBtn">메일 인증</button>
				<input type="hidden" id="mailCheck" value="0">	
				<div id="nameDiv"></div>
				<div class="idDiv">
					<input id ="email-id" type="text" placeholder="인증번호를 입력하세요"><button id="okBtn">확 인</button>
					<input type="hidden" id="checkCode" value="0">	
					<div id="reidDiv"></div>
				</div>
<!---------------------------------------------------------------------->
				<div class="container-emailWriteForm-pwd">
					<span class="emailWriteForm-pwd">비밀번호</span>
					
				</div>
				
					<input id="emailWriteFormPwd" type="password" placeholder="비밀번호를 입력하세요"> 
					<div id="pwdDiv"></div>
					
					<div class="emailWriteFormrepwd">
						<input id ="repwd" type="password" placeholder="비밀번호를 재입력하세요">
						<div id="repwdDiv"></div>
					</div>
<!---------------------------------------------------------------------->
				<!-- <div class="container-emailBtn">
				<span><input id="email" type="text">
					<button id="emailBtn">메일 인증</button></span>
				</div> -->
<!---------------------------------------------------------------------->
				<div class="container-emailWriteFormBtn">
					<button type="button" id="emailWriteFormBtn">다음단계</button>
					<button id="emailWriteFormresetBtn" type="reset">다시작성</button>
				</div>
<!---------------------------------------------------------------------------->
		 	</div>
	</div>

</body>


<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
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
		Swal.fire({
			title: '필수',
			text: "메일 인증을해주세요.",
			icon: 'warning',
			confirmButtonColor: '#3085d6',
			cancelButtonColor: '#d33',
			confirmButtonText: '확인'
		})
	} else if($('#emailWriteFormId').val() == '') { // 이거는 id속성으로 해서 찾는거다
        $('#nameDiv').text('이메일을 입력하세요.');
        $('#nameDiv').css('color', 'red');
        $('#nameDiv').css('font-size', '9pt');
        $('#nameDiv').css('font-weight', 'bold');
        $('#emailWriteFormId').focus();
       
    } else if($('#email-id').val() == '') {
    	$('#reidDiv').text('인증번호를 입력하세요');
        $('#reidDiv').css('color', 'red');
        $('#reidDiv').css('font-size', '9pt');
        $('#reidDiv').css('font-weight', 'bold');
        $('#email-id').focus();    
        
    } else if($('#emailWriteFormPwd').val() == '') {
    	$('#pwdDiv').text('비밀번호를 입력하세요');
        $('#pwdDiv').css('color', 'red');
        $('#pwdDiv').css('font-size', '9pt');
        $('#pwdDiv').css('font-weight', 'bold');
        $('#emailWriteFormPwd').focus();
    
    } else if($('#emailWriteFormPwd').val() != $('#repwd').val()){
    	$('#repwdDiv').text('비밀번호가 일치하지 않습니다.');
        $('#repwdDiv').css('color', 'red');
        $('#repwdDiv').css('font-size', '9pt');
        $('#repwdDiv').css('font-weight', 'bold');
        $('#repwd').focus();    
        
    } else if($('#checkCode').val() == '0' && $('#email-id').val() != '') {
    	Swal.fire({
			title: '필수',
			text: "메일 인증을해주세요.",
			icon: 'warning',
			confirmButtonColor: '#3085d6',
			cancelButtonColor: '#d33',
			confirmButtonText: '확인'
		})
	} else {
		$.ajax({
			type : 'post',
			url : '/morip/member/writeForm',
			data : {'email' : $('#emailWriteFormId').val(),
				    'pwd' : $('#emailWriteFormPwd').val()},
			success : function() {
				location.href = '../member/writeForm2';
			},
			error : function(err) {
				console.log(err);
			}
		});
	}
});

//다시 작성 버튼
$('#emailWriteFormresetBtn').click(function(){
	$('#nameDiv').empty();
	$('#reidDiv').empty();
	$('#pwdDiv').empty();
	$('#repwdDiv').empty();
	$('#emailWriteFormId').val('');
	$('#email-id').val('');
	$('#emailWriteFormPwd').val('');
	$('#repwd').val('');
	$('#emailWriteFormId').focus();
});

$('#emailWriteFormPwd').focusout(function(){
	if(!regPwd.test($('#emailWriteFormPwd').val())){
		$('#pwdDiv').text('8-15자 이내의 영문, 숫자, 특수문자 조합으로 입력해주세요!');
        $('#pwdDiv').css('color', 'red');
        $('#pwdDiv').css('font-size', '9pt');
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
        $('#nameDiv').css('font-size', '9pt');
        $('#nameDiv').css('font-weight', 'bold');
        $('#emailWriteFormId').focus();
	} else if(!regEmail.test($('#emailWriteFormId').val())){
		$('#nameDiv').text('이메일 형식이 올바르지 않습니다.');
        $('#nameDiv').css('color', 'red');
        $('#nameDiv').css('font-size', '9pt');
        $('#nameDiv').css('font-weight', 'bold');
        $('#emailWriteFormId').focus();
    }else{
    	$.ajax({
    		type : 'post',
    		url : '/morip/member/checkId',
    		data : '&email=' + $('#emailWriteFormId').val() + '&checkid=' + '1',
    		dataType : 'json',
    		success : function(data) {
    			if (data.memberDTO == null) {
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
    				}); // ajax 메일인증
    			} else {
    				$('#nameDiv').text('존재하는 아이디입니다.');
    				$('#nameDiv').css('color', 'red');
    				$('#nameDiv').css('font-size', '9pt');
    		        $('#nameDiv').css('font-weight', 'bold');
    		        $('#emailWriteFormId').focus();
    			}
    		},
    		error : function(err) {
    			console.log(err);
    		}
    	});
    }
});

$('#okBtn').click(function(){
	if($('#email-id').val() == ''){
		$('#reidDiv').text('메일인증번호를 입력하세요');
        $('#reidDiv').css('color', 'red');
        $('#reidDiv').css('font-size', '9pt');
        $('#reidDiv').css('font-weight', 'bold');
        $('#email-id').focus();  
	} else{
		if($('#email-id').val() == code){
			$('#reidDiv').text('인증번호가 일치합니다.');
			$('#reidDiv').css('color', 'blue');
	        $('#reidDiv').css('font-size', '9pt');
	        $('#reidDiv').css('font-weight', 'bold');
	        $('#emailWriteFormPwd').focus();
			$('#checkCode').val('1');
		} else{
			$('#reidDiv').text('인증번호가 일치하지 않습니다.');
	        $('#reidDiv').css('color', 'red');
	        $('#reidDiv').css('font-size', '9pt');
	        $('#reidDiv').css('font-weight', 'bold');
	        $('#email-id').focus();  
		}		
	}
});
</script>