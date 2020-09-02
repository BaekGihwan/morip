<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
<meta charset="utf-8">
<title>view</title>
<!--hover.css-->
<link href="../css/hover.css" rel="stylesheet" />
<!-- jQuery -->
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.13.0/js/all.js"
	crossorigin="anonymous"></script>
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<!-- 구글 폰트 -->
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@700&display=swap"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" href="../css/myblog/view.css">
<style>
	#hashtagDiv{
		color:blue;
	}
	#backBtnWrapper{
	 width:100%;
	 height:50px;
	 display:flex;
	 justify-content: center;
	}
	#previousBtn{
		width:100px;
		height:30px;
		border:1px solid gray;
	}
</style>
</head>

<body>
<form name="previewForm">
<input type="hidden" id="startdate">
	<div id="viewheader">
		<div class="background">
			<div class="backgroundImg"
				style="background: url('../storage/${backgroundImg}') no-repeat 50% 50%; background-size: cover;">
			</div>
			<div class="backgroundCover"></div>
		</div>
		<div class="subjectbackground">
			<div class="blogSubjectWrapper">
				<div class="dateWrapper" id="dateWrapper">${startdate} ~
					${enddate}</div>
				<div class="subjectWrapper">${subject}</div>
				<div class="userinfowrapper">
					<img class="view_userImg" src="../storage/${memberDTO.image }">
					<div class="view_userId" style="cursor:default;" id="view_userId">${memberDTO.nickname}</div>
				</div>
			</div>
		</div>
	</div>
	<article class="contentContainer">
		<div class="contentWrapper">
			<div class="content">
				<div class="contentInner" id="content">
				
				</div>
				<div class="view_boardOption">
					<div class="view_reply">
						<div class="view_replyWrapper">

						</div>
					</div>
				</div>
				<div id="backBtnWrapper">
					<button id="previousBtn" class="btn btn-outline-secondary"
						style="font-size: 13px; border-radius: 20px; border: 1px solid gray; margin: 5px; width: 30%; height: 40px; outline:none;">확인</button>
				</div>
			</div>
		</div>
	</article>

</form>
</body>
<!-- sweetAlert -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script>
$(document).ready(function(){
	opener.parent.updateContent();
});
$('#previousBtn').click(function(){
	window.close();
});
</script>
</html>

