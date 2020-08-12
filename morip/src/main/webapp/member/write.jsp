<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
<!--===============================================================================================-->	
<link rel="stylesheet" type="text/css" href="../css/write.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
<!--===============================================================================================-->	
</head>
<body>
<div class="container-write">

	<span class="semiWriteTitle"> 회원가입 </span>
		<!-- <hr align="center" width="400px" size="4" color="black"> -->
		<div class="hr"></div>
		<span class="semiWriteText">
			여행지에서의 추억과 행복한 순간을<br>
			MORIP과 함께  나누세요
		</span>
		
		<div class="container-semiWriteBtn">
			<button class="semiWriteBtn" id="writeEmail">이메일로 가입하기</button>
		</div>
		
		<br>
		
		 <div type="button" class="semiWriteBtn-email">
			<button class="btn-kakao">
				<img height="70px" width="400px"  src="../image/kakaoBtn.png" alt="KAKAO" id="writeKakao"/>
			</button>
			<br>
			<button type="button" class="btn-google">
				<img height="65px" width="400px"  src="../image/googlBtn.png" alt="GOOGLE" id="writeGoogle"
					onclick="
					gauth.signIn().then(function(){
						console.log('gauth.signIn()');
						checkLoginStatus();
					});
				"/>
			</button>
		</div>
</div>
<br>
<br>

<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="http://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script src="https://apis.google.com/js/platform.js?onload=init" async defer></script>
<script type="text/javascript">
var email=null;

$('#writeKakao').click(function(){
	Kakao.init("9de483e18225043b33859dd6ffca7770");
	
	Kakao.Auth.loginForm({
		success : function(authObj) {
			Kakao.API.request({
				url : "/v2/user/me",
				success : function(res) {
					email = res.kakao_account.email;
					$.ajax({
			    		type : 'post',
			    		url : '/morip/member/checkId',
			    		data : '&email=' + email,
			    		dataType : 'json',
			    		success : function(data) {
			    			if (data.memberDTO == null) {
			    				$.ajax({
									type : 'post',
									url : '/morip/member/kakaoWrite',
									data : 'email=' + email,
									dataType : 'text',
									success : function(data) {
										location.href = data;
									},
									error : function(err) {
										console.log(err);
									}
								});//ajax 카카오
			    			} else {
			    				alert("존재하는 아이디입니다.");
			    				location.href = "../member/loginForm.jsp";
			    			}
			    		},
			    		error : function(err) {
			    			console.log(err);
			    		}
			    	});
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
});

function checkLoginStatus(){
		var profile = gauth.currentUser.get().getBasicProfile();
		email = profile.getEmail();
		$.ajax({
    		type : 'post',
    		url : '/morip/member/checkId',
    		data : '&email=' + email,
    		dataType : 'json',
    		success : function(data) {
    			if (data.memberDTO == null) {
    				$.ajax({
    					type : 'post',
    					url : '/morip/member/googleWrite',
    					data : 'email=' + email,
    					dataType : 'text',
    					success : function(data) {
    						location.href = data;
    					},
    					error : function(err) {
    						console.log(err);
    					}
    				});//ajax 구글
    			} else {
    				alert("존재하는 아이디입니다.");
    				location.href = "../member/loginForm.jsp";
    			}
    		},
    		error : function(err) {
    			console.log(err);
    		}
    	});
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

$('#writeEmail').click(function(){
	location.href = "../member/emailWriteForm";
});

</script>
</body>
