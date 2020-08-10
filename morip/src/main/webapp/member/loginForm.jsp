<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="../image/favicon.ico"/>
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="../vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
<!-- 	<link rel="stylesheet" type="text/css" href="../fonts/font-awesome-4.7.0/css/font-awesome.min.css">
===============================================================================================
	<link rel="stylesheet" type="text/css" href="../fonts/Linearicons-Free-v1.0.0/icon-font.min.css"> -->
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="../vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="../vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../css/util.css">
	<link rel="stylesheet" type="text/css" href="../css/login.css">
<!--===============================================================================================-->
</head>
<body>
<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100 p-l-110 p-r-110 p-t-62 p-b-33">
				<form class="login100-form validate-form flex-sb flex-w">
					<span class="login100-form-title p-b-53">
						로그인
					</span>

					<a id="kakaoLoginBtn" class="btn-face m-b-20" style="cursor: pointer;">
						<img height="45px" width="45px" src="../image/icon-kakao.png" alt="">
						kakaotalk
					</a>

					<a class="btn-google m-b-20" style="cursor: pointer;" 
						onclick="
						gauth.signIn().then(function(){
							console.log('gauth.signIn()');
							checkLoginStatus();
						});
					">
						<img src="../image/icon-google.png" alt="GOOGLE"
							onclick="
								gauth.signIn().then(function(){
									console.log('gauth.signIn()');
									checkLoginStatus();
								});
						"/>
						Google
					</a>
					
					<div class="p-t-31 p-b-9">
						<span class="txt1">
							이메일
						</span>
					</div>
					<div class="wrap-input100 validate-input" data-validate = "Username is required">
						<input class="input100" type="text" name="username" id="email">
						<span class="focus-input100"></span>
					</div>
					
					<div class="p-t-13 p-b-9">
						<span class="txt1">
							비밀번호
						</span>

					</div>
					<div class="wrap-input100 validate-input" data-validate = "Password is required">
						<input class="input100" type="password" name="pass" id="pwd">
						<span class="focus-input100"></span>
					</div>

					<div class="container-login100-form-btn m-t-17">
						<button type="button" id="loginBtn" class="login100-form-btn">
							로그인
						</button>
					</div>

					<div class="w-full text-center p-t-55">
						<span class="txt2">
							MORIP 회원이 아니십니까?&nbsp;
						</span>


						<a id="writeBtn" class="txt2 bo1" style="cursor: pointer;">
							  회원가입
						</a>
						<br><br>
						<a href="#" class="txt2 bo1 m-l-5" id="idFindBtn">
							아이디 찾기
						</a>
						
						&nbsp;&nbsp;&nbsp;<img src="../image/line.jpg">&nbsp;&nbsp;
						
						<a href="#" class="txt2 bo1 m-l-5" id="pwdFindBtn">
							비밀번호 찾기
						</a>
					</div>
					
				</form>
			</div>
		</div>
	</div>
	

	<div id="dropDownSelect1"></div>
	
<!--===============================================================================================-->
	<script src="../vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="../vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="../vendor/bootstrap/js/popper.js"></script>
	<script src="../vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="../vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="../vendor/daterangepicker/moment.min.js"></script>
	<script src="../vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="../vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="../js/login.js"></script>
<!--===============================================================================================-->
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="http://developers.kakao.com/sdk/js/kakao.min.js"></script>\
<script src="https://apis.google.com/js/platform.js?onload=init" async defer></script>
<script type="text/javascript">
var email = null;
var pwd = null;
$('#kakaoLoginBtn').click(function(){
	Kakao.init("9de483e18225043b33859dd6ffca7770");
	
	Kakao.Auth.loginForm({
		success : function(authObj) {
			Kakao.API.request({
				url : "/v2/user/me",
				success : function(res) {
					email = res.kakao_account.email;
					$.ajax({
						type : 'post',
						url : '/morip/member/snsLogin',
						data : 'email=' + email,
						dataType : 'json',
						success : function(data) {
							if (data.memberDTO != null) {
								location.href = '../main/index';
							} else {
								if(confirm("존재하지 않는 회원입니다.\n가입을 원하시면 '예'를 눌러주세요")){
									location.href = '../member/write';
								}else{
									location.href = '../member/loginForm';
								}
							}
						},
						error : function(err) {
							console.log(err);
						}
					});//ajax 카카오 로그인
				},
				fail : function(err) {
					console.log(err);
				}
			});//카카오 API
		},
		fail : function(err) {
			console.log(err);
		}
	});//카카오 로으인Form
});//카카오 로그인

function checkLoginStatus(){
	var profile = gauth.currentUser.get().getBasicProfile();
	email = profile.getEmail();
	console.log(email);
	$.ajax({
		type : 'post',
		url : '/morip/member/snsLogin',
		data : 'email=' + email,
		dataType : 'json',
		success : function(data) {
			if (data.memberDTO != null) {
				location.href = '../main/index';
			} else {
				if(confirm("존재하지 않는 회원입니다.\n가입을 원하시면 '예'를 눌러주세요")){
					location.href = '../member/write';
				}else{
					location.href = '../member/loginForm';
				}
			}
		},
		error : function(err) {
			console.log(err);
		}
	});//ajax 구글 로그인
}
function init(){
gapi.load('auth2', function() {
	window.gauth = gapi.auth2.init({
		client_id:'933927228947-g09bncfnaucsa1bved6o6p0268mjfh6a.apps.googleusercontent.com'
	})
    gauth.then(function(){
    	console.log('googleAuth success');
    }, function(){
    	console.log('googleAuth fail');
    });
});
}

$('#loginBtn').click(function(){
	email = $('#email').val();
	pwd = $('#pwd').val();
	$.ajax({
		type : 'post',
		url : '/morip/member/emailLogin',
		data : {'email' : email,
				'pwd' : pwd},
		dataType : 'json',
		success : function(data) {
			if (data.memberDTO != null && data.passMatch == true) {
				location.href = '../main/index';
			} else {
				alert("아이디 또는 비밀번호가 일치하지 않습니다.");
				location.href = '../member/loginForm';
			}
		},
		error : function(err) {
			console.log(err);
		}
	});//ajax 이메일 로그인
});

$('#writeBtn').click(function(){
	location.href = '../member/write';
});//회원가입

$('#idFindBtn').click(function(){
	location.href = '../member/idFindForm';
});//id 찾기

$('#pwdFindBtn').click(function(){
	location.href = '../member/pwdFindForm';
});//pwd 찾기
</script>
</body>
</html>