<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
<meta charset="utf-8">
<!-- full calender API -->
<link href='../js/myblog/packages/core/main.css' rel='stylesheet' />
<link href='../js/myblog/packages/daygrid/main.css' rel='stylesheet' />
<link href='../js/myblog/packages/timegrid/main.css' rel='stylesheet' />
<link href='../js/myblog/packages/list/main.css' rel='stylesheet' />
<script src='../js/myblog/packages/core/main.js'></script>
<script src='../js/myblog/packages/interaction/main.js'></script>
<script src='../js/myblog/packages/daygrid/main.js'></script>
<script src='../js/myblog/packages/timegrid/main.js'></script>
<script src='../js/myblog/packages/list/main.js'></script>

<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.13.0/js/all.js"
	crossorigin="anonymous"></script>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<!--AOS 라이브러리-->
<link rel="stylesheet" href="https://unpkg.com/aos@2.3.1/dist/aos.css" />
<!--hover.css-->
<link href="../css/hover.css" rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="../css/myblog/writeBlog.css" rel="stylesheet" />
<!-- CSS only -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">
<link href="../css/myblog/step2.css" rel="stylesheet" />

<!-- JS, Popper.js, and jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
	integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
	crossorigin="anonymous"></script>
<title></title>
</head>
<body>
	<form method="post" id="writeBlogForm" name="writeBlogForm"
		enctype="multipart/form-data" action="">
		<article class="contentWrapper">
			<!-- 일정에 대한 안내문구를 나타낼 div영역 -->
			<div id="infoIcon" style="cursor:pointer"><i class="fas fa-exclamation-circle" id="exclamation-circle"></i></div>
			<div id="infoBoxWrapper">
				<div id="infoBox">
					기록할 여행의 날짜를<br> 드래그로 입력해 보세요!
				</div>
			</div>
			<div class="content">
				<div class="writeEditor">
					<!--상태 진행 바-->
					<div class="contentHeader" style="">에세이 작성</div>
					<div class="stepBarWrapper">
						<input type="hidden" id="stepPg" value="0">
						<div class="step1">
							<div class="stepHeader">STEP1</div>
							<div class="stepContent">여행 일정 등록</div>
						</div>
						<div class="step2">
							<div class="stepHeader">STEP2</div>
							<div class="stepContent">에세이 제목과 배경설정</div>
						</div>
						<div class="step3">
							<div class="stepHeader">STEP3</div>
							<div class="stepContent">에세이 내용 작성</div>
						</div>
					</div>
					<!--본격적인 에디터 본문-->
					<div class="editorContentWrapper">
						<div class="editorContent">
							<div id="calendarWrapper">
								<div id='calendar' style="height: 600px;"></div>
							</div>
						</div>
					</div>
				</div>
				<div class="writeOption">
					<div class="stepChoiceWrapper">
						<div class="hvr-forward" id="forwardBtn">
							<div class="stepChoiceContent">다 음</div>
						</div>
					</div>
				</div>
			</div>
		</article>

	</form>
</body>
<!-- sweetAlert -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>

<!-- Bootstrap core JS-->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js"></script>
<!-- Third party plugin JS-->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
<!--AOS 라이브러리-->
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<!-- Core theme JS-->
<script src="../js/myblog/writeBlog.js"></script>
<script src="../js/myblog/writeBlog0.js"></script>

<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
</html>
>
